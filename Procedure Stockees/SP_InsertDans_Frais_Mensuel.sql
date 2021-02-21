delimiter |
CREATE PROCEDURE 
InsertDansPaiementMensuels(IN p_id smallint,IN p_eleve_id smallint,IN p_frais_mensuel_id smallint,IN p_user_id smallint,IN p_paye bool)
BEGIN
IF p_eleve_id is not null AND p_frais_mensuel_id is not null AND p_user_id is not null THEN
INSERT INTO paiement_mensuel(id,date_paie,eleve_id,frais_mensuel_id,user_id,paye) values(p_id,current_timestamp(),p_eleve_id,p_frais_mensuel_id,p_user_id,p_paye);
END IF;
END |
delimiter ;
