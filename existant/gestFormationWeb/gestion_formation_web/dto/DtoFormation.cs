using System;
using System.Collections.Generic;
using System.Linq;

using gestion_formation_web.dao;


namespace gestion_formation_web.dto
{
    public class DtoFormation 
    {
        public static formation Get(int idFormation)
        {
            return DaoFormation.Get(idFormation);
        }
        public static formation Get(string intitule)
        {
            return DaoFormation.Get(intitule);
        }
        public static IEnumerable<formation> Get()
        {
            return DaoFormation.Get();
        }

        public static void Add(formation uneformation)
        {
            DaoFormation.Add(uneformation);
        }

    }
}


