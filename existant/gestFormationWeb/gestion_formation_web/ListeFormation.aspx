<%@ Page Title="Liste Formation" Language="C#"  MasterPageFile="~/pageMaitre.Master" AutoEventWireup="true" CodeBehind="ListeFormation.aspx.cs" Inherits="gestion_formation_web.WebForm2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:GridView ID="gvFormations" runat="server" AutoGenerateColumns="False" DataSourceID="odsFormation" style="float:left;" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id_formation" HeaderText="ID formation" SortExpression="id_formation" Visible="False"/>
            <asp:BoundField DataField="intitule" HeaderText="Intitulé" SortExpression="intitule" />
            <asp:BoundField DataField="duree" HeaderText="Durée" SortExpression="duree" />
            <asp:BoundField DataField="tarif_intra" HeaderText="Tarif intra" SortExpression="tarif_intra" />
            <asp:BoundField DataField="tarif_inter" HeaderText="Tarif unitaire" SortExpression="tarif_inter" />
            <asp:BoundField DataField="niveau" HeaderText="Niveau" SortExpression="niveau" />
            <asp:BoundField DataField="theme.nom" HeaderText="Thème" SortExpression="theme" />
            <asp:ButtonField ButtonType="Button" CommandName="Update" HeaderText="" ShowHeader="True" Text="Modifier" />
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
        <asp:ObjectDataSource ID="odsFormation" runat="server" SelectMethod="Get" TypeName="gestion_formation_web.dto.DtoFormation"></asp:ObjectDataSource>
</asp:Content>
