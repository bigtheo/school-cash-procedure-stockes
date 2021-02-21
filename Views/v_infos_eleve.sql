create view v_infos_d_un_eleve as
select e.id,e.nom as 'nom',s.nom_section ,e.postnom,e.prenom,e.genre,e.date_naissance ,e.lieu_naissance,
	   c.nom as classe,p.nom as nom_pere,p.telephone as tel_pere,m.nom as nom_mere,m.telephone as tel_mere,e.adresse
from eleve as e INNER JOIN Classe as c On e.classe_id=c.id INNER JOIN pere as p ON e.pere_id=p.id 
INNER JOIN mere AS m ON e.mere_id=m.id inner join section as s ON c.section_id=s.id;