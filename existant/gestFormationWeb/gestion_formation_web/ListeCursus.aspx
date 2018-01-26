<%@ Page Title="" Language="C#" MasterPageFile="~/pageMaitre.Master" AutoEventWireup="true" CodeBehind="ListeCursus.aspx.cs" Inherits="gestion_formation_web.ListeCursus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="odsListeCursus">
        <Columns>
            <asp:BoundField DataField="id_cursus" HeaderText="id_cursus" SortExpression="id_cursus" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="id_cursus" DataNavigateUrlFormatString="DetailsCursus.aspx?idCursus={0}" DataTextField="nom" HeaderText="Nom" />
            <asp:HyperLinkField DataNavigateUrlFields="id_cursus" DataNavigateUrlFormatString="ListeSessionsCursus.aspx?idCursus={0}" DataTextField="nom" DataTextFormatString="Sessions du cursus {0}" HeaderText="Sessions" />
        </Columns>
    </asp:GridView>

    <asp:ObjectDataSource ID="odsListeCursus" runat="server" SelectMethod="Get" TypeName="gestion_formation_web.dto.DtoCursus"></asp:ObjectDataSource>
</asp:Content>
