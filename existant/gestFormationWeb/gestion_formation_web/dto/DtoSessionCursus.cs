using System;
using System.Collections.Generic;
using gestion_formation_web.dao;

namespace gestion_formation_web.dto
{
    public class DtoSessionCursus
    {

        public IEnumerable<session_cursus> Get()
        {
            return dao.DaoSessionCursus.Get();
        }
        public static session_cursus Get(int idSessionCursus)
        {
            return dao.DaoSessionCursus.Get(idSessionCursus);
        }
        public static IEnumerable<stagiaire> GetStagiaires(int idSessionCursus)
        {
            if (idSessionCursus > 0)
                return dao.DaoSessionCursus.GetStagiaires(idSessionCursus);
            return null;
        }
        public static IEnumerable<session_formation> GetSessionsFormation(int idSessionCursus)
        {
            if (idSessionCursus >0)
                return dao.DaoSessionCursus.GetSessionsFormation(idSessionCursus);
            return null;
        }

        public static void CalculerDatesSessionsFormationCursus(int idSessionCursus)
        {
            session_cursus sessionCursus = Get(idSessionCursus);
            DateTime dateDebut = (DateTime)sessionCursus.date_debut;
            DateTime dateFin;
            foreach (session_formation sessionFormation in GetSessionsFormation(idSessionCursus))
            {
                sessionFormation.date_debut = dateDebut;
                dateFin = Globale.AddDuree2Date(dateDebut, (int)sessionFormation.formation.duree);
                sessionFormation.date_fin = dateFin;
                dateDebut = Globale.NextDate(dateFin);
            }
            dao.Dao.Update();
        }

        internal static void Add(session_cursus sessionCursus)
        {
            dao.DaoSessionCursus.Add(sessionCursus);

        }
    }
}
