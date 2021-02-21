CREATE VIEW v_accompte AS 
select a.Id as 'N°',a.date_paie AS 'Date et Heure',e.id,concat_ws(' ',e.nom,e.postnom) as Noms,f.designation,a.montant
from accompte as a inner join frais_mensuel as f on a.frais_mensuel_id=f.id
Inner join eleve as e on a.eleve_id=e.id;



