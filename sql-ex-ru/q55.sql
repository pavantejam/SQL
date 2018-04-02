/*

Exercise: 55 (Serge I: 2003-02-16)
For each class, determine the year the first ship of this class was launched. 
If the lead ship’s year of launch is not known, get the minimum year of launch for the ships of this class.
Result set: class, year.


*/
with cteNameClass(name,class) as (
select coalesce(a.name,classes.class),coalesce(a.class,classes.class) from (Select coalesce(a.name,ships.name) name,coalesce(ships.class,a.name) class from ships full join (select distinct(ship) name from outcomes) a on a.name=Ships.name ) a right join Classes on a.class=Classes.class
)


select cteNameClass.class,min(launched) from cteNameClass left join ships on cteNameClass.class=Ships.class group by cteNameClass.class

select * from (Select coalesce(a.name,ships.name) name,coalesce(ships.class,a.name) class from ships full join (select distinct(ship) name from outcomes) a on a.name=Ships.name ) a full join Classes on a.class=Classes.class