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
    
    public partial class personnel
    {
        public int id_personnel { get; set; }
        public string nom { get; set; }
        public string prenom { get; set; }
        public string civilite { get; set; }
        public string mail { get; set; }
        public string telephone { get; set; }
        public Nullable<int> id_identificateur { get; set; }
    
        public virtual identificateur identificateur { get; set; }
    }
}
