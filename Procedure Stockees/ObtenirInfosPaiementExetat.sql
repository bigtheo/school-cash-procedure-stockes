DELIMITER |
CREATE PROCEDURE ObtenirInfosPaiementExetat(IN p_eleve_id INT,OUT p_frais_exetat_id smallint,OUT p_designation_frais_exetat char(20))
BEGIN
DECLARE v_nombre_paiement smallint default 0;
-- on compte le le paiement exétat éffectué par un élève...
SELECT count(id) INTO v_nombre_paiement  from paiement_exetat where eleve_id= p_eleve_id;

-- si nombre de paiement ne vaut pas null
IF v_nombre_paiement IS not null THEN
	-- si le nombre de paiement vaut 0 c'est-à-dire qu'il pas encore payé on selectionne montant,id frais...
    SET p_frais_exetat_id = v_nombre_paiement +  1; -- + 1 car il vaut 0 par défaut
    SELECT designation INTO p_designation_frais_exetat FROM frais_exetat where id = p_frais_exetat_id;

ELSE
-- On reunitialise 
Set p_frais_exetat_id = 0 ;
set p_designation_frais_exetat ='Inconnu';
END if;

END |
DELIMITER |

