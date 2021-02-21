CREATE VIEW v_paimentExetatJournalier as 
select pe.id,pe.date_paie as 'Date et Heure' ,concat_ws(' ',e.nom,e.postnom,e.prenom) as Noms,c.nom as classe,fe.designation,cf.montant from paiement_exetat as pe
INNER JOIN eleve as e ON pe.eleve_id=e.id
INNER JOIN classe as c on e.classe_id=c.id
INNER JOIN frais_exetat as fe ON pe.frais_exetat_id=fe.id
INNER JOIN classe_frais_exetat cf on cf.frais_exetat_id=fe.id AND cf.classe_id=c.id
where date(pe.date_paie)=current_date()
ORDER BY classe,pe.date_paie,noms

