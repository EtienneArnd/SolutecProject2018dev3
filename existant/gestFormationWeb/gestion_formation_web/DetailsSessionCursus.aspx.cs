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
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            String id = Request["id_session_cursus"];
            if (String.IsNullOrEmpty(id))
            {
                if (String.IsNullOrEmpty(Request["idCursus"]))
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
                    lblTitrePage.Text = "Nouvelle session du cursus " + leCursus.nom;
                }
                catch
                {
                    Response.Write("Page mal appelée : id session cursus requis");
                    Response.End();
                }
                    pnlDetails.Visible = false;               
            }
            else
            {
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
                    
                    lblTitrePage.Text = "Session Cursus " + sessionCursus.cursus.nom  + " : "+ sessionCursus.nom;
                    tbxNom.Text = sessionCursus.nom;
                    if (sessionCursus.date_debut != null)
                    {
                        DateTime date = (DateTime)sessionCursus.date_debut;
                        tbxDateSessionCursus.Text = date.ToString(DateTimeFormatInfo.CurrentInfo.ShortDatePattern);
                        lblTitrePage.Text += " du " + tbxDateSessionCursus.Text;
                    }
                    pnlDetails.Visible = true;
                }
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
            pnlDetails.Visible = true;
        }

        protected void btnAjouterStagiaire_Click(object sender, EventArgs e)
        {
            // TODO
            Console.WriteLine("btnAjouterStagiaire_Click not implemented #TODO");
        }
    }
}