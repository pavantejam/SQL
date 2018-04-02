/*
	
Exercise: 38 (Serge I: 2003-02-19)
Find countries that ever had classes of both battleships (‘bb’) and cruisers (‘bc’).

*/

select country from Classes group by country having count(distinct(type))=2