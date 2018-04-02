/*

Exercise: 31 (Serge I: 2002-10-22)
For ship classes with a gun caliber of 16 in. or more, display the class and the country.

*/
select class,country from Classes where bore>=16 group by class,country
