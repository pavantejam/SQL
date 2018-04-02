/*

Exercise: 45 (Serge I: 2002-12-04)
Find all ship names consisting of three 
or more words (e.g., King George V).
Consider the words in ship names to be separated by single spaces, 
and the ship names to have no leading or trailing spaces.

*/
select name from Ships where  name like '% % %'
union
select ship from Outcomes where ship like '[A-Za-z0-9]% [A-Za-z0-9]% %[A-Za-z0-9]'
 