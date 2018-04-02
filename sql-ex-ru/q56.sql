/*

Exercise: 56 (Serge I: 2003-02-16)
For each class, find out the number of ships of this class that were sunk in battles. 
Result set: class, number of ships sunk. 

*/ 

with cteNameClass(name,class) as (
select coalesce(a.name,classes.class),coalesce(a.class,classes.class) from (Select coalesce(a.name,ships.name) name,coalesce(ships.class,a.name) class from ships full join (select distinct(ship) name from outcomes) a on a.name=Ships.name ) a right join Classes on a.class=Classes.class
)

select b.class,coalesce(a.count,0) from (select class,count(*) count from cteNameClass left join Outcomes on cteNameClass.name=Outcomes.ship where result='sunk' group by class) a right join (select distinct(class) from cteNameClass) b on b.class=a.class
