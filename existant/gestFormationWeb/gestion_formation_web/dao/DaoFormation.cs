using System;
using System.Collections.Generic;
using System.Linq;



namespace gestion_formation_web.dao
{
    public class DaoFormation : Dao
    {
        public static formation Get(int idFormation)
        {
        return ctxt.formation.SingleOrDefault(cs => cs.id_formation == idFormation);
        }
        public static formation Get(string intitule)
        {
            return ctxt.formation.SingleOrDefault(cs => cs.intitule == intitule);
        }
        public static IEnumerable<formation> Get()
        {
            return ctxt.formation.ToList();
        }

        public static void Add(formation uneformation)
        {
            ctxt.formation.Add(uneformation);
            Update();
        }
    }
}


