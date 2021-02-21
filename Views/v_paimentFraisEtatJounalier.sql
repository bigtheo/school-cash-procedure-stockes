CREATE view  v_paimentFraisEtatJounalier as 
select pe.id,pe.date_paie as 'Date et heure',concat_ws(' ',e.nom,e.postnom,e.prenom) as Noms,fe.designation as 'Désignation',c.nom ,cfe.montant from paiement_etat as pe
INNER JOIN eleve as e On pe.eleve_id=e.id
INNER JOIN classe as c ON e.classe_id=c.id
INNER JOIN frais_etat as fe ON pe.frais_etat_id=fe.id
INNER JOIN classe_frais_etat AS cfe ON cfe.frais_etat_id=fe.id AND cfe.classe_id=e.classe_id
WHERE date(pe.date_paie)=curdate()
ORDER BY c.nom,pe.date_paie,noms;