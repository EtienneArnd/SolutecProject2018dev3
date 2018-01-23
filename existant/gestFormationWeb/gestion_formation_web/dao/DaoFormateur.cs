using System;
using System.Collections.Generic;
using System.Linq;



namespace gestion_formation_web.dao
{
    public class DaoFormateur : Dao
    {
        public static formateur Get(int idFormateur)
        { 
           return  ctxt.formateur.SingleOrDefault(f => f.id_formateur == idFormateur);
        }
        public static IEnumerable<formateur> Get(theme unTheme = null)
        {
            if (unTheme == null)
            {
                return ctxt.formateur.ToList();
            }
                return ctxt.theme_formateur.Where(tf => tf.id_theme == unTheme.id_theme).Select(f => f.formateur).ToList();
            }

        }
}


