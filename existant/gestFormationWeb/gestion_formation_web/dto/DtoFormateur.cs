using System;
using System.Collections.Generic;

using gestion_formation_web.dao;

namespace gestion_formation_web.dto
{
    public class DtoFormateur
    {
        public static IEnumerable<formateur> Get(theme unTheme=null)
        {
            return DaoFormateur.Get(unTheme);
        }
        public static formateur Get(int idFormateur)
        {
            return DaoFormateur.Get(idFormateur);
        }

    }
}
