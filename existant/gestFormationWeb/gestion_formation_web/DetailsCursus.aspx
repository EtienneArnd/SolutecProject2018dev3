<%@ Page Title="" Language="C#" MasterPageFile="~/pageMaitre.Master" AutoEventWireup="true" CodeBehind="DetailsCursus.aspx.cs" Inherits="gestion_formation_web.DetailsCursus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblTitrePage" runat="server" Text="Cursus ...." CssClass="titre1 auto-style1"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Liste des formations" CssClass="titre2 auto-style1" ></asp:Label>
    <br />
    <asp:GridView ID="gvFormations" runat="server" AutoGenerateColumns="False" DataSourceID="odsFormations" >
        <Columns>
            <asp:BoundField DataField="id_formation" HeaderText="id_formation" SortExpression="id_formation" Visible="False" />
            <asp:BoundField DataField="intitule" HeaderText="intitule" SortExpression="intitule" />
            <asp:BoundField DataField="duree" HeaderText="duree" SortExpression="duree" />
            <asp:TemplateField HeaderText="Ordre">
                <ItemTemplate>
                 <asp:Label ID="ordre" runat="server" Text='<%# ((IEnumerable<gestion_formation_web.formation_cursus>) Eval("formation_cursus")).FirstOrDefault().ordre %>'></asp:Label>
                    </ItemTemplate>
            </asp:TemplateField>
        <asp:BoundField DataField="niveau" HeaderText="niveau" SortExpression="niveau" />
        </Columns>
    </asp:GridView>

<br />
    <input id="btnAjoutFormation" type="button" value="Ajouter une formation au cursus" onclick="document.getElementById('divAjoutFormation').style='display:bloc';" />
<br />

    <div  id="divAjoutFormation"  style="display:none">
    <asp:DropDownList ID="ddlFormations" runat="server" DataSourceID="odsAutresFormations" DataTextField="intitule" DataValueField="id_formation">
    </asp:DropDownList>        
        <asp:ObjectDataSource ID="odsAutresFormations" runat="server" SelectMethod="GetAutresFormations" TypeName="gestion_formation_web.dto.DtoCursus">
            <SelectParameters>
                <asp:QueryStringParameter Name="idCursus" QueryStringField="idCursus" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    <asp:Button ID="btnAjouterFormation" runat="server" OnClick="btnAjouterFormation_Click"  Text="Ajouter la formation au cursus" />
    </div>

    <asp:ObjectDataSource ID="odsFormations" runat="server" SelectMethod="GetFormations" TypeName="gestion_formation_web.dto.DtoCursus">
        <SelectParameters>
            <asp:QueryStringParameter Name="idCursus" QueryStringField="idCursus" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
