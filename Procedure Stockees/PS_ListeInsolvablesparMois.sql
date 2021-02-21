DELIMITER |
CREATE PROCEDURE PS_ListeInsolvablesparMois(IN p_mois char(20),IN p_classe varchar(20))
BEGIN
IF p_mois <> '' and p_mois is not null and p_classe<> '' and p_classe is not null THEN

	SELECT distinct e.id, concat_ws(' ', e.nom,e.postnom,e.prenom) as Noms,e.genre as Genre,c.nom as classe 
    from eleve as e 
	INNER JOIN classe as c ON e.classe_id=c.id
	INNER JOIN paiement_mensuel as pm ON pm.eleve_id=e.id
	INNER JOIN frais_mensuel as fm ON pm.frais_mensuel_id=fm.id
	WHERE e.id not in
	(
	select e.id from eleve AS e 
	INNER JOIN paiement_mensuel as pm ON pm.eleve_id=e.id 
	INNER JOIN frais_mensuel as fm ON pm.frais_mensuel_id=fm.id
	INNER JOIN classe as c on e.classe_id=c.id
	WHERE fm.designation=p_mois 
	)  and c.nom=p_classe
	order by classe,noms;
    ELSE
	SELECT distinct e.id, concat_ws(' ', e.nom,e.postnom,e.prenom) as Noms,e.genre as Genre,c.nom as classe 
    from eleve as e 
	INNER JOIN classe as c ON e.classe_id=c.id
	INNER JOIN paiement_mensuel as pm ON pm.eleve_id=e.id
	INNER JOIN frais_mensuel as fm ON pm.frais_mensuel_id=fm.id
	WHERE e.id not in
	(
	select e.id from eleve AS e 
	INNER JOIN paiement_mensuel as pm ON pm.eleve_id=e.id 
	INNER JOIN frais_mensuel as fm ON pm.frais_mensuel_id=fm.id
	INNER JOIN classe as c on e.classe_id=c.id
	WHERE fm.designation=p_mois 
	)  
	order by classe,noms;
END IF;

END |
DELIMITER ;

