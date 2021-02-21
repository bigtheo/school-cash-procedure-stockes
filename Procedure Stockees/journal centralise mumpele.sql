use school_cash_managerdb;
select s.nom_section Section,count(p.eleve_id) as 'Nombre de réçus',sum(f.montant) as Total
from paiement_mensuel as p 
INNER JOIN frais_mensuel as f ON f.id=p.frais_mensuel_id 
inner join classe as c on c.id=f.classe_id 
inner join section as s ON s.id=c.section_id 
where date(p.date_paie)=curdate() 
group by (s.nom_section) ;
