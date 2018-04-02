/*

Exercise: 70 (Serge I: 2003-02-14)

Get the battles in which at least three ships from the same country took part.

*/
select distinct(battle) from classes inner join
(
select name,class from Ships inner join outcomes on (Ships.name=Outcomes.ship or ships.class=Outcomes.ship)
union 
select ship,class from Classes inner join Outcomes on Classes.class=Outcomes.ship
) s
on classes.class=s.class
inner join  Outcomes on s.class=Outcomes.ship or s.name=Outcomes.ship
group by battle,country
having count(distinct(name))>=3

