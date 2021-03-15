select  concat_ws(' ',e.nom,e.postnom,e.prenom),pm.date_paie as Noms,
e.genre ,c.nom as classe from eleve as e
INNER JOIN Classe as c on c.id=e.classe_id
INNER JOIN paiement_mensuel as pm on pm.eleve_id= e.id
INNER JOIN frais_mensuel as fm on fm.id=frais_mensuel_id
where fm.designation='Inscription' 
AND  day(pm.date_paie) >= 20 -- au du 20...30
AND month(pm.date_paie) = 9 -- le 9 est numéro du mois
