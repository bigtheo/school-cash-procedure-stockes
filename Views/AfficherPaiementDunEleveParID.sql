DELIMITER |
CREATE PROCEDURE AfficherPaiementDunEleveParID(IN p_id smallint)
BEGIN
select pm.id,pm.date_paie as "date",fm.designation,fm.montant 
   from paiement_mensuel as pm 
   INNER JOIN eleve as e ON e.id=pm.eleve_id
   INNER JOIN frais_mensuel as fm ON fm.id=pm.frais_mensuel_id
   WHERE e.id = p_id;
END |
DELIMITER ;