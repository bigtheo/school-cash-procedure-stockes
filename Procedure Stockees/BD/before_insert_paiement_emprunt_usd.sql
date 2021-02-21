use la_confidence_db;
delimiter |
create trigger before_insert_paiement_emprunt_usd after insert
	on paiement_emprunt_usd for each row
BEGIN
	-- obtenir le montant total payé et le montant emprunté par numéro du  client
	declare montant_total_paye double;
	declare montant_emprunte double;
    
	 set montant_total_paye= (select sum(montant_paie) from paiement_emprunt_usd where emprunts_id=new.emprunts_id);
	 set montant_emprunte=(select montant_emprunt from emprunts_usd where id=new.emprunts_id);
	 
	 -- Si montant payé est égal au montant emprunté alors on met à jour la table emprunts_cdf la colonne paye
	 
		if montant_total_paye is not null 
			AND montant_emprunte is not null
			AND montant_total_paye >= montant_emprunte
		THEN
		-- on met à jour la colonne payé par rapport à l'id
		
			update emprunts_usd SET paye= "OUI" where id=new.emprunts_id;
		end if ;
END |