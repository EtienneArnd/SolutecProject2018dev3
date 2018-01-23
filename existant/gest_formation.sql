#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: stagiaire
#------------------------------------------------------------

CREATE TABLE stagiaire(
        id_stagiaire   int (11) Auto_increment  NOT NULL ,
        nom            Varchar (150) NOT NULL ,
        prenom         Varchar (150) ,
        date_naissance Date ,
        civilite       Enum ("Monsieur","Madame") ,
        mail           Varchar (150) ,
        telephone      Varchar (10) ,
        id_societe     Int NOT NULL ,
        PRIMARY KEY (id_stagiaire )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: cursus
#------------------------------------------------------------

CREATE TABLE cursus(
        id_cursus    int (11) Auto_increment  NOT NULL ,
        nom          Varchar (150) ,
        tarif        Decimal (15,3) ,
        id_personnel Int NOT NULL ,
        PRIMARY KEY (id_cursus )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: formation
#------------------------------------------------------------

CREATE TABLE formation(
        id_formation int (11) Auto_increment  NOT NULL ,
        duree        Int NOT NULL ,
        tarif_intra  Decimal (15,3) ,
        tarif_inter  Decimal (15,3) ,
        intitule     Varchar (255) ,
        niveau       Enum ("Base","Moyen","Comfirmé","Expert") ,
        id_theme     Int NOT NULL ,
        PRIMARY KEY (id_formation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: session_formation
#------------------------------------------------------------

CREATE TABLE session_formation(
        id_session_formation int (11) Auto_increment  NOT NULL ,
        date_debut           Date ,
        date_fin             Date ,
        ordre                Int ,
        tarif_intra          Decimal (15) ,
        type                 Enum ("intra","inter") ,
        id_formation         Int NOT NULL ,
        id_session_cursus    Int NOT NULL ,
        PRIMARY KEY (id_session_formation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: formateur
#------------------------------------------------------------

CREATE TABLE formateur(
        id_formateur      int (11) Auto_increment  NOT NULL ,
        nom               Varchar (100) ,
        prenom            Varchar (100) ,
        date_naissance    Date ,
        statut            Enum ("Externe","Interne") ,
        telephone         Varchar (10) ,
        adresse           Varchar (70) ,
        cout              Decimal (15,3) ,
        civilite          Enum ("Monsieur","Madame") ,
        mail              Varchar (150) ,
        id_ville          Int NOT NULL ,
        id_identificateur Int NOT NULL ,
        id_societe        Int NOT NULL ,
        PRIMARY KEY (id_formateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: session_cursus
#------------------------------------------------------------

CREATE TABLE session_cursus(
        id_session_cursus      int (11) Auto_increment  NOT NULL ,
        nom                    Varchar (25) ,
        date_debut             Date ,
        id_cursus              Int NOT NULL ,
        id_personnel           Int NOT NULL ,
        id_personnel_Personnel Int NOT NULL ,
        PRIMARY KEY (id_session_cursus )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ville
#------------------------------------------------------------

CREATE TABLE ville(
        id_ville    Int NOT NULL ,
        nom         Varchar (150) ,
        code_postal Int ,
        PRIMARY KEY (id_ville )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: equipement
#------------------------------------------------------------

CREATE TABLE equipement(
        id_equipement int (11) Auto_increment  NOT NULL ,
        numero_serie  Varchar (25) ,
        type          Varchar (25) ,
        id_salle      Int NOT NULL ,
        PRIMARY KEY (id_equipement )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: identificateur
#------------------------------------------------------------

CREATE TABLE identificateur(
        id_identificateur int (11) Auto_increment  NOT NULL ,
        logger            Varchar (25) ,
        mdp               Varchar (25) ,
        droit             Enum ("Administration","Formateur","Stagiaire","SuperAdmin") ,
        id_stagiaire      Int NOT NULL ,
        id_personnel      Int NOT NULL ,
        PRIMARY KEY (id_identificateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: theme
#------------------------------------------------------------

CREATE TABLE theme(
        id_theme     int (11) Auto_increment  NOT NULL ,
        nom          Varchar (25) ,
        id_categorie Int NOT NULL ,
        PRIMARY KEY (id_theme )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: salle
#------------------------------------------------------------

CREATE TABLE salle(
        id_salle             int (11) Auto_increment  NOT NULL ,
        nom                  Varchar (250) ,
        capacite             Int ,
        id_site              Int NOT NULL ,
        id_session_formation Int NOT NULL ,
        PRIMARY KEY (id_salle )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: bilan
#------------------------------------------------------------

CREATE TABLE bilan(
        id_bilan             int (11) Auto_increment  NOT NULL ,
        id_stagiaire         Int NOT NULL ,
        id_formateur         Int NOT NULL ,
        id_session_formation Int NOT NULL ,
        PRIMARY KEY (id_bilan )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: bilan_formateur
#------------------------------------------------------------

CREATE TABLE bilan_formateur(
        id_bilan_formateur            int (11) Auto_increment  NOT NULL ,
        formateur_maitrise_sujet      Int ,
        formateur_qualite_pedagogique Int ,
        formateur_disponibilite_aide  Int ,
        id_bilan                      Int NOT NULL ,
        PRIMARY KEY (id_bilan_formateur ,id_bilan )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: bilan_environnement_moyen_pedagogique
#------------------------------------------------------------

CREATE TABLE bilan_environnement_moyen_pedagogique(
        id_bilan_environnement_moyen_pedagogique              int (11) Auto_increment  NOT NULL ,
        environnement_moyen_pedagogique_acceuil               Int ,
        environnement_moyen_pedagogique_salle_formation       Int ,
        environnement_moyen_pedagogique_materiel_informatique Int ,
        environnement_moyen_pedagogique_support_cours         Int ,
        id_bilan                                              Int NOT NULL ,
        PRIMARY KEY (id_bilan_environnement_moyen_pedagogique ,id_bilan )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: bilan_formation
#------------------------------------------------------------

CREATE TABLE bilan_formation(
        id_bilan_formation                        int (11) Auto_increment  NOT NULL ,
        formation_information_prealable_contenu   Int ,
        formation_contenu_adapte_niveau           Int ,
        formation_frequence_exercices             Int ,
        formation_adaptation_exercices_profession Int ,
        formation_niveau_groupe_homogene          Int ,
        formation_stage_correspondant_besoin      Int ,
        id_bilan                                  Int NOT NULL ,
        PRIMARY KEY (id_bilan_formation ,id_bilan )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: bilan_satisfaction_globale
#------------------------------------------------------------

CREATE TABLE bilan_satisfaction_globale(
        id_bilan_satisfaction_globale                 int (11) Auto_increment  NOT NULL ,
        satisfaction_globale_niveau                   Int ,
        satisfaction_globale_points_forts_stage       Varchar (2000) ,
        satisfaction_globale_points_faibles_stage     Varchar (2000) ,
        satisfaction_globale_observations_diverses    Varchar (2000) ,
        satisfaction_globale_formation_complementaire Varchar (2000) ,
        id_bilan                                      Int NOT NULL ,
        PRIMARY KEY (id_bilan_satisfaction_globale ,id_bilan )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: bilan_point_vue_formateur
#------------------------------------------------------------

CREATE TABLE bilan_point_vue_formateur(
        id_bilan_point_vue_formateur                       int (11) Auto_increment  NOT NULL ,
        point_vue_formateur_stagiaire_pre_requis           Int ,
        point_vue_formateur_qualite_ecoute                 Int ,
        point_vue_formateur_integration_notions_presentees Int ,
        point_vue_formateur_stage_correspond_besoin        Int ,
        point_vue_formateur_observations_formateur         Varchar (2000) ,
        id_bilan                                           Int NOT NULL ,
        PRIMARY KEY (id_bilan_point_vue_formateur ,id_bilan )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: site
#------------------------------------------------------------

CREATE TABLE site(
        id_site  int (11) Auto_increment  NOT NULL ,
        adresse  Varchar (255) ,
        nom      Varchar (31) ,
        id_ville Int NOT NULL ,
        PRIMARY KEY (id_site )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: pre_requis
#------------------------------------------------------------

CREATE TABLE pre_requis(
        id_pre_requis int (11) Auto_increment  NOT NULL ,
        description   Varchar (63) ,
        valeur        Varchar (255) ,
        cout          Int ,
        type_cout     Varchar (31) ,
        PRIMARY KEY (id_pre_requis )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: certification
#------------------------------------------------------------

CREATE TABLE certification(
        id                   int (11) Auto_increment  NOT NULL ,
        label                Varchar (25) ,
        reference            Varchar (25) ,
        id_session_formation Int NOT NULL ,
        id_stagiaire         Int NOT NULL ,
        PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Personnel
#------------------------------------------------------------

CREATE TABLE Personnel(
        id_personnel int (11) Auto_increment  NOT NULL ,
        nom          Varchar (25) ,
        prenom       Varchar (25) ,
        PRIMARY KEY (id_personnel )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: societe
#------------------------------------------------------------

CREATE TABLE societe(
        id_societe     int (11) Auto_increment  NOT NULL ,
        nom            Varchar (250) ,
        complement_nom Varchar (250) ,
        telephone      Char (10) ,
        adresse        Varchar (250) ,
        mail           Varchar (150) ,
        id_ville       Int NOT NULL ,
        PRIMARY KEY (id_societe )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: categorie
#------------------------------------------------------------

CREATE TABLE categorie(
        id_categorie int (11) Auto_increment  NOT NULL ,
        nom          Varchar (150) ,
        PRIMARY KEY (id_categorie )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: formation_cursus
#------------------------------------------------------------

CREATE TABLE formation_cursus(
        ordre        Int ,
        id_formation Int NOT NULL ,
        id_cursus    Int NOT NULL ,
        PRIMARY KEY (id_formation ,id_cursus )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: stagiaire_session_formation
#------------------------------------------------------------

CREATE TABLE stagiaire_session_formation(
        tarif                Decimal (15,3) ,
        id_stagiaire         Int NOT NULL ,
        id_session_formation Int NOT NULL ,
        PRIMARY KEY (id_stagiaire ,id_session_formation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: formateur_session_formation
#------------------------------------------------------------

CREATE TABLE formateur_session_formation(
        date_debut           Date ,
        duree                Int ,
        tarif                Decimal (15,3) ,
        frais                Decimal (15,3) ,
        id_formateur         Int NOT NULL ,
        id_session_formation Int NOT NULL ,
        PRIMARY KEY (id_formateur ,id_session_formation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: stagiaire_session_cursus
#------------------------------------------------------------

CREATE TABLE stagiaire_session_cursus(
        id_stagiaire      Int NOT NULL ,
        id_session_cursus Int NOT NULL ,
        PRIMARY KEY (id_stagiaire ,id_session_cursus )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: theme_formateur
#------------------------------------------------------------

CREATE TABLE theme_formateur(
        niveau       Enum ("Base","Moyen","Comfirmé","Expert") ,
        id_formateur Int NOT NULL ,
        id_theme     Int NOT NULL ,
        PRIMARY KEY (id_formateur ,id_theme )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: formation_pre_requis
#------------------------------------------------------------

CREATE TABLE formation_pre_requis(
        id_formation  Int NOT NULL ,
        id_pre_requis Int NOT NULL ,
        PRIMARY KEY (id_formation ,id_pre_requis )
)ENGINE=InnoDB;

ALTER TABLE stagiaire ADD CONSTRAINT FK_stagiaire_id_societe FOREIGN KEY (id_societe) REFERENCES societe(id_societe);
ALTER TABLE cursus ADD CONSTRAINT FK_cursus_id_personnel FOREIGN KEY (id_personnel) REFERENCES Personnel(id_personnel);
ALTER TABLE formation ADD CONSTRAINT FK_formation_id_theme FOREIGN KEY (id_theme) REFERENCES theme(id_theme);
ALTER TABLE session_formation ADD CONSTRAINT FK_session_formation_id_formation FOREIGN KEY (id_formation) REFERENCES formation(id_formation);
ALTER TABLE session_formation ADD CONSTRAINT FK_session_formation_id_session_cursus FOREIGN KEY (id_session_cursus) REFERENCES session_cursus(id_session_cursus);
ALTER TABLE formateur ADD CONSTRAINT FK_formateur_id_ville FOREIGN KEY (id_ville) REFERENCES ville(id_ville);
ALTER TABLE formateur ADD CONSTRAINT FK_formateur_id_identificateur FOREIGN KEY (id_identificateur) REFERENCES identificateur(id_identificateur);
ALTER TABLE formateur ADD CONSTRAINT FK_formateur_id_societe FOREIGN KEY (id_societe) REFERENCES societe(id_societe);
ALTER TABLE session_cursus ADD CONSTRAINT FK_session_cursus_id_cursus FOREIGN KEY (id_cursus) REFERENCES cursus(id_cursus);
ALTER TABLE session_cursus ADD CONSTRAINT FK_session_cursus_id_personnel FOREIGN KEY (id_personnel) REFERENCES Personnel(id_personnel);
ALTER TABLE session_cursus ADD CONSTRAINT FK_session_cursus_id_personnel_Personnel FOREIGN KEY (id_personnel_Personnel) REFERENCES Personnel(id_personnel);
ALTER TABLE equipement ADD CONSTRAINT FK_equipement_id_salle FOREIGN KEY (id_salle) REFERENCES salle(id_salle);
ALTER TABLE identificateur ADD CONSTRAINT FK_identificateur_id_stagiaire FOREIGN KEY (id_stagiaire) REFERENCES stagiaire(id_stagiaire);
ALTER TABLE identificateur ADD CONSTRAINT FK_identificateur_id_personnel FOREIGN KEY (id_personnel) REFERENCES Personnel(id_personnel);
ALTER TABLE theme ADD CONSTRAINT FK_theme_id_categorie FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie);
ALTER TABLE salle ADD CONSTRAINT FK_salle_id_site FOREIGN KEY (id_site) REFERENCES site(id_site);
ALTER TABLE salle ADD CONSTRAINT FK_salle_id_session_formation FOREIGN KEY (id_session_formation) REFERENCES session_formation(id_session_formation);
ALTER TABLE bilan ADD CONSTRAINT FK_bilan_id_stagiaire FOREIGN KEY (id_stagiaire) REFERENCES stagiaire(id_stagiaire);
ALTER TABLE bilan ADD CONSTRAINT FK_bilan_id_formateur FOREIGN KEY (id_formateur) REFERENCES formateur(id_formateur);
ALTER TABLE bilan ADD CONSTRAINT FK_bilan_id_session_formation FOREIGN KEY (id_session_formation) REFERENCES session_formation(id_session_formation);
ALTER TABLE bilan_formateur ADD CONSTRAINT FK_bilan_formateur_id_bilan FOREIGN KEY (id_bilan) REFERENCES bilan(id_bilan);
ALTER TABLE bilan_environnement_moyen_pedagogique ADD CONSTRAINT FK_bilan_environnement_moyen_pedagogique_id_bilan FOREIGN KEY (id_bilan) REFERENCES bilan(id_bilan);
ALTER TABLE bilan_formation ADD CONSTRAINT FK_bilan_formation_id_bilan FOREIGN KEY (id_bilan) REFERENCES bilan(id_bilan);
ALTER TABLE bilan_satisfaction_globale ADD CONSTRAINT FK_bilan_satisfaction_globale_id_bilan FOREIGN KEY (id_bilan) REFERENCES bilan(id_bilan);
ALTER TABLE bilan_point_vue_formateur ADD CONSTRAINT FK_bilan_point_vue_formateur_id_bilan FOREIGN KEY (id_bilan) REFERENCES bilan(id_bilan);
ALTER TABLE site ADD CONSTRAINT FK_site_id_ville FOREIGN KEY (id_ville) REFERENCES ville(id_ville);
ALTER TABLE certification ADD CONSTRAINT FK_certification_id_session_formation FOREIGN KEY (id_session_formation) REFERENCES session_formation(id_session_formation);
ALTER TABLE certification ADD CONSTRAINT FK_certification_id_stagiaire FOREIGN KEY (id_stagiaire) REFERENCES stagiaire(id_stagiaire);
ALTER TABLE societe ADD CONSTRAINT FK_societe_id_ville FOREIGN KEY (id_ville) REFERENCES ville(id_ville);
ALTER TABLE formation_cursus ADD CONSTRAINT FK_formation_cursus_id_formation FOREIGN KEY (id_formation) REFERENCES formation(id_formation);
ALTER TABLE formation_cursus ADD CONSTRAINT FK_formation_cursus_id_cursus FOREIGN KEY (id_cursus) REFERENCES cursus(id_cursus);
ALTER TABLE stagiaire_session_formation ADD CONSTRAINT FK_stagiaire_session_formation_id_stagiaire FOREIGN KEY (id_stagiaire) REFERENCES stagiaire(id_stagiaire);
ALTER TABLE stagiaire_session_formation ADD CONSTRAINT FK_stagiaire_session_formation_id_session_formation FOREIGN KEY (id_session_formation) REFERENCES session_formation(id_session_formation);
ALTER TABLE formateur_session_formation ADD CONSTRAINT FK_formateur_session_formation_id_formateur FOREIGN KEY (id_formateur) REFERENCES formateur(id_formateur);
ALTER TABLE formateur_session_formation ADD CONSTRAINT FK_formateur_session_formation_id_session_formation FOREIGN KEY (id_session_formation) REFERENCES session_formation(id_session_formation);
ALTER TABLE stagiaire_session_cursus ADD CONSTRAINT FK_stagiaire_session_cursus_id_stagiaire FOREIGN KEY (id_stagiaire) REFERENCES stagiaire(id_stagiaire);
ALTER TABLE stagiaire_session_cursus ADD CONSTRAINT FK_stagiaire_session_cursus_id_session_cursus FOREIGN KEY (id_session_cursus) REFERENCES session_cursus(id_session_cursus);
ALTER TABLE theme_formateur ADD CONSTRAINT FK_theme_formateur_id_formateur FOREIGN KEY (id_formateur) REFERENCES formateur(id_formateur);
ALTER TABLE theme_formateur ADD CONSTRAINT FK_theme_formateur_id_theme FOREIGN KEY (id_theme) REFERENCES theme(id_theme);
ALTER TABLE formation_pre_requis ADD CONSTRAINT FK_formation_pre_requis_id_formation FOREIGN KEY (id_formation) REFERENCES formation(id_formation);
ALTER TABLE formation_pre_requis ADD CONSTRAINT FK_formation_pre_requis_id_pre_requis FOREIGN KEY (id_pre_requis) REFERENCES pre_requis(id_pre_requis);
