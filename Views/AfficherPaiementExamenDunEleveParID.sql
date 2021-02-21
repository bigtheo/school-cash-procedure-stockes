DELIMITER |
CREATE PROCEDURE AfficherPaiementExamenParID(IN p_id smallint)
BEGIN

-- la requette qui affichere les infos des paiement de l'élève par son ID 

select pe.id,pe.date_paie as 'Date',fe.designation as 'Désignation' from paiement_examen as pe 
INNER JOIN frais_examen as fe
ON pe.frais_examen_id = fe.id WHERE pe.eleve_id = p_id;
    
END |
DELIMITER ;