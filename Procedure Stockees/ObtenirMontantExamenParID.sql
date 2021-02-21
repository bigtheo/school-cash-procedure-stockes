
DELIMITER |
-- cette procedure permet d'obtenir le montant du frais d'examen à payer  et le frais d'examen
-- par rapport à la classe et au semestre(frais_examen
CREATE PROCEDURE ObtenirMontantFraisExamen(IN p_classe char(15),IN p_frais_examen char(25),OUT p_montant double)
BEGIN
SET p_montant = 0;
--  la requette qui obtient le montant...

IF P_frais_examen IS NOT NULL  AND P_frais_examen !='Frais inconnu' THEN
	select cf.Montant INTO p_montant from classe_frais_examen as cf 
		  INNER JOIN frais_examen as fe 
        ON fe.id=cf.frais_examen_id 
		  INNER JOIN classe as c 
		ON c.id=cf.classe_id
	WHERE c.nom=p_classe AND fe.designation like p_frais_examen;
    ELSE
    SET p_montant = 0;
    
END IF;
END |
DELIMITER ;