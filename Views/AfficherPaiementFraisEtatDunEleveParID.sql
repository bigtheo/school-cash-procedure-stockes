DELIMITER |
CREATE PROCEDURE AfficherPaiementFraisEtatDunEleveParID(IN p_id smallint)
BEGIN
select pm.id,pm.date_paie as "date",fm.designation 
   from paiement_etat as pm 
   INNER JOIN eleve as e ON e.id=pm.eleve_id
   INNER JOIN frais_etat as fm ON fm.id=pm.frais_etat_id
   WHERE e.id = p_id;
END |
DELIMITER ;