<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListeCursus.aspx.cs" Inherits="gestion_formation_web.ListeCursus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
<form id="formListeCursus" runat="server">
        <asp:Button ID="btnCreerCursus" runat="server" Text="Créer un nouveau cursus" OnClick="btnCreerCursus_Click" />
        <asp:GridView ID="gvCursus" runat="server" AutoGenerateColumns="False" DataSourceID="odsCursus" style="float:left;" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id_cursus" HeaderText="ID cursus" SortExpression="id_cursus" Visible="False"/>
            <asp:BoundField DataField="nom" HeaderText="Nom" SortExpression="nom" />
            <asp:BoundField DataField="tarif" HeaderText="Tarif" SortExpression="tarif" />
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                     <asp:Button ID="btnModifier" runat="server" Text="Modifier" OnCommand="ModifierCursus_Command" CommandArgument='<%# Eval("id_cursus") %>'></asp:Button>
               </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Supprimer" />
        </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
        <asp:ObjectDataSource ID="odsCursus" runat="server" SelectMethod="Get" TypeName="gestion_formation_web.dto.DtoCursus"></asp:ObjectDataSource>
</form>
</body>
</html>

