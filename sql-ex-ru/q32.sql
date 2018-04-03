/*

Exercise: 32 (Serge I: 2003-02-17)
One of the characteristics of a ship is one-half the cube of the calibre of its main guns (mw). 
Determine the average ship mw with an accuracy of two decimal places for each country 
having ships in the database.

*/

select classes.country,convert(decimal(6,2),avg(((0.5)*(power(bore,3))))) from (
select name,class from ships
union 
select ship,ship from Outcomes
) a
inner join 
classes on classes.class=a.class or classes.class=a.name

group by Classes.country