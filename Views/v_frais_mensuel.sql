CREATE ALGORITHM=UNDEFINED DEFINER=CURRENT_USER 
SQL SECURITY DEFINER VIEW `v_classe_frais_mensuel` 
AS select `f`.`id` AS `id`,`c`.`nom` AS `nom`,`f`.`designation` AS `designation`,
`f`.`Montant` AS `montant` from frais_mensuel AS f
INNER JOIN classe as c On f.classe_id=c.id;