delimiter |
create trigger before_insert_paiement_emprunt_cdf before insert
	on paiement_emprunt_cdf for each row
	BEGIN
		IF new.montant_paie > 0
        AND new.montant_paie is not null
		THEN
			update paiement_emprunt_cdf set montant_paie =montant_paie + new.montant_paie;
		END IF;
	END |