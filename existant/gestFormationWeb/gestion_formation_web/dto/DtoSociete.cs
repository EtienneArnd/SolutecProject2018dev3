using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using gestion_formation_web.dao;

namespace gestion_formation_web.dto
{
    public class DtoSociete
    {
        public static societe Get(int idSociete)
        {
            return DaoSociete.Get(idSociete);
        }
    }
}