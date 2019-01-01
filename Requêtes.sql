
--					Toutes les requêtes demandées dans le proCRE




--Requete pour la table Lieu ( pour la clé étrangère)
select Table1.id_lieu from Table1 Inner join Table2 ON Table1.nom_lieu=Table2.province where Table2.Ville<>''
--Requete pour les deux clé étrangères de la table guerre: 
SELECT Lieu.id_lieu,année_guerre.id_année_g from Lieu inner join année_guerre ON  Lieu.id_lieu=année_guerre.id_année_g

-- requête pour la jointure entre le lieu et la vente
select Lieu.id_lieu,vente_2.ID from Lieu inner join vente_2 on Lieu.nom_lieu = vente_2.Ville OR Lieu.nom_lieu=vente_2.Province



--requête num1
DELIMITER //
CREATE PROCEDURE mdr(IN p INT)
BEGIN
SELECT contenir.id_vente,décoration_f.Décoration_1,divinité.nom_div
FROM contenir,vente,décoration_f,divinité
where contenir.id_vente=vente.ID AND vente.id_lieu=p AND décoration_f.ID=contenir.ID_décoration AND divinité.ID=décoration_f.Divinité_ID
GROUP BY vente.id_lieu
HAVING count(*) >= ALL (SELECT count(*)
                    FROM contenir
                    GROUP BY id_vente);
END //
DELIMITER ;
call mdr()
--requête num2
DELIMITER //
CREATE PROCEDURE moy_objet(IN. p int)
BEGIN
select ID_monie,ID_Objet,avg(utiliser.quantité) from utiliser inner join vente on utiliser.ID=vente.ID  where vente.ID_Objet=p Limit;
END //
--requête num3:

select Lieu.nom_lieu from Lieu,utiliser,vente where utiliser.ID_Monie='Oo' OR utiliser.ID_Monie='Of' AND vente.ID=utiliser.ID AND Lieu.id_lieu=vente.ID_LIEU;

--Requête num4 :
SELECT sum(case when ID_LIEU=4 then 1 else 0 end)*100/count(*) AS PourcentageVente,1 AS siecle FROM vente where annee < 100
UNION
SELECT sum(case when ID_LIEU=4 then 1 else 0 end)*100/count(*) AS PourcentageVente,2 AS siecle FROM vente where annee between 100 AND 200
UNION
SELECT sum(case when ID_LIEU=4 then 1 else 0 end)*100/count(*) AS PourcentageVente,3 AS siecle FROM vente where annee between 200 AND 300
UNION
SELECT sum(case when ID_LIEU=4 then 1 else 0 end)*100/count(*) AS PourcentageVente,4 AS siecle FROM vente where annee between 300 AND 400
UNION
SELECT sum(case when ID_LIEU=4 then 1 else 0 end)*100/count(*) AS PourcentageVente,5 AS siecle FROM vente where annee between 400 AND 500;

--requête 5eme:
SELECT Mois,sum(case when ID_mois=1 then 1 else 0 end)*100/count(*) AS PourcentageVente FROM vente,mois
where mois.ID=1
UNION
SELECT Mois,sum(case when ID_mois=2 then 1 else 0 end)*100/count(*) AS PourcentageVente FROM vente,mois
where mois.ID=2
UNION
SELECT Mois,sum(case when ID_mois=3 then 1 else 0 end)*100/count(*) AS PourcentageVente FROM vente,mois
where mois.ID=3
UNION
SELECT Mois,sum(case when ID_mois=4 then 1 else 0 end)*100/count(*) AS PourcentageVente FROM vente,mois
where mois.ID=4
UNION
SELECT Mois,sum(case when ID_mois=5 then 1 else 0 end)*100/count(*) AS PourcentageVente FROM vente,mois
where mois.ID=5
UNION
SELECT Mois,sum(case when ID_mois=6 then 1 else 0 end)*100/count(*) AS PourcentageVente FROM vente,mois
where mois.ID=6
UNION
SELECT Mois,sum(case when ID_mois=7 then 1 else 0 end)*100/count(*) AS PourcentageVente FROM vente,mois
where mois.ID=7
UNION
SELECT Mois,sum(case when ID_mois=8 then 1 else 0 end)*100/count(*) AS PourcentageVente FROM vente,mois
where mois.ID=8
UNION
SELECT Mois,sum(case when ID_mois=9 then 1 else 0 end)*100/count(*) AS PourcentageVente FROM vente,mois
where mois.ID=9
UNION
SELECT Mois,sum(case when ID_mois=10 then 1 else 0 end)*100/count(*) AS PourcentageVente FROM vente,mois
where mois.ID=10
UNION
SELECT Mois,sum(case when ID_mois=11 then 1 else 0 end)*100/count(*) AS PourcentageVente FROM vente,mois
where mois.ID=11
UNION
SELECT Mois,sum(case when ID_mois=12 then 1 else 0 end)*100/count(*) AS PourcentageVente FROM vente,mois
where mois.ID=12


--requête 6:
DELIMITER //
CREATE PROCEDURE guerre(IN p int)
BEGIN
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g1 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g1
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g2 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g2
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g3 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g3
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g4 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g4
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g5 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g5
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g6 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g6
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g7 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g7
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g8 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g8
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g9 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g9
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g10 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g10
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g11 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g11
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g12 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g12
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g13 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g13
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g14 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g14
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g15 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g15
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g16 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g16
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g17 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g17
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g18 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g18
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g19 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g19
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g20 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g20
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g21 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g21
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g22 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g22
UNION
select guerre.id_lieu,count(vente.ID),guerre.id_année_g,année_guerre.Année_g23 from vente,guerre,année_guerre where guerre.id_lieu=p AND vente.Annee=année_guerre.année_g23;
END //


--requête num7:
CREATE PROCEDURE insertion(IN id INTEGER,IN ID_lieu INTEGER,IN ID_object INTEGER,IN ID_mois INTEGER,IN Quantity INTEGER,IN year INTEGER,IN day INTEGER)
BEGIN
insert into vente (ID,ID_LIEU,ID_Objet,ID_Mois,Quantité,Annee,Jour)
values( id,
ID_lieu,
ID_object,
ID_mois,
Quantity,
year,
day);
END //
DELIMITER ;
--
DELIMITER //
CREATE PROCEDURE suppression(IN id INTEGER)
BEGIN
DELETE FROM vente WHERE ID = id;
END //
DELIMITER ;
--
DELIMITER //
CREATE PROCEDURE mettre_a_jour(IN id INTEGER,IN ID_lieu INTEGER,IN ID_object INTEGER,IN ID_mois INTEGER,IN Quantity INTEGER,IN year INTEGER,IN day INTEGER)
BEGIN
UPDATE vente SET
ID=id,
ID_LIEU=ID_lieu,
ID_Objet=ID_object,
ID_Mois=ID_mois,
Quantité=Quantity,
Annee=year,
Jour=day
WHERE ID=id;
END //
DELIMITER ;


--requête num 8:
CREATE OR REPLACE view FARID AS 
select count(fabriquer.vente_2_ID),fabriquer.Artisans_ID from fabriquer,vente where fabriquer.vente_2_ID=vente.ID AND (vente.Annee between 0 AND 100) AND Artisans_ID=36
UNION
select count(fabriquer.vente_2_ID),fabriquer.Artisans_ID from fabriquer,vente where fabriquer.vente_2_ID=vente.ID AND (vente.Annee between 100 AND 200) AND Artisans_ID=36
UNION
select count(fabriquer.vente_2_ID),fabriquer.Artisans_ID from fabriquer,vente where fabriquer.vente_2_ID=vente.ID AND (vente.Annee between 200 AND 300) AND Artisans_ID=36
UNION
select count(fabriquer.vente_2_ID),fabriquer.Artisans_ID from fabriquer,vente where fabriquer.vente_2_ID=vente.ID AND (vente.Annee between 300 AND 400) AND Artisans_ID=36
UNION
select count(fabriquer.vente_2_ID),fabriquer.Artisans_ID from fabriquer,vente where fabriquer.vente_2_ID=vente.ID AND (vente.Annee between 400 AND 500) AND Artisans_ID=36;

DELIMITER //
CREATE PROCEDURE artisans(IN p int)
BEGIN
select count(fabriquer.vente_2_ID),fabriquer.Artisans_ID from fabriquer,vente where fabriquer.vente_2_ID=vente.ID AND (vente.Annee between 0 AND 100) AND Artisans_ID=p
UNION
select count(fabriquer.vente_2_ID),fabriquer.Artisans_ID from fabriquer,vente where fabriquer.vente_2_ID=vente.ID AND (vente.Annee between 100 AND 200) AND Artisans_ID=p
UNION
select count(fabriquer.vente_2_ID),fabriquer.Artisans_ID from fabriquer,vente where fabriquer.vente_2_ID=vente.ID AND (vente.Annee between 200 AND 300) AND Artisans_ID=p
UNION
select count(fabriquer.vente_2_ID),fabriquer.Artisans_ID from fabriquer,vente where fabriquer.vente_2_ID=vente.ID AND (vente.Annee between 300 AND 400) AND Artisans_ID=p
UNION
select count(fabriquer.vente_2_ID),fabriquer.Artisans_ID from fabriquer,vente where fabriquer.vente_2_ID=vente.ID AND (vente.Annee between 400 AND 500) AND Artisans_ID=p;
END //
DELIMITER //

--requête 9:
select DISTINCT fabriquer.Artisans_ID,contenir.ID_décoration,divinité.nom_div from fabriquer,vente,contenir,utiliser,divinité,décoration_f where fabriquer.vente_2_ID=vente.ID AND contenir.id_vente=vente.ID AND utiliser.ID=vente.ID AND utiliser.ID_monie='Oo' AND décoration_f.ID=contenir.ID_décoration GROUP BY utiliser.quantité ORDER BY utiliser.quantité DESC limit 20;

--reuqête 10:
DELIMITER //
create procedure stat(in p int)
BEGIN
select sum(case when vente.id_lieu=p then 1 else 0 end)+sum(case when vente.id_lieu=(select sum(case when vente.id_lieu=lieu.id_lieu then 1 else 0 end)   from lieu where lieu.id_province=p) then 1 else 0 end) as total,lieu.nom_lieu as Moutawajid from vente,lieu where lieu.id_lieu=p;
END //
DELIMITER ;
