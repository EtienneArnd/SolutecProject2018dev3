<%@ Page Title="" Language="C#" MasterPageFile="~/pageMaitre.Master" AutoEventWireup="true" CodeBehind="ListeSessionsFormation.aspx.cs" Inherits="gestion_formation_web.ListeSessionFormation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblTitrePage" runat="server" Text="Liste des sessions de formation" CssClass="titre1 auto-style1"></asp:Label>
    <br />
    <br />
    <div class=""></div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="80%">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id_session_formation" HeaderText="id_session_formation" SortExpression="id_session_formation" />
            <asp:BoundField DataField="date_debut" HeaderText="date_debut" SortExpression="date_debut" />
            <asp:BoundField DataField="date_fin" HeaderText="date_fin" SortExpression="date_fin" />
            <asp:BoundField DataField="ordre" HeaderText="ordre" SortExpression="ordre" />
            <asp:BoundField DataField="tarif_intra" HeaderText="tarif_intra" SortExpression="tarif_intra" />
            <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
            <%-- <asp:BoundField DataField="id_session_cursus" HeaderText="id_session_cursus" SortExpression="id_session_cursus" />
            <asp:BoundField DataField="id_salle" HeaderText="id_salle" SortExpression="id_salle" />--%>
            <asp:TemplateField HeaderText="Session cursus">
                <ItemTemplate>
                    <asp:HyperLink ID="sessionCursus" runat="server" Text='<%# Eval("session_cursus.nom") %>' NavigateUrl='<%# String.Format("~/DetailsSessionCursus.aspx?id_session_cursus={0}", Eval("session_cursus.id_session_cursus")) %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Salle">
                <ItemTemplate>
                    <asp:Label ID="salle" runat="server" Text='<%# Eval("salle.nom") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetSessionFormation" TypeName="gestion_formation_web.dto.DtoSessionFormation" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="idFormation" QueryStringField="idFormation" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:Panel ID="PnlCreate" runat="server" Visible="True">
        <div class="auto-style1">
            <asp:Label ID="Label3" runat="server" Text="Nom  du formateur "></asp:Label>
            <asp:DropDownList ID="ddlFormateur" runat="server" DataSourceID="odsFormateur" DataTextField="nom" DataValueField="id_formateur">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="odsFormateur" runat="server" SelectMethod="Get" TypeName="gestion_formation_web.dto.DtoFormateur">
                <SelectParameters>
                    <asp:Parameter Name="unTheme" Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Date de la session"></asp:Label>
            <asp:TextBox ID="tbxDateSessionFormation" runat="server" CssClass="datepicker"></asp:TextBox>
            <br />
            <asp:Button ID="btnAjouterSessionFormation" runat="server" Text="Ajouter une nouvelle session" OnClick="btnAjouterSessionFormation_Click" />
            <br />
        </div>
    </asp:Panel>

</asp:Content>
