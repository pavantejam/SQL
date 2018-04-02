/*

Exercise: 54 (Serge I: 2003-02-14)
With a precision of two decimal places, determine the average number of guns for all battleships 
(including the ones in the Outcomes table).

*/

select cast(avg(cast(classes.numGuns as float)) as decimal(5,2)) from classes  
inner join (select distinct(name),class from ships
union 
select distinct(ship),ship from outcomes) a
on a.class=classes.class
group by classes.type
having Classes.type='bb'


