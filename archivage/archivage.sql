use school_cash_managerdb;
CREATE  table if not exists `accompte_archive` (
  `Id` int unsigned NOT NULL DEFAULT '0' primary key,
  `date_paie` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_suppression` datetime DEFAULT CURRENT_TIMESTAMP,
  `montant` decimal(9,2) NOT NULL,
  `frais_mensuel_id` smallint unsigned NOT NULL,
  `eleve_id` smallint unsigned NOT NULL
);

-- le trigger sur la suppression archive 
DELIMITER |
drop trigger if exists afterDeleteAcompteTrigger;
create trigger afterDeleteAcompteTrigger after delete on accompte_archive for each row
BEGIN
INSERT INTO 
Accompte(id,date_paie,montant,frais_mensuel_id,eleve_id) VALUES
(old.id,old.date_paie,old.montant,old.frais_mensuel_id,old.eleve_id);
END |
delimiter ;

DELIMITER |
-- le trigger sur la table accompte-suppression
drop trigger if exists afterDeleteAcompteArhiveTrigger;
create trigger  afterDeleteAcompteArhiveTrigger after delete on accompte for each row
BEGIN
INSERT INTO 
Accompte_archive(id,date_paie,date_suppression,montant,frais_mensuel_id,eleve_id) VALUES
(old.id,old.date_paie,now(),old.montant,old.frais_mensuel_id,old.eleve_id);
END |

delimiter ;
 
