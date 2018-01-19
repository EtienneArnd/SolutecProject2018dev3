<%@ Page Title="" Language="C#" MasterPageFile="~/pageMaitre.Master" AutoEventWireup="true" CodeBehind="ListeSessionsCursus.aspx.cs" Inherits="gestion_formation_web.ListeSessionsCursus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="lblTitrePage" runat="server" Text="Liste des sessions de cursus" CssClass="titre1 auto-style1"></asp:Label>
<br />    
<br />    

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id_session_cursus" HeaderText="id_session_cursus" SortExpression="id_session_cursus" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="id_session_cursus" DataNavigateUrlFormatString="DetailsSessionCursus.aspx?id_session_cursus={0}" DataTextField="nom" HeaderText="Nom de la session" />
            <asp:TemplateField HeaderText="Nom du cursus">
                <ItemTemplate>
                 <asp:Label ID="cursusName" runat="server" Text='<%# Eval("cursus.nom") %>'></asp:Label>
                    </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="date_debut" HeaderText="Date de début" SortExpression="nom" DataFormatString="{0:dd/MM/yyyy}" />
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
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetSessionsCursus" TypeName="gestion_formation_web.dto.DtoCursus">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idCursus" QueryStringField="idCursus" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />

    <asp:Button ID="btnAjouterSessionCursus" runat="server" Text="Ajouter une nouvelle session" OnClick="btnAjouterSessionCursus_Click" />

</asp:Content>
