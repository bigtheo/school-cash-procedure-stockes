Delimiter |
CREATE PROCEDURE  ps_ListeSolvablesparMois(IN p_mois char(20),IN p_classe varchar(20))
BEGIN
IF(p_classe <> '' and p_classe is not null) THEN
	select e.id, concat_ws(' ', e.nom,e.postnom,e.prenom) as Noms,e.genre as Genre,c.nom as classe from eleve as e 
	INNER JOIN classe as c ON e.classe_id=c.id
	INNER JOIN paiement_mensuel as pm ON pm.eleve_id=e.id
	INNER JOIN frais_mensuel as fm ON pm.frais_mensuel_id=fm.id
	WHERE fm.designation =p_mois and  c.nom=p_classe
	order by classe,noms;
ELSE
	select e.id, concat_ws(' ', e.nom,e.postnom,e.prenom) as Noms,e.genre as Genre,c.nom as classe from eleve as e 
	INNER JOIN classe as c ON e.classe_id=c.id
	INNER JOIN paiement_mensuel as pm ON pm.eleve_id=e.id
	INNER JOIN frais_mensuel as fm ON pm.frais_mensuel_id=fm.id
	WHERE fm.designation =p_mois
	order by classe,noms;
end if;
END |
DELIMITER ;