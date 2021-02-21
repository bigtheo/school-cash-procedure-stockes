delimiter |
CREATE PROCEDURE AfficherPaiementExetatParID(IN p_id INT)
BEGIN

select pe.id,pe.date_paie  as 'Date et Heure',fe.designation as 'Désignation' from paiement_exetat as pe
INNER JOIN frais_exetat as fe ON pe.frais_exetat_id=fe.id 
where pe.eleve_id = p_id;

END |
DELIMITER ;
