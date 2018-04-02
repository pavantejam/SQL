/*

Exercise: 37 (Serge I: 2003-02-17)
Find classes for which only one ship exists in the database (including the Outcomes table)

*/


select class from  classes inner join (
select coalesce(ships.class,a.name) as name from (select name as name from ships 
union 
select ship as name from outcomes ) a left outer join ships on ships.name=a.name) b on b.name=classes.class group by class having count(*)=1
 