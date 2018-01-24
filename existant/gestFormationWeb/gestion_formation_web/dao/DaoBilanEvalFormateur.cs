using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoBilanEvalFormateur : Dao
    {

        public static bilan_eval_formateur Get(int id_BilanEvalFormateur)
        {
            return ctxt.bilan_eval_formateur.SingleOrDefault(bef => bef.id_bilan_formateur == id_BilanEvalFormateur);
        }
        public static IEnumerable<bilan_eval_formateur> GetEvalFormateur(int idBilanFormation)
        {
            if (idBilanFormation == 0)
            {
                return new List<bilan_eval_formateur>();
            }
            return ctxt.bilan_eval_formateur.Where(bef => bef.bilan_formation.id_bilan_formation == idBilanFormation).ToList();
        }
    }
}