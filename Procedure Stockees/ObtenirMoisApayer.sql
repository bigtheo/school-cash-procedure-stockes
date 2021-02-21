DELIMITER |
CREATE PROCEDURE ObtenirMoisApayer(IN p_eleve_id smallint,OUT p_frais_mensuel_id smallint,OUT p_frais_mensuel_designation varchar(15))
BEGIN
-- Déclaration et initialisation des variables...
DECLARE V_nombre_frais_paye smallint default 0;
SET p_frais_mensuel_id = 0;

-- affectation  du nombre de mois payé 
SELECT  count(p.id)  INTO V_nombre_frais_paye FROM paiement_mensuel as p where p.eleve_id=p_eleve_id;

-- si le nombre de frais payé > 0  alors le mois suivant...
IF V_nombre_frais_paye >= 0  THEN
 SET p_frais_mensuel_id = V_nombre_frais_paye + 1;
 SELECT designation INTO p_frais_mensuel_designation FROM frais_mensuel where id=p_frais_mensuel_id;
END IF;

END|
DELIMITER ;