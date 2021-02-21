use la_confidence_db;
delimiter |
create trigger before_insert_retraits before insert
	on retraits for each row
BEGIN
declare v_client_id smallint ;
set v_client_id= (select cl.id from  clients as cl inner join comptes as cpt on cpt.client_id=cl.id where cpt.id=new.comptes_id);
	if new.montant_retraits is not null 
		AND new.montant_retraits > 0
    THEN
        update comptes as cpt SET solde= solde - new.montant_retraits where cpt.client_id=v_client_id ;
	end if ;
END |
