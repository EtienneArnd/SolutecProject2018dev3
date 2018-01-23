using gestion_formation_web.dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dto
{
    public class DtoBilanEvalEnvironnement
    {
        public static bilan_eval_environnement Get(int idBilanEvalEnvironnement)
        {
            return DaoBilanEvalEnvironnement.Get(idBilanEvalEnvironnement);
        }
    }
}