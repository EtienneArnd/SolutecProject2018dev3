using System;
using gestion_formation_web.dao;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dto
{
    public class DtoBilanFormation
    {
        public static bilan_formation Get(int idBilanFormation)
        {
            return DaoBilanFormation.Get(idBilanFormation);
        }
    }
}