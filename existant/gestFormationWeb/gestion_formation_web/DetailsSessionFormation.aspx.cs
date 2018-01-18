using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gestion_formation_web
{
    public partial class DetailsSessionFormation : System.Web.UI.Page
    {
        protected int idSessionFormation;
        protected void Page_Load(object sender, EventArgs e)
        {
            String id = Request["idSessionFormation"];
            if (String.IsNullOrEmpty(id))
            {
                Response.Write("Page mal appelée : id session formation requis");
                Response.End();
            }
            try
            {
                idSessionFormation = int.Parse(id);
            }
            catch
            {
                Response.Write("Page mal appelée : id session formation requis");
                Response.End();
            }
            if (idSessionFormation != 0)
            {
                session_formation sessionFormation = dto.DtoSessionFormation.Get(idSessionFormation);
                if (sessionFormation == null)
                {
                    Response.Write("Anomalie : Session de formation introuvable pour id = " + idSessionFormation);
                    Response.End();

                }
                lblTitrePage.Text = "Formation " + sessionFormation.formation.intitule;
                DateTime dateDebut = DateTime.MinValue;
                if (sessionFormation.date_debut != null)
                {
                    dateDebut = (DateTime)sessionFormation.date_debut;
                    lblTitrePage.Text += " du " + dateDebut.ToString(System.Globalization.DateTimeFormatInfo.CurrentInfo.ShortDatePattern);
                }
                if (!IsPostBack)
                {
                    tbxIntitule.Text = sessionFormation.formation.intitule;
                    tbxDateDebut.Text = (dateDebut == DateTime.MinValue) ? "" : dateDebut.ToShortDateString();
                    DateTime dateFin = DateTime.MinValue;
                    if (sessionFormation.date_fin != null)
                    {
                        tbxDateFin.Text = ((DateTime)sessionFormation.GetDateFin()).ToShortDateString();
                    }
                    tbxOrdre.Text = sessionFormation.ordre.ToString();
                }
            }
            if (!IsPostBack)
            {
                DataTable dataTable = new DataTable();
                dataTable.Columns.Add(new DataColumn("id_formateur", 1.GetType()));
                dataTable.Columns.Add(new DataColumn("nomPrenom", System.Type.GetType("System.String")));

                IEnumerable<formateur> formateurs = dto.DtoFormateur.Get();

                foreach (formateur unFormateur in formateurs)
                {
                    DataRow dr = dataTable.NewRow();
                    dr.SetField<int>("id_formateur", unFormateur.id_formateur);
                    dr.SetField<string>("nomPrenom", unFormateur.GetNomPrenom());
                    dataTable.Rows.Add(dr);
                }
                ddlFormateurs.DataSource = dataTable;
                ddlFormateurs.DataValueField = "id_formateur";
                ddlFormateurs.DataTextField = "nomPrenom";
                ddlFormateurs.DataBind();
            }
        }

        protected void btnAjouterFormateur_Click(object sender, EventArgs e)
        {
            int idFormateur = Convert.ToInt32(ddlFormateurs.SelectedValue);
            string strDate = tbxDateFormateur.Text;
            formateur leFormateur = dto.DtoFormateur.Get(idFormateur);
            session_formation sessionFormation = dto.DtoSessionFormation.Get(idSessionFormation);

            DateTime date = DateTime.MinValue;
            if (!string.IsNullOrEmpty(strDate))
            {
                date = Convert.ToDateTime(strDate);
            }
            dto.DtoSessionFormation.Add(sessionFormation, leFormateur, date);
            gvFormateurs.DataBind();
            upFormateurs.Update();
        }

        protected void gvFormateurs_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            System.Collections.Specialized.IOrderedDictionary valeurs = e.Values;
            int idFormateur = Convert.ToInt32(valeurs["id_formateur"]);
            dto.DtoSessionFormation.Remove(idFormateur, idSessionFormation);
            gvFormateurs.DeleteRow(e.RowIndex);

        }

        protected void gvFormateurs_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            int idx = (int)e.Keys[0];
            gvFormateurs.DataBind();
            upFormateurs.Update();
        }
    }
}