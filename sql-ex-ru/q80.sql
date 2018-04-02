/*

Exercise: 80 (Baser: 2011-11-11)

Find the computer equipment makers 
not producing any PC models which are absent in the PC table.

*/

select distinct(maker) from product where maker not in (
select distinct(maker) from Product inner join (
select model from product where type='PC' and model not in (select distinct(model) from pc))a 
on a.model=product.model)