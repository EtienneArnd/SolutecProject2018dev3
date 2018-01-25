using System;
using System.Collections.Generic;

using gestion_formation_web.dao;

namespace gestion_formation_web.dto
{
    public class DtoCursus
    {
        public static IEnumerable<cursus> Get()
        {
            return DaoCursus.Get();
        }
        public static cursus Get(int idCursus)
        {
            return DaoCursus.Get(idCursus);
        }
        public static IEnumerable<session_cursus> GetSessionsCursus(int idCursus)
        {
            return DaoCursus.GetSessionsCursus(idCursus);
        }

        public static IEnumerable<formation> GetFormations(int idCursus)
        {
            return DaoCursus.GetFormations(idCursus);
        }

        public static IEnumerable<formation> GetAutresFormations(int idCursus)
        {
            return DaoCursus.GetAutresFormations(idCursus);
        }

        internal static void Add(int idCursus, int idFormation)
        {
            //cursus leCursus = Get(idCursus);
            //formation laFormation = DtoFormation.Get(idFormation);
            //DaoCursus.Add(leCursus, laFormation);
             DaoCursus.Add(idCursus, idFormation);
        }
    }
}
