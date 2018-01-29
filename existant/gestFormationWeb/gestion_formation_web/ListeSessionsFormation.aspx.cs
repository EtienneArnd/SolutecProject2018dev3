using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gestion_formation_web
{
    public partial class ListeSessionFormation : System.Web.UI.Page
    {
        int idFormation = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            String id = Request["idFormation"];
            if (String.IsNullOrEmpty(id))
            {
                idFormation = 0;
            }
            try
            {
                idFormation = int.Parse(id);
            }
            catch
            {
                idFormation = 0; ;
            }
            if (idFormation != 0)
            {
                formation laFormation = dto.DtoFormation.Get(idFormation);
                if (laFormation != null)
                {
                    lblTitrePage.Text += " " + laFormation.intitule;
                }
            }

        }

        protected void btnAjouterSessionFormation_Click(object sender, EventArgs e)
        {
            session_formation sessionFormation = new session_formation
            {
                formation = dto.DtoFormation.Get(idFormation)
            };
            DateTime dateDebut = DateTime.MinValue;
            if (!string.IsNullOrEmpty(tbxDateSessionFormation.Text))
            {
                dateDebut = Convert.ToDateTime(tbxDateSessionFormation.Text);
            }
            sessionFormation.date_debut = dateDebut;
            formateur formateur = dao.DaoFormateur.Get(int.Parse( ddlFormateur.SelectedValue));

            dto.DtoSessionFormation.Add(sessionFormation,formateur, dateDebut);
            DataBind();
            
            Response.Redirect(string.Format("~/DetailsSessionFormation.aspx?idSessionFormation={0}", sessionFormation.id_session_formation));
        }
    }
}