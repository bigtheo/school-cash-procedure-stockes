use school_cash_managerdb;
CREATE TABLE if not exists `paiement_mensuel_archive` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `date_paie` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_paie_suppression` datetime DEFAULT CURRENT_TIMESTAMP,
  `eleve_id` smallint unsigned NOT NULL,
  `frais_mensuel_id` smallint unsigned NOT NULL,
  `user_id` smallint unsigned NOT NULL,
  `paye` tinyint(1) NOT NULL DEFAULT '1'
);
-- création des triggers d'insertion à la suppression dans la table paiement_mensuel
drop trigger if exists afterDeleteONPaiementMensuelTrigger;
delimiter |
create trigger afterDeleteONPaiementMensuelTrigger after delete on paiement_mensuel for each row 
begin
insert into paiement_mensuel_archive
 values(old.id,old.date_paie,now(),old.eleve_id,old.frais_mensuel_id,old.user_id,old.paye) ;
end |
delimiter ;


-- création des triggers d'insertion à la suppression dans la table paiement_mensuel archive
drop trigger if exists afterDeleteONPaiementMensuelArchiveTrigger;
delimiter |
create trigger afterDeleteONPaiementMensuelArchiveTrigger after delete on paiement_mensuel_archive for each row 
begin
insert into paiement_mensuel
 values(old.id,old.date_paie,old.eleve_id,old.frais_mensuel_id,old.user_id,old.paye) ;
end |
delimiter ;