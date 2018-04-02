/*

Exercise: 73 (Serge I: 2009-04-17)

For each country, 
determine the battles in which the ships of this country did not participate.
Result set: country, battle.

*/


with cte_class_ship(class,ship) as(select ships.class,outcomes.ship
from Ships 
inner join outcomes  
on Outcomes.ship=ships.name or Outcomes.ship=Ships.class
union 
select classes.class,ship
from Classes 
inner join outcomes  
on Outcomes.ship=Classes.class) 
((select distinct(country), battle from (select distinct(country) from Classes)a cross join 
(select distinct(battle) from outcomes union select name from Battles)b)
except
(select distinct(country),battle from Outcomes 
inner join cte_class_ship 
on cte_class_ship.ship=Outcomes.ship
inner join Classes 
on Classes.class=cte_class_ship.class
))
select battle from outcomes
