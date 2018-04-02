/*
Exercise: 46 (Serge I: 2003-02-14)
For each ship that participated in the Battle of Guadalcanal, 
get its name, displacement, and the number of guns.

*/

select a.ship,Classes.displacement,Classes.numGuns from (select ship from Outcomes where battle='Guadalcanal') a left outer join ships on ships.name=a.ship
left outer join Classes on ships.class=Classes.class or a.ship=Classes.class