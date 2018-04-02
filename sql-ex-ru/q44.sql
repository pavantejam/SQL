/*
Exercise: 44 (Serge I: 2002-12-04)
Find all ship names beginning with the letter R.
*/

select name from ships where name like 'R%'
union 
select ship from Outcomes where ship like 'R%'