/*

Exercise: 48 (Serge I: 2003-02-16)
Find the ship classes having at least one ship sunk in battles.

*/
 
 select distinct(Classes.class) from classes inner join (select coalesce(ships.class,outcomes.ship) class from outcomes  left outer join ships on ships.name=Outcomes.ship where Outcomes.result='sunk') a on a.class=Classes.class 