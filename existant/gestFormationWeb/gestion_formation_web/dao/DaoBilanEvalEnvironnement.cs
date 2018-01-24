using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoBilanEvalEnvironnement : Dao
    {

        public static bilan_eval_environnement Get(int id_BilanEvalEnvironnement)
        {
            return ctxt.bilan_eval_environnement.SingleOrDefault(bee => bee.id_bilan_eval_environnement == id_BilanEvalEnvironnement);
        }
        public static IEnumerable<bilan_eval_environnement> GetEvalEnvironnement(int idBilanFormation)
        {
            if (idBilanFormation == 0)
            {
                return new List<bilan_eval_environnement>();
            }
            return ctxt.bilan_eval_environnement.Where(bef => bef.bilan_formation.id_bilan_formation == idBilanFormation).ToList();
        }
    }
}