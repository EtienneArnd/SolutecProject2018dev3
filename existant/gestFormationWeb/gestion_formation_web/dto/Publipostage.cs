using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using Microsoft.Office.Interop.Word;

namespace gestion_formation_web.dto
{
    public class Publipostage
    {
        static Object oMissing = System.Reflection.Missing.Value;
        static String appDataFolder = HttpContext.Current.Server.MapPath("~/App_Data/");
        static String nomGeneriqueFeuilleEvaluation = appDataFolder +"docs/Feuille_evaluation_{0} {1}_{2}_{3}.docx";
        static String nomGeneriqueFeuilleEmargementParSociete = appDataFolder + "docs/Feuille_emargement_societe_jour_{0} {1}_{2}_{3}.docx";
        static String nomModeleFeuilleEvaluation = appDataFolder + "feuille_evaluation.dotx";
        static String nomModeleFeuilleEmargement = appDataFolder + "feuille_emargement_societe_jour.dotx";
        static String nomModeleFeuilleEvaluationVierge = appDataFolder + "feuille_evaluation_vierge.dotx";
        static String nomModeleFeuilleEmargementVierge = appDataFolder + "feuille_emargement_vierge.dotx";
        static Application appWord = new Application();

        static Application AppWord
        {
            get
            {
                if (appWord == null)
                {
                    appWord = (Microsoft.Office.Interop.Word.Application)System.Runtime.InteropServices.Marshal.GetActiveObject("Word.Application");
                    if (appWord == null)
                    {
                        appWord = new Application();
                    }
                }
                return appWord;
            }
        }

        public static String CreateFeuillesEvaluation(int idSessionFormation) {
            // récuperer les données pour la fusion
            session_formation sessionFormation = dto.DtoSessionFormation.Get(idSessionFormation);
            IEnumerable<stagiaire> stagiaires = dto.DtoSessionFormation.GetStagiaires(idSessionFormation);
            IEnumerable<formateur> formateurs = dto.DtoSessionFormation.GetFormateurs(idSessionFormation);
            // fusionner avec publipostage en utilisnat un modèle .dotx

            String nomFeuillesEvaluation = String.Format(nomGeneriqueFeuilleEvaluation, sessionFormation.formation.intitule.Replace(",", " -"), "", ((DateTime)sessionFormation.date_debut).ToShortDateString().Replace('/', '-'), sessionFormation.GetDateFin().ToShortDateString().Replace('/', '-'));
            if (File.Exists(nomFeuillesEvaluation))
            {
                File.Delete(nomFeuillesEvaluation);
            }
            Document docFeuillesEvaluation = new Document();
            Object oTemplatePath = nomModeleFeuilleEvaluation;

 //           appWord.Visible = true;
            List<string> feuillesEvaluation = new List<string>();
            foreach (stagiaire stg in stagiaires)
            { 
                Document docFeuilleEvaluation = AppWord.Documents.Add(oTemplatePath, oMissing, oMissing, oMissing);
                MergeFeuilleEvaluation(docFeuilleEvaluation, sessionFormation, formateurs, stg);
                String nomFeuilleEvaluation = String.Format(nomGeneriqueFeuilleEvaluation, sessionFormation.formation.intitule.Replace(",", " -"), stg.GetNomPrenom(), ((DateTime)sessionFormation.date_debut).ToShortDateString().Replace('/', '-'), sessionFormation.GetDateFin().ToShortDateString().Replace('/', '-'));
                if (File.Exists(nomFeuilleEvaluation))
                {
                    File.Delete(nomFeuilleEvaluation);
                }
                docFeuilleEvaluation.SaveAs(nomFeuilleEvaluation);
                docFeuilleEvaluation.Close(true);

                feuillesEvaluation.Add(nomFeuilleEvaluation);
            }
            docFeuillesEvaluation = Merge(feuillesEvaluation, nomFeuillesEvaluation,documentTemplate: nomModeleFeuilleEvaluationVierge);

            //if (File.Exists(nomFeuilleEvaluation))
            //{
            //    File.Delete(nomFeuilleEvaluation);
            //}
            //        appWord.Visible = true;
            docFeuillesEvaluation.Close();
//            appWord.Quit();
//            Marshal.FinalReleaseComObject(appWord);
            return nomFeuillesEvaluation;
        }
        public static String CreateFeuillesEmargement(int idSessionFormation)
        {
            // récuperer les données pour la fusion
            session_formation sessionFormation = dto.DtoSessionFormation.Get(idSessionFormation);
            IEnumerable<formateur> formateurs = dto.DtoSessionFormation.GetFormateurs(idSessionFormation);
            IEnumerable<societe> societes = dto.DtoSessionFormation.GetSocietes(idSessionFormation);
            // fusionner avec publipostage en utilisnat un modèle .dotx

            String nomFeuillesEmargement = String.Format(nomGeneriqueFeuilleEmargementParSociete, sessionFormation.formation.intitule.Replace(",", " -"), "", ((DateTime)sessionFormation.date_debut).ToShortDateString().Replace('/', '-'), sessionFormation.GetDateFin().ToShortDateString().Replace('/', '-'));
            if (File.Exists(nomFeuillesEmargement))
            {
                File.Delete(nomFeuillesEmargement);
            }
            Document docFeuillesEmargement = new Document();
            Object oTemplatePath = nomModeleFeuilleEmargement;

            //           appWord.Visible = true;
            List<string> feuillesEmargement = new List<string>();
            DateTime[] datesFormation = Globale.GetPlageDates((DateTime)sessionFormation.date_debut, (int)sessionFormation.formation.duree);
            foreach (DateTime date in datesFormation)
            {
                foreach (societe ste in societes)
                {
                    IEnumerable<stagiaire> stagiaires = dto.DtoSessionFormation.GetStagiaires(idSessionFormation, ste.id_societe);
                    Document docFeuilleEmargement = AppWord.Documents.Add(oTemplatePath, oMissing, oMissing, oMissing);
                    MergeFeuilleEmargement(docFeuilleEmargement, sessionFormation, date, formateurs, ste, stagiaires);
                    String nomFeuilleEmargement = String.Format(nomGeneriqueFeuilleEmargementParSociete, sessionFormation.formation.intitule.Replace(",", " -"), ste.GetNomAvecComplement(), date.ToShortDateString().Replace('/', '-'), "");
                    if (File.Exists(nomFeuilleEmargement))
                    {
                        File.Delete(nomFeuilleEmargement);
                    }
                    docFeuilleEmargement.SaveAs(nomFeuilleEmargement);
                    docFeuilleEmargement.Close(true);

                    feuillesEmargement.Add(nomFeuilleEmargement);
                }
            }
            docFeuillesEmargement = Merge(feuillesEmargement, nomFeuillesEmargement, documentTemplate: nomModeleFeuilleEmargementVierge);

            //if (File.Exists(nomFeuilleEvaluation))
            //{
            //    File.Delete(nomFeuilleEvaluation);
            //}
            //        appWord.Visible = true;
            docFeuillesEmargement.Close();
//            appWord.Quit();
//            Marshal.FinalReleaseComObject(appWord);
            return nomFeuillesEmargement;
        }
        public static  String GetNomChampDeFusion(Field champDeFusion)
        {
            String fieldText = champDeFusion.Code.Text;

            // Le format des champ de fusion est MERGEFIELD  MyFieldName  \\* MERGEFORMAT
            // Transformation du nom du champ de fusion en "nomChoisi"
            if (fieldText.StartsWith(" MERGEFIELD"))
            {
                Int32 endMerge = fieldText.IndexOf("\\");
                Int32 fieldNameLength = fieldText.Length - endMerge;
                String fieldName = fieldText.Substring(11, endMerge - 11);
                fieldName = fieldName.Trim();
                return fieldName;
            }
            return null;

        }

        public static void MergeFeuilleEmargement(Document docWord, session_formation sessionFormation, DateTime date, IEnumerable<formateur> formateurs, societe ste, IEnumerable<stagiaire> stagiaires)
        {
            Range headfootRange = docWord.Sections[1].Headers[WdHeaderFooterIndex.wdHeaderFooterPrimary].Range;

            List<Field> fields = new List<Field>();
            foreach (Field field in headfootRange.Fields)
            {
                if (field.Type == Microsoft.Office.Interop.Word.WdFieldType.wdFieldMergeField)
                {
                    fields.Add(field);
                }
                ///do your processing
            }
            foreach (Field field in docWord.Fields)
            {
                if (field.Type == Microsoft.Office.Interop.Word.WdFieldType.wdFieldMergeField)
                {
                    fields.Add(field);
                }
            }
            
            foreach (Field champDeFusion in fields)
            {

                String nomChamp = GetNomChampDeFusion(champDeFusion);

                //remplissage en fonction du champ
                switch (nomChamp)
                {
                    case "intituleFormation":
                        champDeFusion.Select();
                        AppWord.Selection.TypeText(sessionFormation.formation.intitule);
                        break;

                    case "nomCursus":
                        champDeFusion.Select();
                        AppWord.Selection.TypeText(sessionFormation.session_cursus.cursus.nom +" / "+ sessionFormation.session_cursus.nom);
                        break;

                    case "date":
                        champDeFusion.Select();
                        AppWord.Selection.TypeText(date.ToShortDateString());
                        break;

                    case "dureeFormation":
                        champDeFusion.Select();
                        String duree = sessionFormation.formation.duree + " jour" + ((sessionFormation.formation.duree == 1) ? "" : "s");
                        AppWord.Selection.TypeText(duree);
                        break;

                    case "formateur":
                        String nomsFormateurs = formateurs.First().GetNomPrenom();
                        foreach (formateur fmteur in formateurs.Skip(1))
                        {
                            nomsFormateurs += " & " + fmteur.GetNomPrenom();
                        }
                        champDeFusion.Select();
                        AppWord.Selection.TypeText(nomsFormateurs);
                        break;

                    case "societe":
                        champDeFusion.Select();
                        AppWord.Selection.TypeText(ste.GetNomAvecComplement());
                        break;

                }

            }

            Table tableau = docWord.Tables[1];
            int i = 4;
            foreach (stagiaire stg in stagiaires) {
                tableau.Cell(i, 1).Range.Text = stg.GetNomPrenom();
                tableau.Cell(i, 2).Range.Text = date.ToShortDateString();
                i++;
            }
        }
        public static void MergeFeuilleEvaluation(Document docWord, session_formation sessionFormation, IEnumerable<formateur> formateurs, stagiaire stg)
        {
            Range headfootRange = docWord.Sections[1].Headers[WdHeaderFooterIndex.wdHeaderFooterPrimary].Range;

            List<Field> fields = new List<Field>();
            foreach (Field field in headfootRange.Fields)
            {
                if (field.Type == Microsoft.Office.Interop.Word.WdFieldType.wdFieldMergeField)
                {
                    fields.Add(field);
                }
                ///do your processing
            }
            foreach (Field field in docWord.Fields)
            {
                if (field.Type == Microsoft.Office.Interop.Word.WdFieldType.wdFieldMergeField)
                {
                    fields.Add(field);
                }
            }

            foreach (Field champDeFusion in fields)
            {

                String nomChamp = GetNomChampDeFusion(champDeFusion);

                //remplissage en fonction du champ
                switch (nomChamp)
                {
                    case "intituleFormation":
                        champDeFusion.Select();
                        AppWord.Selection.TypeText(sessionFormation.formation.intitule);
                        break;

                    case "nomCursus":
                        champDeFusion.Select();
                        AppWord.Selection.TypeText(sessionFormation.session_cursus.cursus.nom + " / " + sessionFormation.session_cursus.nom);
                        break;

                    case "dateDebut":
                        champDeFusion.Select();
                        AppWord.Selection.TypeText(((DateTime)sessionFormation.date_debut).ToShortDateString());
                        break;

                    case "dateFin":
                        champDeFusion.Select();
                        AppWord.Selection.TypeText(sessionFormation.GetDateFin().ToShortDateString());
                        break;

                    case "formateur":
                        String nomsFormateurs = formateurs.First().GetNomPrenom();
                        foreach (formateur fmteur in formateurs.Skip(1))
                        {
                            nomsFormateurs += " & " + fmteur.GetNomPrenom();
                        }
                        champDeFusion.Select();
                        AppWord.Selection.TypeText(nomsFormateurs);
                        break;

                    case "nom_prenom":
                        champDeFusion.Select();
                        AppWord.Selection.TypeText(stg.GetNomPrenom());
                        break;

                    case "societe":
                        champDeFusion.Select();
                        AppWord.Selection.TypeText(stg.societe.GetNomAvecComplement());
                        break;

                    case "mail":
                        champDeFusion.Select();
                        AppWord.Selection.TypeText((stg.mail != null) ? stg.mail : " ");
                        break;

                    case "tel":
                        champDeFusion.Select();
                        AppWord.Selection.TypeText((stg.telephone != null) ? stg.telephone : " ");
                        break;
                }

            }
        }

        public static Document Merge(List<string> filesToMerge, string outputFilename, bool insertPageBreaks = true, string documentTemplate = null)
        {
            object defaultTemplate = (documentTemplate == null) ? System.Type.Missing : documentTemplate;
            object missing = System.Type.Missing;
            object pageBreak = WdBreakType.wdSectionBreakNextPage;
            object outputFile = outputFilename;

            // Create a new Word application
            if (filesToMerge.Count == 0) {
                return AppWord.Documents.Add(ref defaultTemplate, ref missing, ref missing, ref missing);
            }
            try
            {
                // dupliquer le 1er fichier pour constitue le doc de départ pour ajouter les autres docs
                String  nomFichier1 =filesToMerge.First();
                File.Copy(nomFichier1, outputFilename);
                 
                Document wordDocument = AppWord.Documents.Open(outputFilename);

                // Make a Word selection object.
                Selection selection = AppWord.Selection;

                //Count the number of documents to insert;
                int documentCount = filesToMerge.Count;

                //A counter that signals that we shoudn't insert a page break at the end of document.
                int breakStop = 0;

                // Loop thru each of the Word documents
                foreach (string file in filesToMerge.Skip(1))
                {
                    breakStop++;
                    // Insert the files to our template
                    selection.InsertFile(file
                                            , ref missing
                                            , ref missing
                                            , ref missing
                                            , ref missing);

                    //Do we want page breaks added after each documents?
                    if (insertPageBreaks && breakStop != documentCount)
                    {
                        selection.InsertBreak(ref pageBreak);
                    }
                }

                // Save the document to it's output file.
                wordDocument.SaveAs(
                                ref outputFile
                            , ref missing
                            , ref missing
                            , ref missing
                            , ref missing
                            , ref missing
                            , ref missing
                            , ref missing
                            , ref missing
                            , ref missing
                            , ref missing
                            , ref missing
                            , ref missing
                            , ref missing
                            , ref missing
                            , ref missing);

                // Clean up!
                return wordDocument;
            }
            catch (Exception ex)
            {
                //I didn't include a default error handler so i'm just throwing the error
                throw ex;
            }
            finally
            {
                // Finally, Close our Word application
                //                appWord.Quit(ref missing, ref missing, ref missing);
            }
        }

        ////public static Document Merge(List<string> filesToMerge, string outputFilename, bool insertPageBreaks=true, string documentTemplate= null)
        ////        {
        ////            object defaultTemplate = (documentTemplate==null)? System.Type.Missing: documentTemplate;
        ////            object missing = System.Type.Missing;
        ////            object pageBreak = WdBreakType.wdSectionBreakNextPage;
        ////            object outputFile = outputFilename;

        ////            // Create a new Word application

        ////            try
        ////            {
        ////                // Create a new file based on our template
        ////                Document wordDocument = AppWord.Documents.Add(ref defaultTemplate, ref missing, ref missing, ref missing);

        ////                // Make a Word selection object.
        ////                Selection selection = AppWord.Selection;

        ////                //Count the number of documents to insert;
        ////                int documentCount = filesToMerge.Count;

        ////                //A counter that signals that we shoudn't insert a page break at the end of document.
        ////                int breakStop = 0;

        ////                // Loop thru each of the Word documents
        ////                foreach (string file in filesToMerge)
        ////                {
        ////                    breakStop++;
        ////                    // Insert the files to our template
        ////                    selection.InsertFile(file
        ////                                            , ref missing
        ////                                            , ref missing
        ////                                            , ref missing
        ////                                            , ref missing);

        ////                    //Do we want page breaks added after each documents?
        ////                    if (insertPageBreaks && breakStop != documentCount)
        ////                    {
        ////                        selection.InsertBreak(ref pageBreak);
        ////                    }
        ////                }

        ////                // Save the document to it's output file.
        ////                wordDocument.SaveAs(
        ////                                ref outputFile
        ////                            , ref missing
        ////                            , ref missing
        ////                            , ref missing
        ////                            , ref missing
        ////                            , ref missing
        ////                            , ref missing
        ////                            , ref missing
        ////                            , ref missing
        ////                            , ref missing
        ////                            , ref missing
        ////                            , ref missing
        ////                            , ref missing
        ////                            , ref missing
        ////                            , ref missing
        ////                            , ref missing);

        ////                // Clean up!
        ////               return wordDocument;
        ////            }
        ////            catch (Exception ex)
        ////            {
        ////                //I didn't include a default error handler so i'm just throwing the error
        ////                throw ex;
        ////            }
        ////            finally
        ////            {
        ////                // Finally, Close our Word application
        //////                appWord.Quit(ref missing, ref missing, ref missing);
        ////            }
        ////        }
    }
}
    
