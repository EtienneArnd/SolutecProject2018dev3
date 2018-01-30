using gestion_formation_web.dto;
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
                    btnRetourListeCursus.Text = "Retour ves la liste des cursus " + leCursus.nom;
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
            int idStagiaire = Convert.ToInt32(ddlAjouterStagiaire.SelectedValue);
            dto.DtoSessionCursus.AddStagiaire(idSessionCursus, idStagiaire);            
            gvStagiaires.DataBind();
            ddlAjouterStagiaire.DataBind();
            Response.Redirect(Request.RawUrl);
        }

        protected void gvStagiaires_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            System.Collections.Specialized.IOrderedDictionary valeurs = e.Values;
            //int idFormateur = Convert.ToInt32(valeurs["id_formateur"]);
            int idStagiaire = (int)gvStagiaires.DataKeys[e.RowIndex].Value;
            dto.DtoSessionCursus.RemoveStagiaireFromSession(idStagiaire, idSessionCursus);
            //gvFormateurs.DeleteRow(e.RowIndex);
            Response.Redirect(Request.RawUrl);
        }

        protected void gvStagiaires_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            int idx = (int)e.Keys[0];
            gvStagiaires.DataBind();
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

        protected void btnRetourListeCursus_Click(object sender, EventArgs e)
        {
            session_cursus sessionCursus = dto.DtoSessionCursus.Get(idSessionCursus);
            Response.Redirect(string.Format("~/ListeSessionsCursus.aspx?idCursus={0}", sessionCursus.id_cursus));
        }

                protected void ddlOrdre_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            //On récupère: la dropdownlist, la ligne du gridview qui la contient et l'id de la formation correspondante, puis la formation elle-même
            DropDownList ddl = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddl.NamingContainer;
            Label lblIdSessionFormation = (Label)row.FindControl("lblIdSessionFormation");
            int idSessionFormationADecaler = int.Parse(lblIdSessionFormation.Text);
            session_formation sessionFormationADecaler = DtoSessionFormation.Get(idSessionFormationADecaler);

            //On récupère l'ordre actuel de la formation à décaler ainsi que l'ordre souhaité
            int ordreActuel = (int)sessionFormationADecaler.ordre;
            int ordreSouhaite = int.Parse(ddl.Text);

            //Le multiplicateurOrdre sert à distinguer les cas où on veut décaler l'ordre vers le haut ou vers le bas; il vaut +/-1
            int multiplicateurOrdre = 0;
            int compteur;

            if (ordreSouhaite != ordreActuel)
            {
                if (ordreSouhaite > ordreActuel)
                {
                    multiplicateurOrdre = 1;
                }
                else if (ordreSouhaite < ordreActuel)
                {
                    multiplicateurOrdre = -1;
                }
                compteur = ordreActuel + multiplicateurOrdre;
                //On décale toutes les formations dont l'ordre est compris entre l'ancien (exclus) et le nouvel ordre (inclus) de la formation à décaler
                do
                {
                    session_formation sessionFormation = DtoSessionFormation.GetByOrder(idSessionCursus, compteur);
                    sessionFormation.ordre = sessionFormation.ordre - multiplicateurOrdre;
                    DtoSessionFormation.Modifier(sessionFormation);
                    compteur = compteur + multiplicateurOrdre;
                }
                while (compteur != ordreSouhaite + multiplicateurOrdre);
                //On affecte le nouvel ordre à la formation à décaler, on sauvegarde en BDD et on rafraichit la page
                sessionFormationADecaler.ordre = ordreSouhaite;
                DtoSessionFormation.Modifier(sessionFormationADecaler);
                Response.Redirect(Request.RawUrl);
            }
            else if (ordreSouhaite == ordreActuel)
            {
                lblMemeOrdre.Visible = true;
            }
        }
    }
}