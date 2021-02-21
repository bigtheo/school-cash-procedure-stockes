-- initialisation de la base

/*
l'initialisation des paiments
*/
truncate paiement_mensuel;
truncate paiement_manuels;
truncate paiement_exetat;
truncate paiement_examen;
truncate paiement_etat;
/*
initialisation des classe-fais 
*/

truncate classe_frais_etat;
truncate classe_frais_examen;
truncate classe_frais_exetat;

/*
Initialisation des frais
*/
delete from frais_mensuel where id > 0;
alter table frais_mensuel auto_increment=0;
delete from manuels where id>0;
alter table manuels auto_increment=0;

/*
Initialisation de l'élève
*/

truncate images_eleves;
delete from  eleve where id > 0 ;
alter table eleve  auto_increment = 0;
delete from  pere where id > 0 ;
alter table pere  auto_increment = 0;
delete from  mere where id > 0 ;
alter table mere  auto_increment = 0;

delete from  classe where id > 0 ;
alter table classe  auto_increment = 0;


