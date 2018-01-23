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
    }
}