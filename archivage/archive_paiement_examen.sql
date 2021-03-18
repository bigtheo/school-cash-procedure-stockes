drop table if exists paiement_examen_archive;
CREATE TABLE `paiement_examen_archive` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `date_paie` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_Annulation` datetime DEFAULT CURRENT_TIMESTAMP,
  `eleve_id` smallint unsigned NOT NULL,
  `frais_examen_id` tinyint unsigned NOT NULL,
  `user_id` smallint unsigned NOT NULL
);

-- les trigger sur la suppression des élements : paiement_examen
drop trigger if exists AfterDeleteOnPaiementExamen;
delimiter |
CREATE TRIGGER AfterDeleteOnPaiementExamen after delete on paiement_examen for each row
begin
INSERT INTO paiement_examen_archive(id,date_paie,date_Annulation,eleve_id,frais_examen_id,user_id) values
(old.id,old.date_paie,now(),old.eleve_id,old.frais_examen_id,old.user_id);
end|

-- les trigger sur la suppression des élements : paiement_examen
drop trigger if exists AfterDeleteOnPaiementExamen;
delimiter |
CREATE TRIGGER AfterDeleteOnPaiementExamenArchive after delete on paiement_examen_archive for each row
begin
INSERT INTO paiement_examen(id,date_paie,eleve_id,frais_examen_id,user_id) values
(old.id,old.date_paie,old.eleve_id,old.frais_examen_id,old.user_id);
end|