/*

Exercise: 32 (Serge I: 2003-02-17)
One of the characteristics of a ship is one-half the cube of the calibre of its main guns (mw). 
Determine the average ship mw with an accuracy of two decimal places for each country 
having ships in the database.

*/
select country,round(avg(bore*bore*bore)/2 ,2) from classes inner join 
(select coalesce(name,ship) name,coalesce(class,ship) class 
from ships full join outcomes on Outcomes.ship=ships.name) as a on a.class=classes.class group by Classes.country

select coalesce(name,ship) name,coalesce(class,ship),ship,name,class class 
from ships full join outcomes on Outcomes.ship=ships.name

select country,a.name,a.class,bore,a.ship, a.c,a.n  from classes inner join 
(select coalesce(name,ship) name,coalesce(class,ship) class, ship, name n, class c
from ships full join outcomes on Outcomes.ship=ships.name) as a on a.class=classes.class 