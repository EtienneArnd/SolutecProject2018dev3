using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using gestion_formation_web.dao;

namespace gestion_formation_web.dto
{
    public class DtoStagiaire
    {
        public static stagiaire Get(int idStagiaire)
        {
            return DaoStagiaire.Get(idStagiaire);
        }
    }
}