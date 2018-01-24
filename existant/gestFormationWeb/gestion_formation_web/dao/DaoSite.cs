using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoSite : Dao
    {
        public static site Get(int id_Site)
        {
            return ctxt.site.SingleOrDefault(s => s.id_site == id_Site);
        }
        public static IEnumerable<site> Get()
        {
            return ctxt.site.ToList();
        }
    }
}