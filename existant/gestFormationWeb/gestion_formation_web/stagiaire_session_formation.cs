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
    
    public partial class stagiaire_session_formation
    {
        public Nullable<decimal> tarif { get; set; }
        public int id_stagiaire { get; set; }
        public int id_session_formation { get; set; }
    
        public virtual session_formation session_formation { get; set; }
        public virtual stagiaire stagiaire { get; set; }
    }
}
