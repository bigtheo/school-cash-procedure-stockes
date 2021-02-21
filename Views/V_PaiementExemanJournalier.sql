CREATE VIEW V_PaiementExemanJournalier AS 
SELECT pe.id,pe.date_paie as 'Date et heure',concat_ws(' ',e.nom,e.postnom,e.prenom) as Noms,fe.designation as 'Désignation',c.nom as Classe,cfe.montant
FROM PAIEMENT_EXAMEN as pe 
INNER JOIN eleve as e ON pe.eleve_id=e.id
INNER JOIN frais_examen as fe ON pe.frais_examen_id=fe.id 
INNER JOIN classe AS c On e.classe_id=c.id
INNER JOIN classe_frais_examen as cfe ON cfe.frais_examen_id=fe.id and cfe.classe_id=c.id
WHERE date( pe.date_paie)=curdate()
order by pe.date_paie,e.classe_id,noms;