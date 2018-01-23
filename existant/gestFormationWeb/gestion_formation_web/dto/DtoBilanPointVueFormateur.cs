using System;
using gestion_formation_web.dao;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dto
{
    public class DtoBilanPointVueFormateur
    {
        public static bilan_pointvue_formateur Get(int idBilanPoitnvueFormateur)
        {
            return DaoBilanPointVueFormateur.Get(idBilanPoitnvueFormateur);
        }
    }
}