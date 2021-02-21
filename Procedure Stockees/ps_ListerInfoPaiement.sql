DELIMITER |
CREATE PROCEDURE ps_ListerInfoPaiement(IN p_eleve_id smallint,OUT p_Total decimal)
BEGIN
select 
pm.id,pm.date_paie as 'Date',fm.designation as 'Désignation',IF(Pm.paye=true,cfm.Montant,0) AS Montant from paiement_mensuel as pm
INNER JOIN  eleve as e ON pm.eleve_id=e.id
INNER JOIN frais_mensuel as fm ON pm.frais_mensuel_id=fm.id
INNER JOIN classe as c ON e.classe_id=c.id
INNER JOIN classe_frais_mensuel as cfm on cfm.classe_id=c.id AND cfm.frais_mensuel_id=fm.id
WHERE e.id=p_eleve_id;

-- Calcul du totol 
SELECT
SUM(IF(Pm.paye=true,cfm.Montant,0)) INTO p_Total from paiement_mensuel as pm
INNER JOIN  eleve as e ON pm.eleve_id=e.id
INNER JOIN frais_mensuel as fm ON pm.frais_mensuel_id=fm.id
INNER JOIN classe as c ON e.classe_id=c.id
INNER JOIN classe_frais_mensuel as cfm on cfm.classe_id=c.id AND cfm.frais_mensuel_id=fm.id
WHERE e.id=p_eleve_id;

END |
DELIMITER |