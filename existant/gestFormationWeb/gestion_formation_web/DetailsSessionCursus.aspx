<%@ Page Title="" Language="C#"   MasterPageFile="~/pageMaitre.Master" AutoEventWireup="true" CodeBehind="DetailsSessionCursus.aspx.cs" Inherits="gestion_formation_web.DetailsSessionCursus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>--%>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- <asp:ScriptManager runat="server" EnablePageMethods="true"  />--%>
<%--    <script type="text/javascript">
       //function  genererFeuillesEvaluation(idSessionFormation) {
       //    if (idSessionFormation == null && idSessionFormation.trim().length()==0){
       //        alert("id de session de formation requis");
       //        return;
       //    }
       //    var rep = PageMethods.GenererFeuillesEvaluation(idSessionFormation);
       //    alert(rep);
       
       //}

       // function genererFeuillesEvaluationtmp(idSessionFormation) {
       //     var uri = window.location.href.split('?')[0];
       //     uri += "/GenererFeuillesEvaluation2?idSessionFormation="+idSessionFormation;
       //     var iframe = document.createElement("iframe");
       //     iframe.src = encodeURI(uri);
       //     document.body.appendChild(iframe);
       // }
       // function genererFeuillesEvaluation(idSessionFormation) {
       //     var uri = window.location.href.split('?')[0];
       //     uri += "/GenererFeuillesEvaluation";
            
       //    $.ajax({
       //        type: "POST",
       //        async: false,
       //        url: uri,
       //        data: "{'idSessionFormation':'" + idSessionFormation + "'}",
       //        contentType: "application/json; charset=utf-8",
       //        dataType: "json",
       //        success: function(data) {
       //            alert(data.size);
       //            // alert(JSON.stringify(data));
       //            var blob = new Blob([data]);
       //            var link = document.createElement('a');
       //            link.href = window.URL.createObjectURL(blob);
       //            link.download = "Sample.docx";
       //            link.click();
       //        },  
       //        error: function (response) {  
       //            var r = jQuery.parseJSON(response.responseText);
       //            alert("Message: " + r.Message);
       //            alert("StackTrace: " + r.StackTrace);
       //            alert("ExceptionType: " + r.ExceptionType);
       //        } ,
       //        failure: function (response) {
       //            var r = jQuery.parseJSON(response.responseText);
       //            alert("Message: " + r.Message);
       //            alert("StackTrace: " + r.StackTrace);
       //            alert("ExceptionType: " + r.ExceptionType);
       //        }
       //    });
       //}
/*       downloadFile(window.location+"&idSessionFormation="+idSessionFormation);
       function downloadFile(uri) 
       {
           alert(uri);
           var req = new XMLHttpRequest();
           req.open("GET", uri, true);
           req.responseType = "blob";
           req.onload = function (event) {
               var blob = req.response;
               alert(blob);
               //var fileName = req.getResponseHeader("fileName") //if you have the fileName header available
               //var link=document.createElement('a');
               //link.href=window.URL.createObjectURL(blob);
               //link.download=fileName;
               link.click();
           };

           req.send();
           }
*/

       
    </script>--%>
           
    <asp:Label ID="lblTitrePage" runat="server" Text="Cursus ...." CssClass="titre1 auto-style1"></asp:Label>
    <br />
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

    <br />
    <asp:Panel ID="pnlDetails" runat="server" Visible="False">
    <asp:Label ID="Label2" runat="server" Text="Liste des sessions de formation" CssClass="titre2 auto-style1"></asp:Label>
    <br />
    <asp:GridView ID="gvSessionsFormation" runat="server" AutoGenerateColumns="False" DataSourceID="odsSessionsFormation" style="float:left;">
        <Columns>
<%--            <asp:BoundField DataField="date_debut" HeaderText="Date de début" SortExpression="date_debut" />--%>
            <%--<asp:ButtonField DataTextField="intitule" DataTextFormatString="Génerer la feuille d'éval pour {0}" HeaderText="Feuille d'éval" />--%>

            <asp:BoundField DataField="id_session_formation" HeaderText="id_session_formation" SortExpression="id_session_formation" Visible="False" />
             <asp:TemplateField HeaderText="Intitulé">
                <ItemTemplate>
                 <%--<asp:Label ID="intitule" runat="server" Text='<%# Eval("formation.intitule") %>'></asp:Label>--%>
                 <asp:HyperLink ID="intitule" runat="server" Text='<%# Eval("formation.intitule") %>'  NavigateUrl='<%# String.Format("~/DetailsSessionFormation.aspx?idSessionFormation={0}", Eval("id_session_formation")) %>' ></asp:HyperLink>
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
<%--                     <asp:Button ID="btnAffecterFormateur" runat="server" Text="Affecter un formateur" OnCommand="AffecterFormateur_Command" CommandArgument='<%# Eval("id_session_formation") %>'></asp:Button>--%>
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
    </asp:GridView>
     <br />
        <br />
    <asp:Button ID="btnCalculerDateSession" runat="server" Text="Calculer les dates des sessions" OnClick="btnCalculerDateSession_Click" />
     <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Liste des stagiaires" CssClass="titre2"></asp:Label>
    <br />
    <asp:GridView ID="gvStagiaires" runat="server" AutoGenerateColumns="False" DataSourceID="odsStagiaires" style="height: 180px; width: 1128px">
        <Columns>
            <asp:BoundField DataField="id_stagiaire" HeaderText="id_stagiaire" SortExpression="id_stagiaire" Visible="False" />
            <asp:BoundField DataField="civilite" HeaderText="civilite" SortExpression="civilite" />
            <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
            <asp:BoundField DataField="prenom" HeaderText="prenom" SortExpression="prenom" />
            <asp:BoundField DataField="date_naissance" HeaderText="date_naissance" SortExpression="date_naissance" />
            <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
            <asp:BoundField DataField="telephone" HeaderText="telephone" SortExpression="telephone" />
        </Columns>
    </asp:GridView>

    <br />
        <asp:Button ID="btnAjouterStagiaire" runat="server" Text="Inscrire un stagiaire au cursus" />

    <asp:ObjectDataSource ID="odsSessionsFormation" runat="server" SelectMethod="GetSessionsFormation" TypeName="gestion_formation_web.dto.DtoSessionCursus">
        <SelectParameters>
            <asp:QueryStringParameter Name="idSessionCursus" QueryStringField="id_session_cursus" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="odsStagiaires" runat="server" SelectMethod="GetStagiaires" TypeName="gestion_formation_web.dto.DtoSessionCursus" >
        <SelectParameters>
            <asp:QueryStringParameter Name="idSessionCursus" QueryStringField="id_session_cursus" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Panel>
    </asp:Content>
