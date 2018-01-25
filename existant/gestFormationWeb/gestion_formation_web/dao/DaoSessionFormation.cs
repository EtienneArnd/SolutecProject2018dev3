using System;
using System.Collections.Generic;
using System.Linq;



namespace gestion_formation_web.dao
{
    public class DaoSessionFormation : Dao
    {
        public static session_formation Get(int idSessionFormation)
        { 
           return  ctxt.session_formation.SingleOrDefault(cs => cs.id_session_formation == idSessionFormation);
        }
        public static IEnumerable<stagiaire> GetStagiaires(int idSessionFormation)
        {
            return  ctxt.stagiaire_session_formation.Where (ssf => ssf.id_session_formation == idSessionFormation).Select(ssf => ssf.stagiaire).ToList();
        }
        public static IEnumerable<stagiaire> GetStagiaires(int idSessionFormation, int idSociete )
        {
            return ctxt.stagiaire_session_formation.Where(ssf => ssf.id_session_formation == idSessionFormation).Select(ssf => ssf.stagiaire).Where(st => st.societe.id_societe == idSociete).ToList();
        }
        public static IEnumerable<formateur> GetFormateurs(int idSessionFormation)
        {
            List<formateur> formateurs = ctxt.session_formation.SingleOrDefault(cs => cs.id_session_formation == idSessionFormation).formateur_session_formation.Select(ssf => ssf.formateur).ToList();
            //formateur[] dates = formateurs.ToArray<formateur>();
            //return ctxt.formateur.Where(f => f.formateur_session_formation.Where(fsf => fsf.id_session_formation == idSessionFormation)).ToList();
            return formateurs;
        }

        public static IEnumerable<formateur> GetAutresFormateurs(int idSessionFormation)
        {
            return ctxt.formateur.Where(f => f.formateur_session_formation.All(fsf => fsf.id_session_formation != idSessionFormation)).ToList();
        }

        public static IEnumerable<societe> GetSocietes(int idSessionFormation)
        {
            //return ctxt.stagiaire_session_formation.Where(ssf => ssf.id_session_formation == idSessionFormation).Select(ssf => ssf.stagiaire.societe).ToList();
            return ctxt.stagiaire_session_formation.Where(ssf => ssf.id_session_formation == idSessionFormation).Select(ssf => ssf.stagiaire.societe).Distinct().ToList();
        }



        public static void Add(session_formation sessionFormation, formateur leFormateur, DateTime date)
        {
            formateur_session_formation fsf = new formateur_session_formation {
                formateur = leFormateur,
                session_formation = sessionFormation
            };
            if (date != DateTime.MinValue)
            {
                fsf.date_debut = date;
            }
            ctxt.formateur_session_formation.Add(fsf);
            Dao.Update();
        }

        internal static void RemoveFormateurFromSession(int idFormateur, int idSessionFormation)
        {
            formateur_session_formation formateurSessionFormation = ctxt.formateur_session_formation.First(fsf => fsf.id_formateur == idFormateur && fsf.id_session_formation == idSessionFormation);
            if (formateurSessionFormation != null)
            {
                ctxt.formateur_session_formation.Remove(formateurSessionFormation);
                ctxt.SaveChanges();
            }
        }
        public static void Update(int idSessionFormation, string dateDebut, string dateFin, string ordre, string Type, string tarifIntra)
        {
            session_formation sessionformation = dao.DaoSessionFormation.Get(idSessionFormation);
            try
            {
                sessionformation.date_debut = (dateDebut == null || dateDebut == "") ? sessionformation.date_debut : DateTime.Parse(dateDebut);
                sessionformation.date_fin = (dateFin == null || dateFin == "") ? null : (DateTime?)DateTime.Parse(dateFin);
                sessionformation.ordre = (ordre == null || ordre == "") ? sessionformation.ordre : int.Parse(ordre);
                sessionformation.type = Type;
                sessionformation.tarif_intra = (ordre == null || ordre == "") ? sessionformation.tarif_intra : decimal.Parse(ordre);
                ctxt.SaveChanges();
            }
            catch
            {
                //Nothing to do
                Console.WriteLine("Echec de la mise à jour de la SessionFormation #"+idSessionFormation);
            }
            
        }

    }
}


