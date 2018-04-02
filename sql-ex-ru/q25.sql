/*

Exercise: 25 (Serge I: 2003-02-14)
Find the printer makers also producing PCs with the lowest RAM capacity and
the highest processor speed of all PCs having the lowest RAM capacity. 
Result set: maker.

*/
select distinct(product.maker) from  pc 
inner join 
product on product.model= pc.model
where speed=
(select max(speed) from pc where ram = (select  min(ram) from pc)) and ram= (select  min(ram) from pc) 

SELECT DISTINCT maker FROM product WHERE product.type = 'printer'
INTERSECT
SELECT maker FROM product WHERE model in (
SELECT model FROM pc WHERE ram = (SELECT MIN(ram) FROM pc) AND speed = (SELECT MAX(speed) FROM pc WHERE ram = (SELECT MIN(ram) FROM pc))
) ORDER BY maker
