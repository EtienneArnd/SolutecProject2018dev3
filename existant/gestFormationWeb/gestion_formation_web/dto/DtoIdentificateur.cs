using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using gestion_formation_web.dao;

namespace gestion_formation_web.dto
{
    public class DtoIdentificateur
    {
        public static identificateur Get(int idIdentificateur)
        {
            return DaoIdentificateur.Get(idIdentificateur);
        }
    }
}