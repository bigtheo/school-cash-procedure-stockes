DELIMITER | 
CREATE PROCEDURE InsererClasseFraisExamen (IN p_id smallint,IN p_frais_examen_id smallint,IN p_classe_id smallint ,IN p_montant double)  
BEGIN

    IF p_montant is not null then
     Insert into classe_frais_examen(id,frais_examen_id,classe_id,montant) values (p_id,p_frais_examen_id,p_classe_id,p_montant);
    end if;
END |
DELIMITER ; 