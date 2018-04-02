/*

Exercise: 36 (Serge I: 2003-02-17)
List the names of lead ships in the database (including the Outcomes table).

*/
select name from ships inner join classes on classes.class=ships.name
union
select ship from outcomes inner join classes on classes.class=Outcomes.ship


Select name
from 
	ships
where name in (select class from classes)
union
Select ship
from 
	outcomes
where ship in (select class from classes)
