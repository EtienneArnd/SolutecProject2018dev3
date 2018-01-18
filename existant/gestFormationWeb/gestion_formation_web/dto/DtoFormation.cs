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
            return DaoFormation.Get(idFormation) ;
        }

        public static formation Add(formation uneformation)
        {
            return DaoFormation.Add(uneformation);
        }

    }
}


