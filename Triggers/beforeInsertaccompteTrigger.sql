DELIMITER |
CREATE TRIGGER afterInsertaccompteTrigger after insert on accompte for each row
begin
declare v_total decimal default 0;
declare v_prix_mensuel decimal default 0;

-- on selectionne le total payé comme accompte pour un frais...
select sum(montant) into v_total from accompte where frais_mensuel_id=new.frais_mensuel_id AND eleve_id=new.eleve_id;
-- on selectionne le prix mensuel du mois en cours
select montant into v_prix_mensuel from frais_mensuel where id=new.frais_mensuel_id;

-- on compare le montant payé au prix mensuel
IF (v_total is not null and v_prix_mensuel is not null) and (v_total >= v_prix_mensuel) THEN
-- on insere dans la table paiement mensuel
call InsertDansPaiementMensuels(null,new.eleve_id,new.frais_mensuel_id,1,true);
END IF;

end|
delimiter ;