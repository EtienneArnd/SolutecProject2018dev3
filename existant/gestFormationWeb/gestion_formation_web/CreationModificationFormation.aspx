﻿<%@ Page Title="Creation Modification Formation" Language="C#"  MasterPageFile="~/pageMaitre.Master" AutoEventWireup="true" CodeBehind="CreationModificationFormation.aspx.cs" Inherits="gestion_formation_web.WebForm1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
        <asp:Label ID="lblTitre" runat="server" Text="Créer ou modifier une formation"></asp:Label><br />
        <asp:Label ID="lblFormationCreee" runat="server" Text="La formation a bien été créée" Visible="False"></asp:Label><br />
        <asp:Label ID="lblNom" runat="server" Text="Nom de la formation" />
        <asp:TextBox ID="tbxNom" runat="server" />
        <asp:Label ID="lblNomObligatoire" runat="server" Text="Champ obligatoire" Visible="False" /><br />

        <asp:Label ID="lblDuree" runat="server" Text="Durée de la formation"></asp:Label>
        <asp:TextBox ID="tbxDuree" runat="server"></asp:TextBox>
        <asp:Label ID="lblDureeEntiere" runat="server" Text="Veuillez entrez un nombre entier de journées entre 1 et 10" Visible="False"></asp:Label>
        <br />

        <asp:Label ID="lblTarif_intra" runat="server" Text="Tarif intra de la formation"></asp:Label>
        <asp:TextBox ID="tbxTarif_intra" runat="server"></asp:TextBox>
        <asp:Label ID="lblTarif_IntraNombre" runat="server" Text="Veuillez entrer un nombre décimal" Visible="False"></asp:Label>
        <br />

        <asp:Label ID="lblTarif_unitaire" runat="server" Text="Tarif unitaire de la formation"></asp:Label>
        <asp:TextBox ID="tbxTarif_unitaire" runat="server"></asp:TextBox>
        <asp:Label ID="lblTarif_UnitaireNombre" runat="server" Text="Veuillez entrer un nombre décimal" Visible="False"></asp:Label>
        <br />


        <asp:Label ID="lblNiveau" runat="server" Text="Niveau de la formation"></asp:Label>
        <asp:DropDownList ID="ddlNiveau" runat="server">
            <asp:ListItem Selected="True">Base</asp:ListItem>
            <asp:ListItem>Moyen</asp:ListItem>
            <asp:ListItem Value="Confirm">Confirmé</asp:ListItem>
            <asp:ListItem>Expert</asp:ListItem>
        </asp:DropDownList>
        <br />

        <asp:Label ID="lblTheme" runat="server" Text="Theme de la formation"></asp:Label>
        <asp:DropDownList ID="ddlTheme" runat="server" DataTextField="nom" DataValueField="id_theme" DataSourceID="odsListeThemes">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="odsListeThemes" runat="server" SelectMethod="Get" TypeName="gestion_formation_web.dto.DtoTheme"></asp:ObjectDataSource>
        <br />
    
        <asp:Button ID="btnValider" runat="server" Text="Valider" OnClick="btnValider_Click" />
        <a href="ListeFormation.aspx"><input type="button" value="Retour à la liste des formations" /></a>
        
</asp:Content>