select p.id,p.date_paie,p.eleve_id,concat_ws(' ', e.nom,e.postnom,e.prenom) as Noms,f.designation,f.montant
from paiement_mensuel as p
INNER JOIN eleve as e ON e.id=p.eleve_id
INNER JOIN frais_mensuel as f on f.id=p.frais_mensuel_id
 where  date_paie between '2020-09-1' and '2020-11-01' and f.designation='Inscription';