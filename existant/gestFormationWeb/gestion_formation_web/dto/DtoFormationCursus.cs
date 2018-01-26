using gestion_formation_web.dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dto
{
    public class DtoFormationCursus
    {
        public static IEnumerable<formation_cursus> Get(int idCursus)
        {
            return DaoFormationCursus.Get(idCursus);
        }
        public static formation_cursus Get(int idCursus, int idFormation)
        {
            return DaoFormationCursus.Get(idCursus, idFormation);
        }
        public static formation_cursus GetByOrder(int idCursus, int ordre)
        {
            return DaoFormationCursus.GetByOrder(idCursus, ordre);
        }
        public static void Modifier(formation_cursus formationCursus)
        {
            DaoFormationCursus.Modifier(formationCursus);
        }
    }
}