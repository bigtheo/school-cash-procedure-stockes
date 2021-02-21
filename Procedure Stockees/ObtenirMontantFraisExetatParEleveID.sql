DELIMITER |
CREATE PROCEDURE ObtenirMontantFraisExetatParEleveID(IN p_eleve_id smallint,In p_frais_id smallint,OUT p_montant DECIMAL)
BEGIN
select coalesce( cfe.montant) INTO p_montant  from classe_frais_exetat as cfe 
INNER JOIN classe as c ON cfe.classe_id=c.id
INNER JOIN eleve as e ON e.classe_id=c.id
INNER JOIN frais_exetat as fe ON fe.id=cfe.frais_exetat_id
WHERE e.id= p_eleve_id AND fe.id=p_frais_id;

IF p_montant IS null THEN
	set p_montant = 0;
end if;
END |
DELIMITER ;