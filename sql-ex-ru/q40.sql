/*
Exercise: 40 (Serge I: 2002-11-05)
For the ships in the Ships table that have at least 10 guns, get the class, name, and country.

*/

select ships.class,name,country from classes inner join ships on classes.class=ships.class where numGuns>=10