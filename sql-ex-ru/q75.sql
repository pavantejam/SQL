/*

Exercise: 75 (Serge I: 2009-04-17)

For each ship from the Ships table, determine the name of the earliest battle 
from the Battles table it could have participated in after being launched. 
If the year the ship has been launched is unknown use the latest battle. 
If no battles occurred after the ship was launched, display NULL 
instead of the battle name.
It’s assumed a ship can participate in any battle 
fought in the year of its launching.
Result set: name of the ship, year it was launched, name of battle.

Note: assume there are no battles fought at the same day.

*/

--select a.name,launched, Battles.name from (
--select Ships.name,class,min(date) date_war,min(launched) launched from Ships full join Battles on Ships.launched<=year(battles.date)  group by Ships.name,class) a
--inner join Battles on a.date_war=Battles.date


select a.name,launched, Battles.name from ( 
select ships.name,class,min(date) date_war,coalesce(launched,(select year(max(date)) from Battles)) launched
from Ships 
left join Outcomes on Ships.name=Outcomes.ship
left join Battles on Ships.launched<=year(battles.date) 
					or Outcomes.battle=battles.name
group by ships.name,class,launched) a
left join Battles on a.date_war=Battles.date


--couldn't solve this had to use external help

select name, launched,
  case
  when launched is null
    then (select top 1 name from Battles order by date desc)
  when launched > (select max(datepart(yy, date)) from Battles)
    then NULL
  else (select top 1 name from Battles B
        where datepart(yy, date) >= launched
        order by date)
  end battle
from Ships

