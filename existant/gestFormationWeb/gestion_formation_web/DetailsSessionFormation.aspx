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
                    <td>Date début</td>
                    <td><asp:TextBox ID="tbxDateDebut" runat="server" CssClass="DatePicker"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Date fin</td>
                    <td><asp:TextBox ID="tbxDateFin" runat="server" CssClass="DatePicker"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Ordre</td>
                    <td><asp:TextBox ID="tbxOrdre" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td><asp:TextBox ID="tbxType" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Tarif Intra</td>
                    <td><asp:TextBox ID="tbxIntitule" runat="server"></asp:TextBox>&nbsp;</td>
                </tr>     
                <tr>
                    <td><asp:Button ID="btnModifier" Text="Modifier"   runat="server" OnClientClick="onClick_btnModifier"/></td>
                    <td><asp:Button ID="btnAnnuler" Text="Annuler"   runat="server" OnClientClick="onClick_btnAnnuler"/></td>
                </tr>       
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="upFormateurs" runat="server" class="PetitBloc" UpdateMode="Conditional">
        <ContentTemplate> 
            <asp:Label ID="lable1" Text="Formateurs"  runat="server"/>
            <asp:GridView ID="gvFormateurs" runat="server" class="auto-style1" AutoGenerateColumns="False" DataSourceID="odsFormateurs" OnRowDeleted="gvFormateurs_RowDeleted" OnRowDeleting="gvFormateurs_RowDeleting">
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
            </asp:GridView>
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