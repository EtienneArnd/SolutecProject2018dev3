using System;
using System.Collections;
using System.Collections.Generic;

namespace gestion_formation_web.dto
{
    public class DtoSessionFormation
    {

        public static session_formation Get(int idSessionFormation)
        {
            return dao.DaoSessionFormation.Get(idSessionFormation);
        }
        public static IEnumerable<session_formation> GetSessionFormation(int idFormation)
        {
            return dao.DaoSessionFormation.GetSessionFormation(idFormation);
        }

        public static IEnumerable<stagiaire> GetStagiaires(int idSessionFormation)
        {
            return dao.DaoSessionFormation.GetStagiaires(idSessionFormation);
        }
        public static IEnumerable<formateur> GetFormateurs(int idSessionFormation)
        {
            return dao.DaoSessionFormation.GetFormateurs(idSessionFormation);
        }

        public static IEnumerable<formateur> GetAutresFormateurs(int idSessionFormation)
        {
            return dao.DaoSessionFormation.GetAutresFormateurs(idSessionFormation);
        }
        public static IEnumerable<societe> GetSocietes(int idSessionFormation)
        {
            return dao.DaoSessionFormation.GetSocietes(idSessionFormation);
        }
        public static IEnumerable<stagiaire> GetStagiaires(int idSessionFormation, int idSociete)
        {
            return dao.DaoSessionFormation.GetStagiaires(idSessionFormation, idSociete);
        }

        public static void update(session_formation sessionFormation)
        {
            dao.Dao.Update();
        }
       

        public static IEnumerable<CoupletNomValeur> getTypesFormation()
        {
            string []valeurs = dao.Dao.getEnumValues("session_formation", "type");
            List<CoupletNomValeur> listeValeurs = new List<CoupletNomValeur>();

            foreach (string val in valeurs)
            {
                listeValeurs.Add(new CoupletNomValeur { nom = "type", valeur = val });
            }
            return listeValeurs;
        }

        public static void Add(session_formation sessionFormation,formateur leFormateur, DateTime date)
        {
            dao.DaoSessionFormation.Add(sessionFormation, leFormateur, date);
        }

        public static void RemoveFormateurFromSession(int idFormateur, int idSessionFormation)
        {
            dao.DaoSessionFormation.RemoveFormateurFromSession(idFormateur, idSessionFormation);
        }
        public static void UpdateSessionFormation(int idSessionFormation, string dateDebut = "", string dateFin = "", string ordre = "", string type = "", string tarifIntra = "")
        {
            dao.DaoSessionFormation.Update(idSessionFormation,dateDebut, dateFin, ordre, type, tarifIntra);
        }
    }
}
