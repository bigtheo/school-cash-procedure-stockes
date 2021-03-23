drop table if exists paiement_exetat_archive;
CREATE TABLE `paiement_exetat_archive` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `date_paie` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_Annulation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `eleve_id` smallint unsigned NOT NULL,
  `frais_exetat_id` tinyint unsigned NOT NULL,
  `user_id` smallint unsigned NOT NULL
);
-- trigger sur la suppression : paiement_exetat
drop trigger if exists AfterDeleteOnPaiement_exetat;
delimiter |
create trigger AfterDeleteOnPaiement_exetat after delete on paiement_exetat for each row
begin
INSERT INTO paiement_exetat_archive(id,date_paie,date_annulation,eleve_id,frais_exetat_id,user_id) 
values
(old.id,old.date_paie,now(),old.eleve_id,old.frais_exetat_id,old.user_id);
end |
delimiter ;

-- restauration 
drop trigger if exists AfterDeleteOnPaiement_exetat_archive;
delimiter |
create trigger AfterDeleteOnPaiement_exetat_archive after delete on paiement_exetat_archive for each row
begin
INSERT INTO paiement_exetat(id,date_paie,eleve_id,frais_exetat_id,user_id) 
values
(old.id,old.date_paie,old.eleve_id,old.frais_exetat_id,old.user_id);
end |
delimiter ;