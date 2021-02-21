delimiter |
create procedure UpdateEleve(IN p_id smallint,IN p_nom varchar(45),IN p_postnom varchar(45),IN p_prenom varchar(45), IN p_genre char,IN p_date_naissance date,IN p_lieu_naissance varchar(45),IN p_adresse varchar(45),IN p_classe_id smallint,IN p_pere_id smallint,IN p_mere_id smallint)
BEGIN
 if p_id is not null THEN
 update eleve SET nom=p_nom,postnom=p_postnom,prenom=p_prenom,genre=p_genre,lieu_naissance=p_lieu_naissance,date_naissance=p_date_naissance,adresse=p_adresse,classe_id=p_classe_id,pere_id=p_pere_id,mere_id=p_mere_id where id=p_id;
 END IF
END;