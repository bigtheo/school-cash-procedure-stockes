
DELIMITER |
-- cette procédure obtient la designation et l'id du frais d'examen à payer

CREATE PROCEDURE ObtenirDesignationFraisExamen( IN p_eleve_id smallint,OUT p_frais_id smallint,OUT p_frais_mensuel CHAR(25))
BEGIN

-- Déclaration des variables
  DECLARE v_nombre_paiement varchar(25) default null;
  DECLARE v_eleve_existe smallint default 0;
  SET p_frais_mensuel = 0;

-- la requete qui affecete le frais d'examen à payer de dans la variable v_frais_examen 

	select count(pe.id) INTO v_nombre_paiement from paiement_examen as pe 
		INNER JOIN frais_examen as fe 
		ON fe.id=pe.frais_examen_id
	WHERE pe.eleve_id=p_eleve_id;
    
     -- requete qui vérifie si l'elève existe 
	SELECT count(id) into v_eleve_existe from eleve where id=p_eleve_id;

-- si v_nombre_paiement est different de null
IF v_nombre_paiement is not null AND v_nombre_paiement >= 0 AND v_eleve_existe > 0 THEN

     SELECT designation INTO p_frais_mensuel from frais_examen where id = v_nombre_paiement + 1 ;
	 SELECT coalesce(id) INTO p_frais_id from frais_examen where designation = p_frais_mensuel;

     
-- si le frais mensuel vaut null 
     IF p_frais_mensuel IS NULL OR p_frais_id is  null  THEN
       SET  p_frais_mensuel = 'Frais inconnu ';
       SET p_frais_id = 0 ;
     END IF;
 ELSE 
   SET  p_frais_mensuel = 'Frais inconnu ';
       SET p_frais_id = 0 ; 
END IF;

END |
DELIMITER ;