create view v_paiementManuelsJournalier AS
select 
pm.id,pm.date_paie as 'Date et heure',concat_ws(' ',e.nom,e.postnom,e.prenom) as Noms,
c.nom as Classe,m.intitule as 'Intitulé',pm.quantite as 'Quantité',m.prix_unitaire as 'Prix Unitaire'
 from paiement_manuels as pm
INNER JOIN eleve AS e ON pm.eleve_id=e.id
INNER JOIN CLASSE AS c ON e.classe_id=c.id
INNER JOIN manuels AS m ON pm.manuel_id=m.id
WHERE date(pm.date_paie)=curdate()
ORDER BY pm.date_paie,classe,Noms
;