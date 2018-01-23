using System;
using gestion_formation_web.dao;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dto
{
    public class DtoBilanEvalFormation
    {
        public static bilan_eval_formation Get(int idBilanEvalFromation)
        {
            return DaoBilanEvalFormation.Get(idBilanEvalFromation);
        }
    }
}