using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gestion_formation_web
{
    public partial class ListeFormation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ModifierFormation_Command(object sender, CommandEventArgs e)
        {
            String id = e.CommandArgument.ToString();
            int idFormation = int.Parse(id);
            Response.Redirect("CreationModificationFormation.aspx?idFormation="+idFormation);
        }

        protected void gvFormations_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCreerFormation_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreationModificationFormation.aspx?idFormation=" +0);
        }
    }
}