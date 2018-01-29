using System;
using System.Collections.Generic;
using System.Linq;



namespace gestion_formation_web.dao
{
    public class DaoSessionCursus : Dao
    {
        public static IEnumerable<session_cursus> Get()
        {
            //var sessionsCursus = (from sc in ctxt.session_cursus
            //                      select sc). ToList();

            //return sessionsCursus;

            return ctxt.session_cursus.Include("cursus").ToList();
        }
        public static session_cursus Get(int idSessionCursus)
        {

           return  ctxt.session_cursus.SingleOrDefault(cs => cs.id_session_cursus == idSessionCursus);

        }
        public static IEnumerable<stagiaire> GetStagiaires(int idSessionCursus)
        {
            var sessionCursus = ctxt.session_cursus.SingleOrDefault(cs => cs.id_session_cursus == idSessionCursus);
            return sessionCursus.stagiaire.OrderBy(s => s.nom).ThenBy(s=>s.prenom);
        }
        public static IEnumerable<session_formation> GetSessionsFormation(int idSessionCursus)
        {
            var sessionCursus = ctxt.session_cursus.SingleOrDefault(cs => cs.id_session_cursus == idSessionCursus);
            return sessionCursus.session_formation.OrderBy(sf => sf.ordre);
            //return ctxt.session_formation.Where(sf => sf.id_session_cursus == idSessionCursus);
        }

        internal static void Add(session_cursus sessionCursus)
        {
            ctxt.session_cursus.Add(sessionCursus);
            Dao.Update();
        }

        
    //public static IEnumerable<Object> get2()
    //{
    //    var sessionsCursus = (from sc in ctxt.session_cursus
    //                          select new
    //                          {
    //                              idSessionCursus = sc.id_session_cursus,
    //                              intitule = sc.nom,
    //                              intituleCursus = sc.cursus.nom,
    //                              //stagiaires = sc.stagiaire,
    //                              //sessionsFormations = sc.session_formation
    //                          });

    //        return sessionsCursus.Cast<Object>();
    //    }

}
}


