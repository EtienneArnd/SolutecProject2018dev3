using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using gestion_formation_web.dao;

namespace gestion_formation_web.dto
{
    public class DtoSite
    {
        public static site Get(int idSite)
        {
            return DaoSite.Get(idSite);
        }
    }
}