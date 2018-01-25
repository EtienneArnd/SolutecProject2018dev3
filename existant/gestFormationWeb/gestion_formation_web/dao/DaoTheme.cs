using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoTheme : Dao
    {
        public static IEnumerable<theme> Get()
        {
            return ctxt.theme.ToList();
        }
    }
}