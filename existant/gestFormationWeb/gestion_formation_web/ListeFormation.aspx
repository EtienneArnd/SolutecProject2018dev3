<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListeFormation.aspx.cs" Inherits="gestion_formation_web.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="gvFormations" runat="server" AutoGenerateColumns="False" DataSourceID="odsFormation" style="float:left;">
        <Columns>
            <asp:BoundField DataField="id_formation" HeaderText="ID formation" SortExpression="id_formation" Visible="False"/>
            <asp:BoundField DataField="intitule" HeaderText="Intitulé" SortExpression="intitule" />
            <asp:BoundField DataField="duree" HeaderText="Durée" SortExpression="duree" />
            <asp:BoundField DataField="tarif_intra" HeaderText="Tarif intra" SortExpression="tarif_intra" />
            <asp:BoundField DataField="tarif_inter" HeaderText="Tarif unitaire" SortExpression="tarif_inter" />
            <asp:BoundField DataField="niveau" HeaderText="Niveau" SortExpression="niveau" />
            <asp:BoundField DataField="theme" HeaderText="Thème" SortExpression="theme" />
            <asp:ButtonField ButtonType="Button" CommandName="Update" HeaderText="" ShowHeader="True" Text="Modifier" />
            <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Supprimer" />
        </Columns>
    </asp:GridView>
        <asp:ObjectDataSource ID="odsFormation" runat="server" SelectMethod="Get" TypeName="gestion_formation_web.dto.DtoFormation"></asp:ObjectDataSource>
    </form>
</body>
</html>
