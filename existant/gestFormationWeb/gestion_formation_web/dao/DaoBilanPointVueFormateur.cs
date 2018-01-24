using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoBilanPointVueFormateur : Dao
    {
        public static bilan_pointvue_formateur Get(int id_BilanPointVueFormateur)
        {
            return ctxt.bilan_pointvue_formateur.SingleOrDefault(bpvf => bpvf.id_bilan_pointvue_formateur == id_BilanPointVueFormateur);
        }
        public static IEnumerable<bilan_pointvue_formateur> GetBilanPointVueFormateur(int idBilanFormation)
        {
            if (idBilanFormation == 0)
            {
                return new List<bilan_pointvue_formateur>();
            }
            return ctxt.bilan_pointvue_formateur.Where(bpvf => bpvf.bilan_formation.id_bilan_formation == idBilanFormation).ToList();
        }
    }
}