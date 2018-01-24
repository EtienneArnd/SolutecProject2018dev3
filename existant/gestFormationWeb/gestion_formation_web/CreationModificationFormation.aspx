<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreationModificationFormation.aspx.cs" Inherits="gestion_formation_web.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 215px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       
        <asp:Label ID="lblTitre" runat="server" Text="Créer une formation"></asp:Label><br />
        <asp:Label ID="lblNom" runat="server" Text="Nom de la formation"></asp:Label>
        <asp:TextBox ID="tbxNom" runat="server"></asp:TextBox>
        <asp:Label ID="lblNomObligatoire" runat="server" Text="Champ obligatoire" Visible="False"></asp:Label><br />

        <asp:Label ID="lblDuree" runat="server" Text="Durée de la formation"></asp:Label>
        <asp:TextBox ID="tbxDuree" runat="server"></asp:TextBox>
        <asp:Label ID="lblDureeEntiere" runat="server" Text="Veuillez entrez un nombre entier de journées" Visible="False"></asp:Label>
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
        <asp:Button ID="btnAnnuler" runat="server" Text="Annuler" />
        
    </form>
</body>
</html>
