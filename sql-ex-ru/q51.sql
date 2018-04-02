/*

Exercise: 51 (Serge I: 2003-02-17)
Find the names of the ships with the largest number of guns 
among all ships having the same displacement (including ships in the Outcomes table).

*/
with cteNameClass( class, name)
as (
select coalesce(ship.class,Outcome.ship) as class, coalesce(ship.name,Outcome.ship) as name  from (select distinct(name),class from ships) ship full  outer join (select distinct(ship) from outcomes) as outcome on Outcome.ship=ship.name)


select name from cteNameClass
inner join 
(select class from classes inner join (select max(numguns) numguns,displacement from classes group by displacement) a on a.numguns=classes.numguns and a.displacement = classes.displacement) b on  cteNameClass.class= b.class
/*
similar logic but this works dont know the difference between these  
*/

WITH    cte
          AS ( SELECT   A.name ,
                        C.numGuns ,
                        C.displacement
               FROM     ( SELECT    S.name ,
                                    S.class
                          FROM      dbo.Ships AS S
                          UNION
                          SELECT    O.ship ,
                                    O.ship
                          FROM      dbo.Outcomes AS O
                        ) AS A
                        JOIN dbo.Classes AS C ON A.class = C.class
             )
    SELECT  cte.name
    FROM    cte
            JOIN ( SELECT   cte.displacement ,
                            MAX(cte.numGuns) AS MaxNumGun
                   FROM     cte
                   GROUP BY cte.displacement
                 ) AS M ON cte.displacement = M.displacement
                           AND cte.numguns = M.MaxNumGun