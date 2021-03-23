drop table if exists accompte_archive;
CREATE TABLE `accompte_archive` (
  `Id` int unsigned NOT NULL DEFAULT '0',
  `date_paie` datetime DEFAULT CURRENT_TIMESTAMP,
  date_annulation dateTime default current_timestamp,
  `montant` decimal(9,2) NOT NULL,
  `frais_mensuel_id` smallint unsigned NOT NULL,
  `eleve_id` smallint unsigned NOT NULL
) ;
-- création des triggers  sur accompte et accompte_archive

drop trigger if exists AfterDeleteONAccompteTrigger ;
DELIMITER |
create trigger AfterDeleteONAccompteTrigger after delete on accompte for each row
BEGIN
INSERT INTO accompte_archive(id,date_paie,montant,frais_mensuel_id,eleve_id) 
values(old.id,old.date_paie,old.montant,old.frais_mensuel_id,old.eleve_id);
END |
DELIMITER ;

drop trigger if exists AfterDeleteONAccompteArchiveTrigger ;
DELIMITER |
create trigger AfterDeleteONAccompteArchiveTrigger after delete on accompte_Archive for each row
BEGIN
INSERT INTO accompte(id,date_paie,montant,frais_mensuel_id,eleve_id) 
values(old.id,old.date_paie,old.montant,old.frais_mensuel_id,old.eleve_id);
END |
DELIMITER ;