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
                    <td>
                        <asp:DropDownList ID="ddlTypeSessionFormation" runat="server" DataSourceID="odsTypeSessionFormation" DataTextField="valeur" DataValueField="valeur">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="odsTypeSessionFormation" runat="server" SelectMethod="getTypesFormation" TypeName="gestion_formation_web.dto.DtoSessionFormation"></asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td>Tarif Intra</td>
                    <td><asp:TextBox ID="tbxTarifIntra" runat="server"></asp:TextBox>&nbsp;</td>
                </tr>     
                <tr>
                    <td><asp:Button ID="btnModifier" Text="Modifier"   runat="server" OnClientClick="onClick_btnModifier" OnClick="btnModifier_Click"/></td>
                    <td><asp:Button ID="btnAnnuler" Text="Annuler"   runat="server" OnClientClick="onClick_btnAnnuler" OnClick="btnAnnuler_Click"/></td>
                </tr>       
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="upFormateurs" runat="server" class="PetitBloc" UpdateMode="Conditional">
        <ContentTemplate> 
            <asp:Label ID="lable1" Text="Formateurs"  runat="server"/>
            <asp:GridView ID="gvFormateurs" runat="server" class="auto-style1" AutoGenerateColumns="False" DataSourceID="odsFormateurs" OnRowDeleted="gvFormateurs_RowDeleted" OnRowDeleting="gvFormateurs_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None" Width="90%" DataKeyNames="id_formateur">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="id_formateur" HeaderText="id_formateur" SortExpression="id_formateur" Visible="false"/>
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
<div style="clear:left;margin-top:20px;width:100%;">
            <asp:DropDownList ID="ddlFormateurs" runat="server"  />
            <asp:TextBox ID="tbxDateFormateur" runat="server" placeholder="date..."  ClientIDMode="Static" class="datepicker" AutoComplete="off"></asp:TextBox>
            <asp:Button ID="btnAjouterFormateur" runat="server" Text="Ajouter" OnClick="btnAjouterFormateur_Click"  />

</div>
            <h1>
            <asp:Label ID="Label1" runat="server" Text="Liste des stagiaires" CssClass="titre2"></asp:Label></h1>
        <br />
        <div class="TableView">
            <asp:GridView ID="gvStagiaires" runat="server" AutoGenerateColumns="False" DataSourceID="odsStagiaires" OnRowDeleted="gvStagiaires_RowDeleted" OnRowDeleting="gvStagiaires_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None"  DataKeyNames="id_stagiaire">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="id_stagiaire" HeaderText="id_stagiaire" SortExpression="id_stagiaire" Visible="False" />
                    <asp:BoundField DataField="civilite" HeaderText="civilite" SortExpression="civilite" />
                    <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
                    <asp:BoundField DataField="prenom" HeaderText="prenom" SortExpression="prenom" />
                    <asp:BoundField DataField="date_naissance" HeaderText="date_naissance" SortExpression="date_naissance" />
                    <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                    <asp:BoundField DataField="telephone" HeaderText="telephone" SortExpression="telephone" />
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
        </div>
        <br />
        <div class="TableView">
            <asp:DropDownList ID="ddlAjouterStagiaire" runat="server" DataSourceID="odsAutresStagiaires" DataTextField="nom" DataValueField="id_stagiaire"/>
            <asp:Button ID="btnAjouterStagiaire" runat="server" Text="Inscrire un stagiaire à la session" OnClick="btnAjouterStagiaire_Click" />
        </div>


        <asp:ObjectDataSource ID="odsStagiaires" runat="server" SelectMethod="GetStagiaires" TypeName="gestion_formation_web.dto.DtoSessionFormation">
            <SelectParameters>
                <asp:QueryStringParameter Name="idSessionFormation" QueryStringField="idSessionFormation" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="odsAutresStagiaires" runat="server" SelectMethod="GetAutresStagiaires" TypeName="gestion_formation_web.dto.DtoSessionFormation">
            <SelectParameters>
                <asp:QueryStringParameter Name="idSessionFormation" QueryStringField="idSessionFormation" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    <script type="text/javascript" src="js/scriptFin.js">

    </script>


        </ContentTemplate>

    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server"></asp:UpdatePanel>
</asp:Content>