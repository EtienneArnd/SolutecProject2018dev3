using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dao
{
    public class DaoContact : Dao
    {
        public static contact Get(int id_Contact)
        {
            return ctxt.contact.SingleOrDefault(c => c.id_contact == id_Contact);
        }
    }
}