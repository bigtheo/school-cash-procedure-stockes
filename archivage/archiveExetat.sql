drop table if exists paiement_etat_archive;
CREATE TABLE if not exists `paiement_etat_archive` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `date_paie` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_annulation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `eleve_id` smallint unsigned NOT NULL,
  `frais_etat_id` tinyint unsigned NOT NULL,
  `user_id` smallint unsigned NOT NULL
) ;
-- création des triggers sur la suppression : paiement_etat
delimiter |
DROP trigger if exists AfterDeleteOnPaiementEtatTrigger;
create trigger AfterDeleteOnPaiementEtatTrigger after delete on paiement_etat for each row
begin
INSERT INTO paiement_etat_archive(id,date_paie,date_annulation,eleve_id,frais_etat_id,user_id) values
(old.id,old.date_paie,now(),old.eleve_id,old.frais_etat_id,old.user_id);
end|
delimiter ;
-- création des triggers sur la suppression : paiement_etat_archive
DROP trigger if exists AfterDeleteOnPaiementEtatAchiveTrigger;
delimiter |
create trigger AfterDeleteOnPaiementEtatAchiveTrigger after delete on paiement_etat_archive for each row
begin
INSERT INTO paiement_etat(id,date_paie,eleve_id,frais_etat_id,user_id) values
(old.id,old.date_paie,old.eleve_id,old.frais_etat_id,old.user_id);
end|
delimiter ;