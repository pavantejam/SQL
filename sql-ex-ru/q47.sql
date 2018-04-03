/*

Exercise: 47 (Serge I: 2011-02-11)

Number the rows of the Product table as follows: makers in descending order of number of models produced by them (for manufacturers producing an equal number of models, their names are sorted in ascending alphabetical order); model numbers in ascending order.
Result set: row number as described above, manufacturer's name (maker), model.

*/

select ROW_NUMBER() over(order by count desc,maker asc,model asc),maker,model from  
(select *,count(*) over(partition by maker) count from Product) a
