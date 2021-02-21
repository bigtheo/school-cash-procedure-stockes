CREATE view v_afficherPaiementMensuelJournalier as
select 
pm.id,pm.date_paie as 'Date',concat_ws(' ',e.nom,e.postnom,e.prenom) as Noms,c.nom AS Classe,f.designation as 'Désignation',f.Montant from paiement_mensuel as pm
INNER JOIN  eleve as e ON pm.eleve_id=e.id
INNER JOIN frais_mensuel as f ON pm.frais_mensuel_id=f.id
INNER JOIN classe as c ON e.classe_id=c.id
WHERE date(pm.date_paie) = current_date() order by pm.date_paie,c.nom,noms;

