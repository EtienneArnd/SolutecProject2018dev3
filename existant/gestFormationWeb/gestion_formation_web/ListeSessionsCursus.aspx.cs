﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gestion_formation_web
{
    public partial class ListeSessionsCursus : System.Web.UI.Page
    {
        int idCursus = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            String id = Request["idCursus"];
            if (String.IsNullOrEmpty(id))
            {
                idCursus = 0 ;
            }
            try
            {
                idCursus = int.Parse(id);
            }
            catch
            {
                idCursus = 0; ;
            }
            if (idCursus != 0)
            {
                cursus leCursus = dto.DtoCursus.Get(idCursus);
                if (leCursus != null)
                {
                    lblTitrePage.Text += " " + leCursus.nom;
                }                }

            }

        protected void btnAjouterSessionCursus_Click(object sender, EventArgs e)
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
            Response.Redirect("DetailsSessionCursus.aspx?idCursus="+idCursus);
        }
    }
}