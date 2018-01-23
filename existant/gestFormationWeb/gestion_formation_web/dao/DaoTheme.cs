using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoTheme : Dao
    {
        public static theme Get(int id_Theme)
        {
            return ctxt.theme.SingleOrDefault(t => t.id_theme == id_Theme);
        }
    }
}