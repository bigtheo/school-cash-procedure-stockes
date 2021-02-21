DELIMITER |
CREATE PROCEDURE ObtenirFraisEtat(IN p_eleve_id smallint,OUT p_frais_id smallint,OUT p_frais_etat CHAR(25))
BEGIN
-- Déclaration des variables
  DECLARE v_nombre_paiement varchar(25) default null;
  DECLARE v_eleve_existe smallint default 0;
  SET p_frais_etat = 0;
  
  -- compater les paiement éffectué par l'élève
  select count(pe.id) INTO v_nombre_paiement from paiement_etat as pe 
		INNER JOIN frais_etat as fe 
		ON fe.id=pe.frais_etat_id
	WHERE pe.eleve_id=p_eleve_id;
    
      -- requete qui vérifie si l'elève existe 
	SELECT count(id) into v_eleve_existe from eleve where id=p_eleve_id;
    -- si v_nombre_paiement est different de null
IF v_nombre_paiement is not null AND v_nombre_paiement >= 0 AND v_eleve_existe > 0 THEN

     SELECT designation INTO p_frais_etat from frais_etat where id = v_nombre_paiement + 1 ;
	 SELECT coalesce(id) INTO p_frais_id from frais_etat where designation = p_frais_etat;
     
     -- si le frais de l'état vaut null 
     IF p_frais_etat IS NULL OR p_frais_id is  null  THEN
       SET  p_frais_etat = 'Frais inconnu ';
       SET p_frais_id = 0 ;
     END IF;
 ELSE 
   SET  p_frais_etat = 'Frais inconnu ';
       SET p_frais_id = 0 ; 
END IF;

    
  
END |
