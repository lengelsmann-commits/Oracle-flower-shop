-- drop tables
drop table HistoriqueAchat ;
drop table Grossiste ;
drop table FleurContenue ;
drop table Bouquet ;
drop table Fleur ;
drop table Commande ;
drop table Livraison ;
drop table Clients ;

-- creation tables
create table Clients(
    Email Varchar2(320),
    NumTel Varchar2(25),
    Nom Varchar2(50),
    Adresse Varchar2(150),
    CodePostal Varchar2(12),
    Ville Varchar2(30),
    
    Constraint pk_Email primary key (Email)
);

create table Livraison(
    CodePostal Varchar2(12),
    TarifLivraison Number,
    
    Constraint pk_CodePostal primary key (CodePostal)
);

create table Commande (
    NumCommande Number,
    DateCommande Date,
    DateRealisation Date,
    DatePaiement Date,
    DateLivraisonEffective Date,
    NomDestinataire Varchar2(50),
    NumTelDestinataire Varchar2(25),
    AdresseLivraison Varchar2(150),
    Email Varchar2(320),
    CodePostal Varchar2(12),
    Ville Varchar(50),
    
    Constraint pk_NumCommande primary key (NumCommande),
    Constraint fk_Commande_Email foreign key (Email) references Clients(Email),
    Constraint fk_Commande_CodePostal foreign key (CodePostal) references Livraison(CodePostal)
);

create table Bouquet(
    NumBouquet Number,
    NbrBouquets Number,
    NumCommande Number,
    
    Constraint pk_NumBouquet primary key (NumBouquet),
    Constraint fk_Bouquet_NumCommande foreign key (NumCommande) references Commande(NumCommande)
);

create table Fleur(
    NomFleur Varchar2(50),
    TarifFleur Number,
    
    Constraint pk_NomFleur primary key (NomFleur)
);

create table FleurContenue(
    NumBouquet Number,
    NomFleur Varchar2(50),
    NbrFleurs Number,
    
    Constraint pk_FleurContenue primary key (NumBouquet, NomFleur),
    Constraint fk_FleurContenue_NumBouquet foreign key (NumBouquet) references Bouquet(NumBouquet),
    Constraint fk_FleurContenue_NomFleur foreign key (NomFleur) references Fleur(NomFleur)
);

create table Grossiste(
    NumSiren Number,
    NomGrossiste Varchar2(50),
    
    Constraint pk_NumSiren primary key (NumSiren)
);

create table HistoriqueAchat(
    NomFleur Varchar2(50),
    DateAchat Date,
    NbrFleurs Number,
    PrixAchatUnitaire Number,
    NumSiren Number,
    
    Constraint pk_HistoriqueAchat primary key (NomFleur, DateAchat),
    Constraint fk_HistoriqueAchat_NomFleur foreign key (NomFleur) references Fleur(NomFleur),
    Constraint fk_HistoriqueAchat_NumSiren foreign key (NumSiren) references Grossiste(NumSiren)
);