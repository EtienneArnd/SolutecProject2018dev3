//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace gestion_formation_web
{
    using System;
    using System.Collections.Generic;
    
    public partial class formation_cursus
    {
        public Nullable<int> ordre { get; set; }
        public int id_cursus { get; set; }
        public int id_formation { get; set; }
    
        public virtual cursus cursus { get; set; }
        public virtual formation formation { get; set; }
    }
}
