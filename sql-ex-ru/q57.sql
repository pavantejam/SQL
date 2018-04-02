/*

Exercise: 57 (Serge I: 2003-02-14)
For classes having irreparable combat losses and at least three ships in the database, 
display the name of the class and the number of ships sunk

*/

with 
cteNameClass(name,class) as 
(
select coalesce(a.name,classes.class),coalesce(a.class,classes.class) from (Select coalesce(a.name,ships.name) name,coalesce(ships.class,a.name) class from ships full join (select distinct(ship) name from outcomes) a on a.name=Ships.name ) a right join Classes on a.class=Classes.class
)

--select class,count(*) count from Outcomes inner join cteNameClass on Outcomes.ship=cteNameClass.name where result='sunk' group by class


select a.class,count from 
	(select class from cteNameClass group by class having count(*)>=3) a
inner join
	(select class from  cteNameClass 
		inner join 
	Outcomes
	on Outcomes.ship=cteNameClass.name 
	where result='sunk' 
	group by class) class
on  a.class=class.class
inner join 
	(select class,count(*) count from Outcomes inner join cteNameClass on Outcomes.ship=cteNameClass.name where result='sunk' group by class) c
on a.class=c.class
