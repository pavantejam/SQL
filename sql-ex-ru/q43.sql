/*

Exercise: 43 (qwrqwr: 2011-10-28)

Get the battles that occurred in years when no ships were launched into water.

*/

select Battles.name from (
select name,class from ships
union 
select ship,ship from Outcomes
) a
inner join 
classes on classes.class=a.class or classes.class=a.name
inner join Ships on a.class=ships.class and a.name=Ships.name
right join Battles on Ships.launched=year(Battles.date)
where a.name is null

