DELIMITER |
CREATE PROCEDURE PS_DernierNumeroRecuEtat(OUT p_numero_recu INT)
BEGIN
-- On affecte dans la variable numéro reçu le dernier numéro 
	SELECT MAX(Id) INTO p_numero_recu from paiement_etat ;
    
    IF p_numero_recu IS NULL THEN 
    SET p_numero_recu= 0;
    END IF ;
    
END |
DELIMITER ;