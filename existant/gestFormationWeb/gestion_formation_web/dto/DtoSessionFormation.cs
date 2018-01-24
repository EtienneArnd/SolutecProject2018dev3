using System;
using System.Collections;
using System.Collections.Generic;
using gestion_formation_web.dao;

namespace gestion_formation_web.dto
{
    public class DtoSessionFormation
    {

        public static session_formation Get(int idSessionFormation)
        {
            return dao.DaoSessionFormation.Get(idSessionFormation);
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
       

        public static void Add(session_formation sessionFormation,formateur leFormateur, DateTime date)
        {
            dao.DaoSessionFormation.Add(sessionFormation, leFormateur, date);
        }

        public static void RemoveFormateurFromSession(int idFormateur, int idSessionFormation)
        {
            dao.DaoSessionFormation.RemoveFormateurFromSession(idFormateur, idSessionFormation);
        }
        public static void UpdateSessionFormation(int idSessionFormation, string dateDebut = "", string dateFin = "", string ordre = "", string Type = "", string tarifIntra = "")
        {
            dao.DaoSessionFormation.Update(idSessionFormation,dateDebut, dateFin, ordre, Type, tarifIntra);
        }
    }
}
