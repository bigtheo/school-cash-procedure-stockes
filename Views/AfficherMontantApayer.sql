DELIMITER |

CREATE PROCEDURE AfficherMontantApayer(IN p_frais_mensuel_id smallint,IN p_nom_classe varchar(15),OUT p_montant double)
BEGIN 

DECLARE v_montant double default 0; 

 SELECT cf.montant INTO v_montant from classe_frais_mensuel as cf 
		INNER JOIN frais_mensuel as fm 
			ON cf.frais_mensuel_id = fm.id 
		INNER JOIN classe as c 
			ON cf.classe_id = c.id where c.nom = p_nom_classe AND fm.id = p_frais_mensuel_id;
            
            IF v_montant != 0 OR v_montant is not null THEN
					SET p_montant = v_montant ;
				 ELSE 
					SET p_montant = 0 ;
			END IF;
END |
DELIMITER ;