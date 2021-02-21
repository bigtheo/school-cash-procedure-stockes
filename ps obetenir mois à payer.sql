delimiter |
drop procedure if exists Ps_obtenirMoisApayer;
CREATE  PROCEDURE Ps_obtenirMoisApayer(IN p_eleve_id smallint, OUT p_moisApayer VARCHAR(20) )
BEGIN
-- déclaration des variables ...
 DECLARE v_nombrePaiementMensuel INT default 0;
 DECLARE v_moisInscription INT default 0;
 DECLARE v_jourInscription INT default 0;
 DECLARE v_dernierMoisPaye varchar(20) ;
 DECLARE v_jourCondition smallint unsigned ;
 DECLARE v_moisApayer varchar(20) default '0';
 
 /*affectation des valeurs nécésaires qui vont permettre de retrouver le mois à payer*/

 -- On obtient le nombre de paiements
 select count(id) INTO v_nombrePaiementMensuel from paiement_mensuel where eleve_id=p_eleve_id;
 
 -- on obtnient le mois de l'inscription
 SELECT month(p.date_paie) INTO v_moisInscription from paiement_mensuel as p INNER JOIN frais_mensuel as f 
   ON f.id=p.frais_mensuel_id 
   WHERE eleve_id=p_eleve_id and f.designation='Inscription';
 
 -- on obtient le jour de l'inscription
 SELECT day(p.date_paie) INTO v_jourInscription from paiement_mensuel as p INNER JOIN frais_mensuel as f 
   ON f.id=p.frais_mensuel_id 
   WHERE eleve_id=p_eleve_id and f.designation='Inscription';
   
   -- on obtient le dernier mois payé par l'élève 
   SELECT f.designation INTO v_dernierMoisPaye from paiement_mensuel as p 
   INNER JOIN frais_mensuel as f ON f.id=p.frais_mensuel_id 
   WHERE eleve_id=p_eleve_id order by p.id   desc limit 1 ;
   
   -- on obtien le jour à partir duquel l'élève ne paie le mois encours
   SELECT jour_mois_condition INTO v_jourCondition from configuration limit 1;
   
 
 /*Les traitements qui vont aider à trouver le mois à payer */
 IF v_nombrePaiementMensuel = 1 THEN 
	IF v_moisInscription = 9 THEN 
		SET v_moisApayer ='Octobre';
        ELSE
			IF v_moisInscription = 10 THEN -- si l'inscription s'est fait au mois d'octobre
				IF v_jourInscription < v_jourCondition THEN
					SET v_moisApayer = 'Octobre';
                    ELSE
                    SET v_moisApayer = 'Novembre';
				END IF;
			ELSE
            IF v_moisInscription = 11 THEN -- si l'inscription s'est fait au mois de novembre
				IF v_jourInscription < v_jourCondition THEN
					SET v_moisApayer = 'Novembre';
                    ELSE
                    SET v_moisApayer = 'Décembre';
				END IF;
			ELSE 
                IF v_moisInscription = 12 THEN -- si l'incription s'est fait au mois de décembre
					IF v_jourInscription < v_jourCondition THEN
						SET v_moisApayer = 'Décembre';
						ELSE
						SET v_moisApayer = 'Mars';
					END IF;
                ELSE 
                IF v_moisInscription = 1 THEN -- Si l'inscription s'est fait au mois de janvier
					IF v_jourInscription < v_jourCondition THEN
							SET v_moisApayer = 'Mars';
							ELSE
							SET v_moisApayer = 'Mars';
						END IF;
                ELSE
					IF v_moisInscription = 2 THEN
						IF v_jourInscription < v_jourCondition THEN
							SET v_moisApayer = 'Mars';
							ELSE
							SET v_moisApayer = 'Mars';
						END IF;
					ELSE
                     IF v_moisInscription = 3 THEN 
						IF v_jourInscription < v_jourCondition THEN
							SET v_moisApayer = 'Mars';
							ELSE
							SET v_moisApayer = 'Avril';
						END IF;
					ELSE
                    IF v_moisInscription = 4 THEN 
                    IF v_jourInscription < v_jourCondition THEN
							SET v_moisApayer = 'Mars';
							ELSE
							SET v_moisApayer = 'Avril';
						END IF;
					ELSE 
                      IF v_moisInscription = 5 THEN
                      IF v_jourInscription < v_jourCondition THEN
							SET v_moisApayer = 'Avril';
							ELSE
							SET v_moisApayer = 'Mai';
						END IF;
                   ELSE 
                   IF v_moisInscription = 6 THEN
                    IF v_jourInscription < v_jourCondition THEN
							SET v_moisApayer = 'Mai';
							ELSE
							SET v_moisApayer = 'Juin';
						END IF;
					ELSE  
                     IF v_moisInscription = 7 THEN 
						 IF v_jourInscription < v_jourCondition THEN
								SET v_moisApayer = 'Juin';
								ELSE
								SET v_moisApayer = 'Juillet';
						 END IF;
					ELSE 
                    IF v_moisInscription = 8 THEN 
                     IF v_jourInscription < v_jourCondition THEN
								SET v_moisApayer = 'Juillet';
								ELSE
								SET v_moisApayer = 'Aout';
						 END IF;
                   END IF;
			END IF;
		    END IF;
            END IF;
			END IF;
			END IF;
			END IF;
            END IF;
            END IF;
            END IF;
            END IF;
            END IF ;
    ELSE  -- dans le cas contraire on récupere le  dernier mois payé !!!
    IF v_dernierMoisPaye = 'Octobre' THEN
		SET v_moisApayer = 'Novembre';
        ELSE 
	IF v_dernierMoisPaye = 'Novembre' THEN
		SET v_moisApayer = 'Décembre';
     ELSE 
      IF v_dernierMoisPaye = 'Décembre' THEN 
			SET v_moisApayer = 'Mars';
       ELSE 
       IF v_dernierMoisPaye = 'Janvier' THEN 
			SET  v_moisApayer = 'Mars';
        ELSE 
        IF v_dernierMoisPaye = 'Février' THEN 
			SET  v_moisApayer = 'Mars';
		ELSE
         IF v_dernierMoisPaye = 'Mars' THEN 
			SET  v_moisApayer = 'Avril';
         ELSE IF v_dernierMoisPaye = 'Avril' THEN 
			SET  v_moisApayer = 'Mai';
         ELSE IF v_dernierMoisPaye = 'Mai' THEN 
			SET  v_moisApayer = 'Juin';
		 ELSE IF v_dernierMoisPaye = 'Juin' THEN 
			SET  v_moisApayer = 'Juillet';
             ELSE IF v_dernierMoisPaye = 'Juillet' THEN 
			SET  v_moisApayer = 'Aout';
            ELSE 
            IF v_dernierMoisPaye = 'Juin' THEN 
			SET  v_moisApayer = 'Aout';
             ELSE IF v_dernierMoisPaye = 'Aout' THEN 
			SET  v_moisApayer = 'Septembre';
            END IF;
		END IF;
		END IF;
		END IF;
		END IF;
        END IF;
       END IF;
      END IF;
	END IF;
    END IF;
    END IF ;
    END IF;
 END IF;
 SET  p_moisApayer =v_moisApayer; -- on retourne la valeur 

END
delimiter ;