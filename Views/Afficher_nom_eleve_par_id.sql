DELIMITER |
CREATE PROCEDURE Afficher_noms_eleve_par_id(IN p_id smallint,OUT p_noms_eleve varchar(150),OUT p_classe char(15))
BEGIN
-- initialisation des variables à null
SET p_noms_eleve = null;
SET p_classe = null;

-- selection du nom, post nom et du prénom de l'élève...
select coalesce(concat_ws(' ',nom,postnom,prenom))as nom INTO p_noms_eleve  from eleve where id=p_id;

-- selection de la classe de l'élève par son id...
select coalesce(c.nom)  INTO p_classe  from classe as c INNER JOIN eleve as e ON e.classe_id=c.id where e.id=p_id;
-- si l'Id de l'élève n'est pas attribué 
IF p_noms_eleve IS NULL OR p_classe IS NULL THEN 
	SET p_noms_eleve = "Id non attribué à un(e) élève ";
    SET p_classe="Inconnue";
END IF;
END |
DELIMITER ;

