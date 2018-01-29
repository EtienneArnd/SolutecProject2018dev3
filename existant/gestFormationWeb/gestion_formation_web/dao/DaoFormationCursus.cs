using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoFormationCursus : Dao
    {
        public static IEnumerable<formation_cursus> Get(int idCursus)
        {
            return ctxt.formation_cursus.Where(fc => fc.id_cursus == idCursus).OrderBy(fc => fc.ordre).ToList();
        }
        public static formation_cursus Get(int idCursus, int idFormation)
        {
            return ctxt.formation_cursus.SingleOrDefault(fc => fc.id_cursus == idCursus && fc.id_formation == idFormation);
        }

        public static formation_cursus GetByOrder(int idCursus, int ordre)
        {
            return ctxt.formation_cursus.SingleOrDefault(fc => fc.id_cursus == idCursus && fc.ordre == ordre);
        }

        public static void Modifier(formation_cursus formationCursus)
        {
            int idFormation = formationCursus.id_formation;
            int idCursus = formationCursus.id_cursus;
            formation_cursus formationAModifier = ctxt.formation_cursus.SingleOrDefault(fc => fc.id_cursus == idCursus && fc.id_formation == idFormation);
            formationAModifier.ordre = formationCursus.ordre;
            ctxt.SaveChanges();
        }
    }
}