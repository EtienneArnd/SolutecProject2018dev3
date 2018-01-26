﻿using gestion_formation_web.dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace gestion_formation_web
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        int idFormation;

        public object MessageBox { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
                String idFormationString = Request["idFormation"];
                this.idFormation = int.Parse(idFormationString);
           if (!Page.IsPostBack)
           {
                if (idFormation != 0)
                {
                    formation formation = DtoFormation.Get(idFormation);
                    tbxNom.Text = formation.intitule;
                    tbxDuree.Text = formation.duree.ToString();
                    tbxTarif_intra.Text = formation.tarif_intra.ToString();
                    tbxTarif_unitaire.Text = formation.tarif_inter.ToString();
                    ddlNiveau.SelectedValue = formation.niveau;
                    ddlTheme.SelectedValue = formation.id_theme.ToString();
                }
            }
        }


        //Obligation d'avoir un thème et un nom non vides et des valeurs numériques du bon type
        protected void btnValider_Click(object sender, EventArgs e)
        {
            formation formation = new formation();
            bool choixCorrect = true;

            // Test sur la durée (s'agit-il bien d'un entier? Compris entre 1 et 10 jours?) 
            if (!string.IsNullOrEmpty(tbxDuree.Text))
            {
                try
                {
                    int duree = int.Parse(tbxDuree.Text);
                    if (duree > 10)
                    {
                        lblDureeEntiere.Visible = true;
                        choixCorrect = false;
                    }
                    else
                    {
                        formation.duree = int.Parse(tbxDuree.Text);
                        lblDureeEntiere.Visible = false;
                    }
                }
                catch
                {
                    lblDureeEntiere.Visible = true;
                    choixCorrect = false;
                }
            }

            // Test sur le tarif intra (s'agit-il bien d'un décimal?)
            if (!string.IsNullOrEmpty(tbxTarif_intra.Text))
            {
                try
                {
                    formation.tarif_intra = Convert.ToDecimal(tbxTarif_intra.Text);
                    lblTarif_IntraNombre.Visible = false;
                }
                catch
                {
                    lblTarif_IntraNombre.Visible = true;
                    choixCorrect = false;
                }
            }

            // Test sur le tarif unitaire (s'agit-il bien d'un décimal?)
            if (!string.IsNullOrEmpty(tbxTarif_unitaire.Text))
            {
                try
                {
                    formation.tarif_inter = Convert.ToDecimal(tbxTarif_unitaire.Text);
                    lblTarif_UnitaireNombre.Visible = false;
                }
                catch
                {
                    lblTarif_UnitaireNombre.Visible = true;
                    choixCorrect = false;
                }
            }

            // Test sur le nom et le thème (Les champs sont-ils bien remplis?)
            if (string.IsNullOrEmpty(tbxNom.Text))
            {
                lblNomObligatoire.Visible = true;
                choixCorrect = false;
            }

             if (choixCorrect == true)
            {
                formation.intitule = tbxNom.Text;
                formation.niveau = ddlNiveau.SelectedValue;
                formation.id_theme = Convert.ToInt32(ddlTheme.SelectedValue);
                if (idFormation == 0)
                {
                    DtoFormation.Add(formation);
                    lblFormationCreee.Visible = true;
                    //Response.Redirect("CreationModificationFormation.aspx?idFormation=" + 0);
                    tbxNom.Text = "";
                    tbxDuree.Text = "";
                    tbxTarif_intra.Text = "";
                    tbxTarif_unitaire.Text = "";
                }
                else
                {
                    formation.id_formation = idFormation;
                    DtoFormation.Modifier(formation);
                    Response.Redirect("ListeFormation.aspx");
                }

            }
            
        }

        protected void btnAnnuler_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListeFormation.aspx");
        }

    }
}