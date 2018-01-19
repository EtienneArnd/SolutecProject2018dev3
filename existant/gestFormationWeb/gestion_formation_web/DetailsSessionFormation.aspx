<%@ Page Title="" Language="C#" MasterPageFile="~/pageMaitre.Master" AutoEventWireup="true" CodeBehind="DetailsSessionFormation.aspx.cs" Inherits="gestion_formation_web.DetailsSessionFormation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <asp:Label ID="lblTitrePage" runat="server" Text="Formation ...." CssClass="titre1 auto-style1"></asp:Label>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:ObjectDataSource ID="odsFormateurs" runat="server" SelectMethod="GetFormateurs" TypeName="gestion_formation_web.dto.DtoSessionFormation">
                <SelectParameters>
                    <asp:QueryStringParameter Name="idSessionFormation" QueryStringField="idSessionFormation" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" class="PetitBloc" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="auto-style1">
                <tr>
                    <td>Intitulé</td>
                    <td>
                        <asp:TextBox ID="tbxIntitule" runat="server"></asp:TextBox>&nbsp;</td>
                </tr>
                <tr>
                    <td>Date début</td>
                    <td>
                        <asp:TextBox ID="tbxDateDebut" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Date fin</td>
                    <td>
                        <asp:TextBox ID="tbxDateFin" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Ordre</td>
                    <td>
                        <asp:TextBox ID="tbxOrdre" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td>
                        <asp:TextBox ID="tbxType" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Button ID="btnModifier" Text="Modifier"   runat="server"/></td>
                    <td><asp:Button ID="btnAnnuler" Text="Annuler"   runat="server"/></td>
                </tr>
            
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="upFormateurs" runat="server" class="PetitBloc" UpdateMode="Conditional">
        <ContentTemplate> 
            <asp:Label ID="lable1" Text="Formateurs"  runat="server"/>
            <asp:GridView ID="gvFormateurs" runat="server" class="auto-style1" AutoGenerateColumns="False" DataSourceID="odsFormateurs" OnRowDeleted="gvFormateurs_RowDeleted" OnRowDeleting="gvFormateurs_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="id_formateur" HeaderText="id_formateur" SortExpression="id_formateur" />
                    <asp:BoundField DataField="civilite" HeaderText="Civilite" SortExpression="civilite" />
                    <asp:BoundField DataField="nom" HeaderText="Nom" SortExpression="nom" />
                    <asp:BoundField DataField="prenom" HeaderText="Prenom" SortExpression="prenom" />
                    <asp:BoundField DataField="statut" HeaderText="Statut" SortExpression="statut" />
                    <asp:TemplateField HeaderText="Date">
                <ItemTemplate>
                 <asp:Label ID="date" runat="server" Text='<%# gestion_formation_web.Globale.ToShortDateString(((IEnumerable<gestion_formation_web.formateur_session_formation>) Eval("formateur_session_formation")).FirstOrDefault(fsf => fsf.id_session_formation == idSessionFormation).date_debut) %>'></asp:Label>
                    </ItemTemplate>
                        

                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" />
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
<%--            <asp:ObjectDataSource ID="odsFormateurs" runat="server" SelectMethod="GetFormateurs" TypeName="gestion_formation_web.dto.DtoSessionFormation">
                <SelectParameters>
                    <asp:QueryStringParameter Name="idSessionFormation" QueryStringField="idSessionFormation" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:DropDownList ID="ddlFormateurs" runat="server" DataSourceID="odsAutresFormateurs" DataValueField="id_formateur"   DataTextField='<%# Eval("nom")+" "+Eval("prenom") %>'  >--%>
<div style="clear:left;margin-top:20px;width:100%;">
            <asp:DropDownList ID="ddlFormateurs" runat="server"  />
            <asp:TextBox ID="tbxDateFormateur" runat="server" placeholder="date..."  ClientIDMode="Static" class="datepicker" AutoComplete="off"></asp:TextBox>
            <asp:Button ID="btnAjouterFormateur" runat="server" Text="Ajouter" OnClick="btnAjouterFormateur_Click"  />

</div>
            
    <script type="text/javascript" src="js/scriptFin.js">

    </script>


        </ContentTemplate>

    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server"></asp:UpdatePanel>
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label2" runat="server" Text="Formation ...." CssClass="titre1"></asp:Label>
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="odsSessionFormation" Height="50px"  Width="125px">
        <Fields>
            <asp:BoundField DataField="id_session_formation" HeaderText="id_session_formation" SortExpression="id_session_formation" />
            <asp:BoundField DataField="date_debut" DataFormatString="{0:dd/MM/yyyy}" HeaderText="date_debut" SortExpression="date_debut" />
            <asp:BoundField DataField="date_fin" DataFormatString="{0:dd/MM/yyyy}" HeaderText="date_fin" SortExpression="date_fin" />
            <asp:BoundField DataField="ordre" HeaderText="ordre" SortExpression="ordre" />
            <asp:TemplateField HeaderText="type" SortExpression="type">
                <EditItemTemplate>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="getTypesFormation" TypeName="gestion_formation_web.dto.DtoSessionFormation"></asp:ObjectDataSource>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                        <Columns>
                            <asp:DynamicField DataField="nom" HeaderText="nom" />
                            <asp:DynamicField DataField="valeur" HeaderText="valeur" />
                        </Columns>
                    </asp:GridView>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="tarif_intra" HeaderText="tarif_intra" SortExpression="tarif_intra" />
            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Get" TypeName="gestion_formation_web.dto.DtoSessionFormation">
        <SelectParameters>
            <asp:QueryStringParameter Name="idSessionFormation" QueryStringField="idSessionFormation" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
</asp:Content>--%>