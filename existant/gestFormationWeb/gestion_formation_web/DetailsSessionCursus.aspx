<%@ Page Title="Detail Session cursus" Language="C#" MasterPageFile="~/pageMaitre.Master" AutoEventWireup="true" CodeBehind="DetailsSessionCursus.aspx.cs" Inherits="gestion_formation_web.DetailsSessionCursus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <script type="text/javascript">
    </script>--%>    <%--            <asp:BoundField DataField="date_debut" HeaderText="Date de début" SortExpression="date_debut" />--%>
    <div>
        <asp:Label ID="lblTitrePage" runat="server" Text="Cursus ...." CssClass="titre1 auto-style1"></asp:Label>
        <asp:Button ID="btnRetourListeCursus" runat="server" Text="Liste des Cursus" OnClick="btnRetourListeCursus_Click" />
    </div>
    <br />
    <asp:Panel ID="PnlCreate" runat="server" Visible="False">
        <div class="auto-style1">
            <asp:Label ID="Label3" runat="server" Text="Nom de la session"></asp:Label>
            <asp:TextBox ID="tbxNom" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Date de la session"></asp:Label>
            <asp:TextBox ID="tbxDateSessionCursus" runat="server" CssClass="datepicker"></asp:TextBox>
            <br />
            <asp:Button ID="btnCreerSessionCursus" runat="server" Text="Créer" OnClick="btnCreerSessionCursus_Click" />
            <br />
        </div>
    </asp:Panel>

    <asp:Panel ID="pnlDetails" runat="server" Visible="False">
        <h1>
            <asp:Label ID="Label2" runat="server" Text="Liste des sessions de formation" CssClass="titre2 auto-style1"></asp:Label></h1>
        <br />
        <div class="TableView">
            <asp:GridView ID="gvSessionsFormation" runat="server" AutoGenerateColumns="False" DataSourceID="odsSessionsFormation" Style="float: left;" CellPadding="4" ForeColor="#333333" GridLines="None" Width="90%">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="id_session_formation" HeaderText="id_session_formation" SortExpression="id_session_formation" Visible="False" />
                    <asp:TemplateField HeaderText="Intitulé">
                        <ItemTemplate>
                            <asp:HyperLink ID="intitule" runat="server" Text='<%# Eval("formation.intitule") %>' NavigateUrl='<%# String.Format("~/DetailsSessionFormation.aspx?idSessionFormation={0}", Eval("id_session_formation")) %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date début">
                        <ItemTemplate>


                            <asp:Label ID="date_debut" runat="server" Text='<%# Eval("date_debut", "{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date fin">
                        <ItemTemplate>


                            <asp:Label ID="date_fin" runat="server" Text='<%# Eval("date_fin", "{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Durée">
                        <ItemTemplate>
                            <asp:Label ID="duree" runat="server" Text='<%# Eval("formation.duree") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ordre" HeaderText="Ordre" SortExpression="ordre" />
                    <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                    <asp:TemplateField HeaderText="Formateurs">
                        <ItemTemplate>
                            <asp:Label ID="formateurs" runat="server" Text='<%# gestion_formation_web.Globale.GetFormateursAsString((int)Eval("id_session_formation")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Feuilles d'évaluation">
                        <ItemTemplate>
                            <asp:Button ID="btnGenererFeuillesEvaluation" runat="server" Text='<%# Eval("formation.intitule", "Générer la FE pour {0}") %>' OnCommand="GenererFeuillesEvaluation_Command" CommandArgument='<%# Eval("id_session_formation") %>'></asp:Button>
                            <%--                     <input type="button" id="btnGenererFeuillesEvaluation" value='<%# Eval("formation.intitule", "Générer la FE pour {0}") %>' onclick='genererFeuillesEvaluation(<%# Eval("id_session_formation") %>)' /> --%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Feuilles de présence">
                        <ItemTemplate>
                            <asp:Button ID="btnGenererFeuillesPresence" runat="server" Text='<%# Eval("formation.intitule", "Générer la FP pour {0}") %>' OnCommand="GenererFeuillesEmargement_Command" CommandArgument='<%# Eval("id_session_formation") %>'></asp:Button>
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
        </div>
        <br />
        <div class="TableView">
            <asp:Button ID="btnCalculerDateSession" runat="server" Text="Calculer les dates des sessions" OnClick="btnCalculerDateSession_Click" />
        </div>
    </asp:Panel>

    <asp:Panel ID="PnlStagiaire" runat="server" Visible="False">
        <h1>
            <asp:Label ID="Label1" runat="server" Text="Liste des stagiaires" CssClass="titre2"></asp:Label></h1>
        <br />
        <div class="TableView">
            <asp:GridView ID="gvStagiaires" runat="server" AutoGenerateColumns="False" DataSourceID="odsStagiaires" Style="height: 180px; width: 1128px" CellPadding="4" ForeColor="#333333" GridLines="None" Width="90%">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="id_stagiaire" HeaderText="id_stagiaire" SortExpression="id_stagiaire" Visible="False" />
                    <asp:BoundField DataField="civilite" HeaderText="civilite" SortExpression="civilite" />
                    <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
                    <asp:BoundField DataField="prenom" HeaderText="prenom" SortExpression="prenom" />
                    <asp:BoundField DataField="date_naissance" HeaderText="date_naissance" SortExpression="date_naissance" />
                    <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                    <asp:BoundField DataField="telephone" HeaderText="telephone" SortExpression="telephone" />
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
            <asp:Button ID="btnAjouterStagiaire" runat="server" Text="Inscrire un stagiaire a la session" OnClick="btnAjouterStagiaire_Click" />
        </div>
        <asp:ObjectDataSource ID="odsSessionsFormation" runat="server" SelectMethod="GetSessionsFormation" TypeName="gestion_formation_web.dto.DtoSessionCursus">
            <SelectParameters>
                <asp:QueryStringParameter Name="idSessionCursus" QueryStringField="id_session_cursus" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="odsStagiaires" runat="server" SelectMethod="GetStagiaires" TypeName="gestion_formation_web.dto.DtoSessionCursus">
            <SelectParameters>
                <asp:QueryStringParameter Name="idSessionCursus" QueryStringField="id_session_cursus" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </asp:Panel>
</asp:Content>
