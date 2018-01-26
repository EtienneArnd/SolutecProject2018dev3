<%@ Page Title="Liste des cursus" Language="C#" MasterPageFile="~/pageMaitre.Master" AutoEventWireup="true" CodeBehind="ListeCursus.aspx.cs" Inherits="gestion_formation_web.ListeCursus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="odsListeCursus" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id_cursus" HeaderText="id_cursus" SortExpression="id_cursus" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="id_cursus" DataNavigateUrlFormatString="DetailsCursus.aspx?idCursus={0}" DataTextField="nom" HeaderText="Nom" />
            <asp:HyperLinkField DataNavigateUrlFields="id_cursus" DataNavigateUrlFormatString="ListeSessionsCursus.aspx?idCursus={0}" DataTextField="nom" DataTextFormatString="Sessions du cursus {0}" HeaderText="Sessions" />
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
    
    <asp:ObjectDataSource ID="odsListeCursus" runat="server" SelectMethod="Get" TypeName="gestion_formation_web.dto.DtoCursus"></asp:ObjectDataSource>
</asp:Content>
