
CREATE view  V_AfficherPaiementJournalierExamen AS
	SELECT pe.id,pe.date_paie as 'Date',concat_ws(' ',e.nom,e.postnom,e.prenom) as Noms FROM paiement_examen AS pe
    INNER JOIN eleve as e ON pe.eleve_id = e.id where date(pe.date_paie) = curdate();
    
