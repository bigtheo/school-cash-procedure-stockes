DELIMITER |
CREATE PROCEDURE ps_ObtenirMontantMensuel(IN p_classe char(20),IN p_designation_frais CHAR(20),OUT p_montant decimal,OUT p_frais_mensuel_id smallint)
BEGIN
IF p_designation_frais IS NOT NULL AND p_classe  IS NOT NULL THEN
SELECT
coalesce(f.Montant) INTO p_montant from frais_mensuel as f
INNER JOIN classe as c ON f.classe_id=c.id
WHERE c.nom=p_classe AND f.designation=p_designation_frais;

SELECT
coalesce(f.id) INTO p_frais_mensuel_id from frais_mensuel as f
INNER JOIN classe as c ON f.classe_id=c.id
WHERE c.nom=p_classe AND f.designation=p_designation_frais;
END IF;
-- si le montant est null
IF p_montant IS NULL OR p_frais_mensuel_id IS NULL THEN
	SET p_montant = 0 ;
    SET p_frais_mensuel_id=0;
END IF;


END |
DELIMITER ;