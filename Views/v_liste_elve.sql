CREATE VIEW v_liste_elve AS 
SELECT e.id,concat_ws(' ',e.nom,e.postnom,e.prenom) as 'noms',e.genre as Genre,c.nom as classe,e.adresse 
from eleve as e 
INNER JOIN classe as c ON c.id=e.classe_id
Order by c.nom,e.nom,e.postnom,e.prenom;