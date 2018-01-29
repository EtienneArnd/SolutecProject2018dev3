using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gestion_formation_web
{
    public partial class DetailsSessionCursus : System.Web.UI.Page
    {
        int idSessionCursus;
        int idCursus;
        bool CreateOrEdit; //Create=true, edit=false
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            String id = Request["id_session_cursus"];
            CreateOrEdit = true;
            if (String.IsNullOrEmpty(id))
            {
                // Cas d'appel sans id de sessionCursus
                // -> Tentative de création d'une nouvelle session cursus
                if (String.IsNullOrEmpty(Request["idCursus"]))// Verification de l'id du cursus dont une sessio est a créer
                {
                    Response.Write("Page mal appelée : id cursus requis");
                    Response.End();
                }
                try
                {
                    idCursus = int.Parse(Request["idCursus"]);
                    cursus leCursus = dto.DtoCursus.Get(idCursus);
                    if (leCursus == null)
                    {
                        Response.Write("Anomalie : Cursus introuvable pour id = " + idCursus);
                        Response.End();

                    }
                    //id reconnu: création de la session cursus prete à validation
                    lblTitrePage.Text = "Nouvelle session du cursus " + leCursus.nom;
                    switchMode();
                }
                catch
                {
                    Response.Write("Page mal appelée : id session cursus requis");
                    Response.End();
                }
            }
            else
            {
                // Chargement des infos de la session cursus
                try
                {
                    idSessionCursus = int.Parse(id);
                }
                catch
                {
                    Response.Write("Page mal appelée : id session cursus requis");
                    Response.End();
                }
                if (idSessionCursus != 0)
                {
                    session_cursus sessionCursus = dto.DtoSessionCursus.Get(idSessionCursus);
                    if (sessionCursus == null)
                    {
                        Response.Write("Anomalie : Session Cursus introuvable pour id = " + idSessionCursus);
                        Response.End();
                    }

                    lblTitrePage.Text = "Session Cursus " + sessionCursus.cursus.nom + " : " + sessionCursus.nom;
                    tbxNom.Text = sessionCursus.nom;
                    if (sessionCursus.date_debut != null)
                    {
                        DateTime date = (DateTime)sessionCursus.date_debut;
                        tbxDateSessionCursus.Text = date.ToString(DateTimeFormatInfo.CurrentInfo.ShortDatePattern);
                        lblTitrePage.Text += " du " + tbxDateSessionCursus.Text;
                    }
                    CreateOrEdit = false;
                }
                switchMode();
            }
        }
        public void RenvoyerFichier(String nomFichier)
        {
            try
            {
                //            return "hi "+idSessionFormation;
                // return le doc word généré
                System.IO.FileInfo file = new System.IO.FileInfo(nomFichier);

                if (file.Exists)
                {
                    Response.Clear();
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                    Response.AddHeader("Content-Length", file.Length.ToString());
                    Response.ContentType = "application/octet-stream";
                    Response.WriteFile(file.FullName);
                    Response.TransmitFile(file.FullName);
                    Response.Flush();
                }
            }
            catch
            {
                Response.Clear();
                String msg = "Pb de génération de doc word";
                Response.AddHeader("Content-Length", msg.Length.ToString());
                Response.ContentType = "text/plain";
                Response.Write("Pb de génération de doc word");
            }
            Response.End();

        }
        protected void AffecterFormateur_Command(object sender, CommandEventArgs e)
        {
            String id = e.CommandArgument.ToString();
            int idSessionFormation = int.Parse(id);
        }

        protected void GenererFeuillesEvaluation_Command(object sender, CommandEventArgs e)
        {
            String id = e.CommandArgument.ToString();
            int idSessionFormation = int.Parse(id);
            String nomFichierFeuillesEvaluation = dto.Publipostage.CreateFeuillesEvaluation(idSessionFormation);
            RenvoyerFichier(nomFichierFeuillesEvaluation);
        }
        protected void GenererFeuillesEmargement_Command(object sender, CommandEventArgs e)
        {
            String id = e.CommandArgument.ToString();
            int idSessionFormation = int.Parse(id);
            // générer les feuille de présence de la session par société
            String nomFichierFeuillesEmargement = dto.Publipostage.CreateFeuillesEmargement(idSessionFormation);
            RenvoyerFichier(nomFichierFeuillesEmargement);
        }

        protected void btnCalculerDateSession_Click(object sender, EventArgs e)
        {
            dto.DtoSessionCursus.CalculerDatesSessionsFormationCursus(idSessionCursus);
            gvSessionsFormation.DataBind();
            gvStagiaires.DataBind();

        }

        protected void btnCreerSessionCursus_Click(object sender, EventArgs e)
        {
            session_cursus sessionCursus = new session_cursus
            {
                nom = tbxNom.Text,
                cursus = dto.DtoCursus.Get(idCursus)
            };
            DateTime dateDebut = DateTime.MinValue;
            if (!string.IsNullOrEmpty(tbxDateSessionCursus.Text))
            {
                dateDebut = Convert.ToDateTime(tbxDateSessionCursus.Text);
            }
            sessionCursus.date_debut = dateDebut;

            dto.DtoSessionCursus.Add(sessionCursus);
            DataBind();

            sessionCursus.session_formation = dao.DaoSessionFormation.GetSessionsFormation(sessionCursus.id_session_cursus).ToList();
            Response.Redirect(string.Format("~/DetailsSessionCursus.aspx?id_session_cursus={0}", sessionCursus.id_session_cursus));
        }

        protected void btnAjouterStagiaire_Click(object sender, EventArgs e)
        {
            // TODO
            Console.WriteLine("btnAjouterStagiaire_Click not implemented #TODO");
        }

        protected void switchMode()
        {
            if (CreateOrEdit)
            {
                PnlCreate.Visible = true;
                pnlDetails.Visible = false;
                PnlStagiaire.Visible = false;
            }
            else
            {
                PnlCreate.Visible = false;
                pnlDetails.Visible = true;
                PnlStagiaire.Visible = true;
            }
            CreateOrEdit = !CreateOrEdit;
        }
    }
}