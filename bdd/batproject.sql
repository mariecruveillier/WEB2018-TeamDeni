#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE user(
        idSession       Varchar (255) NOT NULL ,
        poids           Int ,
        kilometrage     Int ,
        vitesse         Int ,
        essence         Int ,
        batterie        Int ,
        tpm             Int ,
        niveauHuile     Int ,
        niveauLiquide   Int ,
        etatCarrosserie Int ,
        pos_x           Int ,
        pos_y           Int ,
        bpm             Int ,
        id              Int ,
        id_pneu         Int ,
        id_radio        Int ,
        PRIMARY KEY (idSession )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: arme
#------------------------------------------------------------

CREATE TABLE arme(
        id          Int NOT NULL ,
        nom         Varchar (255) ,
        munitionMax Int ,
        cadence     Int ,
        PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: mode
#------------------------------------------------------------

CREATE TABLE mode(
        id           Int NOT NULL ,
        nom          Varchar (255) ,
        vitesseMax   Int ,
        vitesseMin   Int ,
        bouclier     Bool ,
        etatBouclier Int ,
        PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: radio
#------------------------------------------------------------

CREATE TABLE radio(
        id         Int NOT NULL ,
        frequence  Float ,
        nom        Varchar (255) ,
        fichierSon Varchar (255) ,
        PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: meteo
#------------------------------------------------------------

CREATE TABLE meteo(
        t           Int NOT NULL ,
        temperature Int ,
        humidite    Int ,
        etat        Int ,
        vent        Int ,
        PRIMARY KEY (t )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: news
#------------------------------------------------------------

CREATE TABLE news(
        id      Int NOT NULL ,
        auteur  Varchar (255) ,
        message Text ,
        urgence Int ,
        PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: mechant
#------------------------------------------------------------

CREATE TABLE mechant(
        id          Int NOT NULL ,
        nom         Varchar (255) ,
        prenom      Varchar (255) ,
        pseudo      Varchar (255) ,
        age         Int ,
        sexe        Bool ,
        taille      Int ,
        nbCrime     Int ,
        dangerosite Int ,
        pos_x       Int ,
        pos_y       Int ,
        PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: pdi
#------------------------------------------------------------

CREATE TABLE pdi(
        id    Int NOT NULL ,
        nom   Varchar (255) ,
        type  Varchar (255) ,
        pos_x Int ,
        pos_y Int ,
        PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: pneu
#------------------------------------------------------------

CREATE TABLE pneu(
        id       Int NOT NULL ,
        pression Int ,
        rayon    Int ,
        largeur  Int ,
        PRIMARY KEY (id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: posseder
#------------------------------------------------------------

CREATE TABLE posseder(
        id        Int ,
        munition  Int ,
        idSession Varchar (255) NOT NULL ,
        id_arme   Int NOT NULL ,
        PRIMARY KEY (idSession ,id_arme )
)ENGINE=InnoDB;

ALTER TABLE user ADD CONSTRAINT FK_user_id FOREIGN KEY (id) REFERENCES mode(id);
ALTER TABLE user ADD CONSTRAINT FK_user_id_pneu FOREIGN KEY (id_pneu) REFERENCES pneu(id);
ALTER TABLE user ADD CONSTRAINT FK_user_id_radio FOREIGN KEY (id_radio) REFERENCES radio(id);
ALTER TABLE posseder ADD CONSTRAINT FK_posseder_idSession FOREIGN KEY (idSession) REFERENCES user(idSession);
ALTER TABLE posseder ADD CONSTRAINT FK_posseder_id_arme FOREIGN KEY (id_arme) REFERENCES arme(id);
