/*

Exercise: 90 (Serge I: 2012-05-04)

Display all records from the Product table 
except for three rows with the smallest model numbers 
and three ones with the greatest model numbers.

*/
SELECT * FROM Product WHERE MODEL NOT IN(
select * from
(select top(3) model from product order by model asc
union
select top(3) model from product order by model desc)A )