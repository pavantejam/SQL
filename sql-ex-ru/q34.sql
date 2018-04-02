/*

Exercise: 34 (Serge I: 2002-11-04)
In accordance with the Washington Naval Treaty concluded in the beginning of 1922, 
it was prohibited to build battle ships with a displacement of more than 35 thousand tons. 
Get the ships violating this treaty (only consider ships for which the year of launch is known). 
List the names of the ships.

*/

select name from ships inner join classes on ships.class=classes.class where Classes.displacement>35000 and Ships.launched>=1922 and Classes.type='bb'

select s.name from classes as c inner join (Select * from ships where launched is not null and launched>=1922) as s on s.class=c.class where c.displacement>35000 and c.type='bb'
