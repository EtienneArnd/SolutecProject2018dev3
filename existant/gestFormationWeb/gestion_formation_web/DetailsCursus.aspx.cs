using gestion_formation_web.dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gestion_formation_web
{
    public partial class DetailsCursus : System.Web.UI.Page
    {
        int idCursus;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
                String id = Request["idCursus"];
                if (String.IsNullOrEmpty(id))
                {
                    Response.Write("Page mal appelée : id cursus requis");
                }
                try
                {
                    idCursus = int.Parse(id);
                }
                catch
                {
                    Response.Write("Page mal appelée : id session cursus requis");
                }
                if (idCursus != 0)
                {
                    cursus leCursus = dto.DtoCursus.Get(idCursus);
                if (leCursus == null)
                {
                    Response.Write("Anomalie : Cursus introuvable pour id = " + idCursus);
                }
                else
                {
                    lblTitrePage.Text = "Cursus " + leCursus.nom;
                }
                }
//            }
        }

        protected void btnAjouterFormation_Click(object sender, EventArgs e)
        {
            int idFormation = int.Parse( ddlFormations.SelectedValue);
            dto.DtoCursus.Add(idCursus, idFormation);
            gvFormations.DataBind();
            ddlFormations.DataBind();
        }
        protected void btnModifierOrdreFormation_Click(object sender, EventArgs e)
        {
            String idCursusString = Request["idCursus"];
            int idCursus = int.Parse(idCursusString);

            int idFormationADecaler = int.Parse(ddlModifierOrdreFormation.SelectedValue);

            formation_cursus formationADecaler = DtoFormationCursus.Get(idCursus, idFormationADecaler);

            int ordreActuel = (int)formationADecaler.ordre;
            int ordreSouhaite = int.Parse(tbxOrdreFormation.Text);
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
                do
                {
                    formation_cursus formationCursus = DtoFormationCursus.GetByOrder(idCursus, compteur);
                    formationCursus.ordre = formationCursus.ordre - multiplicateurOrdre;
                    DtoFormationCursus.Modifier(formationCursus);
                    compteur = compteur + multiplicateurOrdre;
                }
                while (compteur != ordreSouhaite+1);
                formationADecaler.ordre = ordreSouhaite;
                DtoFormationCursus.Modifier(formationADecaler);
            }
            else if (ordreSouhaite==ordreActuel)
            {
                lblMemeOrdre.Visible = true;                
            }
        }
    }
}