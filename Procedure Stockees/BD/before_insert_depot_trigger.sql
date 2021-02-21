use la_confidence_db;
delimiter |
create trigger before_insert_depots before insert
	on depots for each row
BEGIN
declare v_client_id smallint ;
set v_client_id= (select cl.id from  clients as cl inner join comptes as cpt on cpt.client_id=cl.id where cpt.id=new.comptes_id);

	if new.montant_depot is not null 
		AND new.montant_depot > 0 
    THEN
        update comptes as cpt SET SOLDE= SOLDE + new.montant_depot where cpt.client_id=v_client_id;
	end if ;
END |
