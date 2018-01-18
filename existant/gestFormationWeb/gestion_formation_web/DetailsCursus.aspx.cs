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
    }
}