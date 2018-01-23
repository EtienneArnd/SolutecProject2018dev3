using System;
using gestion_formation_web.dao;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dto
{
    public class DtoCategories
    {
        public static categorie Get(int idCategorie)
        {
            return DaoCategorie.Get(idCategorie);
        }
    }
}