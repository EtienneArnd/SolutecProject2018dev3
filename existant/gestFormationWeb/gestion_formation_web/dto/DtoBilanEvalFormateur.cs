using System;
using gestion_formation_web.dao;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dto
{
    public class DtoBilanEvalFormateur
    {
        public static bilan_eval_formateur Get(int idBilanEvalFormateur)
        {
            return DtoBilanEvalFormateur.Get(idBilanEvalFormateur);
        }
    }
}