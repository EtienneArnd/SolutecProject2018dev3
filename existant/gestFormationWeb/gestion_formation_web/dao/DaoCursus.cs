using System;
using System.Collections.Generic;
using System.Linq;



namespace gestion_formation_web.dao
{
    public class DaoCursus : Dao
    {
        public static IEnumerable<cursus> Get()
        {
            return ctxt.cursus.ToList();
        }
        public static cursus Get(int idCursus)
        {
           return  ctxt.cursus.SingleOrDefault(c => c.id_cursus == idCursus);
        }
        public static IEnumerable<session_cursus> GetSessionsCursus(int idCursus)
        {
            if (idCursus == 0) return DaoSessionCursus.Get();
            return ctxt.session_cursus.Where( sc => sc.cursus.id_cursus == idCursus).ToList();
        }

        public static IEnumerable<formation> GetFormations(int idCursus)
        {
            return ctxt.formation_cursus.Where(fc => fc.id_cursus == idCursus).OrderBy(fc => fc.ordre).Select(fc => fc.formation).ToList();

            //            return ctxt.cursus.Include("formation_cursus").SingleOrDefault(c => c.id_cursus == idCursus).formation_cursus.Select(fc => fc.formation).OrderBy(f => f.formation_cursus.Select(fc => fc.ordre)).ToList();
        }
        public static IEnumerable<formation> GetAutresFormations(int idCursus)
        {
            //            return ctxt.formation.Except(ctxt.cursus.SingleOrDefault(c => c.id_cursus == idCursus).formation_cursus.Select(fc => fc.formation)).ToList();
            return ctxt.formation.Where(f => f.formation_cursus.All(fc => fc.id_cursus != idCursus)).ToList();
        }

        public static void Add(int idCursus, int idFormation)
        {
            int? maxOrder =  ctxt.formation_cursus.Where(fc => fc.id_cursus == idCursus).Max(fc => fc.ordre);
            int nextMaxOrder = (maxOrder == null) ? 1 : (int)maxOrder + 1;
            formation_cursus formationCursus = new formation_cursus
            {
//                cursus = Get(idCursus),
                id_cursus =idCursus,
//                formation = DaoFormation.Get(idFormation),
                id_formation = idFormation,
                ordre = nextMaxOrder
            };
            formationCursus = ctxt.formation_cursus.Add(formationCursus);

            ctxt.SaveChanges();
        }
    }
}


