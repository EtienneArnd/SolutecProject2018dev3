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
    
    public partial class session_formation
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public session_formation()
        {
            this.bilan_formation = new HashSet<bilan_formation>();
            this.formateur_session_formation = new HashSet<formateur_session_formation>();
            this.stagiaire_session_formation = new HashSet<stagiaire_session_formation>();
            this.contact = new HashSet<contact>();
        }
    
        public int id_session_formation { get; set; }
        public Nullable<System.DateTime> date_debut { get; set; }
        public Nullable<System.DateTime> date_fin { get; set; }
        public Nullable<int> ordre { get; set; }
        public Nullable<decimal> tarif_intra { get; set; }
        public string type { get; set; }
        public int id_formation { get; set; }
        public Nullable<int> id_session_cursus { get; set; }
        public Nullable<int> id_salle { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<bilan_formation> bilan_formation { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<formateur_session_formation> formateur_session_formation { get; set; }
        public virtual formation formation { get; set; }
        public virtual salle salle { get; set; }
        public virtual session_cursus session_cursus { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<stagiaire_session_formation> stagiaire_session_formation { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<contact> contact { get; set; }
    }
}
