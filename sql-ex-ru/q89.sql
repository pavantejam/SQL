/*

Exercise: 89 (Serge I: 2012-05-04)

Get makers having most models in the Product table,
as well as those having least.
Output: maker, number of models

*/
with cte_count(count)as
(select count(model)count from product group by maker)
(
select maker,COUNT(model) from 
	Product 
	group by maker 
	having count(model)=(select max(count) from cte_count) 
	or 
	count(model)=(select min(count) from cte_count)
)