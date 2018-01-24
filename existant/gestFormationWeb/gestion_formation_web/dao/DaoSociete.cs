using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoSociete : Dao
    {
        public static societe Get(int id_Societe)
        {
            return ctxt.societe.SingleOrDefault(e => e.id_societe == id_Societe);
        }
        public static IEnumerable<societe> Get()
        {
            return ctxt.societe.ToList();
        }
    }
}