<%@ Page Title="" Language="C#" MasterPageFile="~/pageMaitre.Master" AutoEventWireup="true" CodeBehind="DetailsCursus.aspx.cs" Inherits="gestion_formation_web.DetailsCursus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblTitrePage" runat="server" Text="Cursus ...." CssClass="titre1 auto-style1"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Liste des formations" CssClass="titre2 auto-style1" ></asp:Label>
    <br />
    <asp:GridView ID="gvFormations" runat="server" AutoGenerateColumns="False" DataSourceID="odsFormations" CellPadding="4" ForeColor="#333333" GridLines="None" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id_formation" HeaderText="id_formation" SortExpression="id_formation" Visible="False" />
            <asp:BoundField DataField="intitule" HeaderText="intitule" SortExpression="intitule" />
            <asp:BoundField DataField="duree" HeaderText="duree" SortExpression="duree" />
            <asp:TemplateField HeaderText="Ordre">
                <ItemTemplate>
                <%--<essai>--%>
                 <%--<asp:DropDownList ID="ddlordre" runat="server" DataSourceID="odsFormations" DataValueField="ordre"  DataTextField='<%# ((IEnumerable<gestion_formation_web.formation_cursus>) Eval("formation_cursus")).FirstOrDefault().ordre %>'/>--%>
                <%--<essai>--%>
                <asp:Label ID="ordre" runat="server" Text='<%# ((IEnumerable<gestion_formation_web.formation_cursus>) Eval("formation_cursus")).FirstOrDefault().ordre %>'></asp:Label>
                    </ItemTemplate>
            </asp:TemplateField>
        <asp:BoundField DataField="niveau" HeaderText="niveau" SortExpression="niveau" />
            
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

<br />
    <input id="btnModificationOrdreFormation" type="button" value="Modifier l'ordre d'une formation dans le cursus" onclick="document.getElementById('divModifierOrdreFormation').style='display:bloc';" />
    <asp:Label ID="lblMemeOrdre" runat="server" Text="La formation est déjà à l'ordre que vous demandez" Visible="False"></asp:Label>
<br />

    <div  id="divModifierOrdreFormation"  style="display:none">
    <asp:DropDownList ID="ddlModifierOrdreFormation" runat="server" DataSourceID="odsFormations" DataTextField="intitule" DataValueField="id_formation" />    
    <asp:TextBox ID="tbxOrdreFormation" runat="server" placeholder="Ordre souhaité"></asp:TextBox>
    <asp:Button ID="btnModifierOrdreFormation" runat="server" OnClick="btnModifierOrdreFormation_Click"  Text="Modifier l'ordre de la formation" />
    </div>

    <asp:ObjectDataSource ID="odsFormations" runat="server" SelectMethod="GetFormations" TypeName="gestion_formation_web.dto.DtoCursus">
        <SelectParameters>
            <asp:QueryStringParameter Name="idCursus" QueryStringField="idCursus" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <%--<essai>--%>
<%--        <asp:ObjectDataSource ID="odsOrdre" runat="server" SelectMethod="GetOrders" TypeName="gestion_formation_web.dto.DtoCursus">
        <SelectParameters>
            <asp:QueryStringParameter Name="idCursus" QueryStringField="idCursus" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>--%>
    <%--<Fin essai>--%>

</asp:Content>
