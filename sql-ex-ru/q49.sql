/*

Exercise: 49 (Serge I: 2003-02-17)
Find the names of the ships having a gun caliber of 16 inches (including ships in the Outcomes table).

*/

select distinct(a.name) from (select coalesce(ships.name,outcomes.ship) name,coalesce(ships.class,outcomes.ship) class from outcomes  full outer join ships on ships.name=Outcomes.ship) a inner join Classes on Classes.class=a.class where bore=16
 