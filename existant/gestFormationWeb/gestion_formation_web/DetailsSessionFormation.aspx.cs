using gestion_formation_web.dto;
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
                btnVoirCursus.Enabled = sessionFormation.id_session_cursus!=null;
                DateTime dateDebut = DateTime.MinValue;
                if (sessionFormation.date_debut != null)
                {
                    dateDebut = (DateTime)sessionFormation.date_debut;
                    lblTitrePage.Text += " du " + dateDebut.ToString(System.Globalization.DateTimeFormatInfo.CurrentInfo.ShortDatePattern);
                }
                if (!IsPostBack)
                {
                    tbxTarifIntra.Text = sessionFormation.tarif_intra+"";
                    tbxDateDebut.Text = (dateDebut == DateTime.MinValue) ? "" : dateDebut.ToShortDateString();
                    // GetDateFin renvoie la date définie en base s'il y en a une, sinon, renvoie la date de fin présumée/calculée
                    tbxDateFin.Text = ((DateTime)sessionFormation.GetDateFin()).ToShortDateString(); 
                    tbxOrdre.Text = sessionFormation.ordre.ToString();
                    IEnumerable<CoupletNomValeur> listeTypes = DtoSessionFormation.getTypesFormation();
                    ddlTypeSessionFormation.Items.Add("");
                    foreach (CoupletNomValeur type in listeTypes)
                    {
                        ddlTypeSessionFormation.Items.Add((string)type.valeur);
                    }
                    ddlTypeSessionFormation.SelectedValue = sessionFormation.type;
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

        protected void btnAjouterStagiaire_Click(object sender, EventArgs e)
        {
            int idStagiaire = Convert.ToInt32(ddlAjouterStagiaire.SelectedValue);
            dto.DtoSessionFormation.AddStagiaire(idSessionFormation, idStagiaire);
            gvStagiaires.DataBind();
            ddlAjouterStagiaire.DataBind();
        }



        protected void gvFormateurs_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            System.Collections.Specialized.IOrderedDictionary valeurs = e.Values;
            //int idFormateur = Convert.ToInt32(valeurs["id_formateur"]);
            int idFormateur = (int)gvFormateurs.DataKeys[e.RowIndex].Value;
            dto.DtoSessionFormation.RemoveFormateurFromSession(idFormateur, idSessionFormation);
            //gvFormateurs.DeleteRow(e.RowIndex);
            Response.Redirect(Request.RawUrl);

        }

        protected void gvFormateurs_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            int idx = (int)e.Keys[0];
            gvFormateurs.DataBind();
            upFormateurs.Update();
        }

        protected void gvStagiaires_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            System.Collections.Specialized.IOrderedDictionary valeurs = e.Values;
            //int idFormateur = Convert.ToInt32(valeurs["id_formateur"]);
            int idStagiaire = (int) gvStagiaires.DataKeys[e.RowIndex].Value;
            dto.DtoSessionFormation.RemoveStagiaireFromSession(idStagiaire, idSessionFormation);
            //gvFormateurs.DeleteRow(e.RowIndex);
            Response.Redirect(Request.RawUrl);
        }

        protected void gvStagiaires_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            int idx = (int)e.Keys[0];
            gvStagiaires.DataBind();
        }

        protected void btnModifier_Click(object sender, EventArgs e)
        {
            DtoSessionFormation.UpdateSessionFormation(idSessionFormation, tbxDateDebut.Text, tbxDateFin.Text, tbxOrdre.Text, ddlTypeSessionFormation.SelectedValue, tbxTarifIntra.Text);
        }

        protected void btnAnnuler_Click(object sender, EventArgs e)
        {
            tbxDateDebut.Text = "";
            tbxDateFin.Text = "";
            tbxOrdre.Text = "";
            tbxTarifIntra.Text = "";
        }

        protected void BtnVoirListeFormation_Click(object sender, EventArgs e)
        {
            session_formation sessionFormation = DtoSessionFormation.Get(idSessionFormation);
            Response.Redirect(string.Format("~/ListeSessionsFormation.aspx?idFormation={0}", sessionFormation.id_formation));
        }

        protected void btnVoirCursus_Click(object sender, EventArgs e)
        {
            session_formation sessionFormation = DtoSessionFormation.Get(idSessionFormation);
            Response.Redirect(string.Format("~/DetailsSessionCursus.aspx?id_session_cursus={0}", sessionFormation.id_session_cursus));
        }
    }
}