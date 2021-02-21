DELIMITER |
CREATE PROCEDURE AfficherMontantFraisMensuel(IN p_classe char(15),IN p_frais_mensuel smallint,OUT p_montant_frais_mensuel double)
BEGIN
SET AfficherMontantFraisMensuel = 0;
-- selection du montant par classe
select cf.montant INTO p_montant_frais_mensuel from  classe_frais_mensuel as cf INNER JOIN frais_mensuel as fm 
	ON cf.frais_mensuel_id=fm.id 
INNER JOIN classe as c 
	ON cf.classe_id=c.id where c.nom = p_classe AND fm.designation=p_frais_mensuel;

-- si le montant est null
	IF p_montant_frais_mensuel is null OR p_montant_frais_mensuel = 'Frais inconnu' THEN
		SET p_montant_frais_mensuel = 0 ;
    END IF;

END |

DELIMITER ;