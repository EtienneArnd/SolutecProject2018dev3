using System;
using gestion_formation_web.dao;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace gestion_formation_web.dto
{
    public class DtoContact
    {
        public static contact Get(int idContact)
        {
            return DaoContact.Get(idContact);
        }
    }
}