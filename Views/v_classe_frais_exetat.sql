create view v_classe_frais_exetat as
select cf.id,c.nom,f.designation,cf.montant from classe_frais_exetat as cf inner join frais_exetat as f on cf.frais_exetat_id=f.id inner join classe as c on cf.classe_id=c.id