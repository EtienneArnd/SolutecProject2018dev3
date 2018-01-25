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
        public static void Modifier(formation uneformation)
        {
            int idFormation = uneformation.id_formation;
            formation formationAModifier = ctxt.formation.SingleOrDefault(cs => cs.id_formation == idFormation);
            formationAModifier.intitule = uneformation.intitule;
            formationAModifier.duree = uneformation.duree;
            formationAModifier.tarif_inter = uneformation.tarif_inter;
            formationAModifier.tarif_intra = uneformation.tarif_intra;
            formationAModifier.niveau = uneformation.niveau;
            formationAModifier.id_theme = uneformation.id_theme;
            ctxt.SaveChanges();
        }
    }
}


