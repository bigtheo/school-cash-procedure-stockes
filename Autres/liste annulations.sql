SELECT  
	p.id as 'N°', p.date_paie as 'Date et Heure',
    p.date_paie_suppression as 'Date d''annulation',e.id ,
    concat_ws(' ',e.nom,e.postnom,e.prenom) as Noms,c.nom as Classe,f.designation,f.Montant as Montant
	FROM paiement_mensuel_archive as p 
	INNER JOIN eleve as e on p.eleve_id=e.id
	INNER JOIN  classe as c ON e.classe_id=c.id
	INNER JOIN frais_mensuel as f ON p.frais_mensuel_id=f.id
    where date(p.date_paie_suppression)='2021-03-16'