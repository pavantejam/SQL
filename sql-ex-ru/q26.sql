/*

Exercise: 26 (Serge I: 2003-02-14)
Find out the average price of PCs and laptops produced by maker A.
Result set: one overall average price for all items.

*/

select avg(price) from ( 
select laptop.price as price from product 
inner join laptop on laptop.model=product.model where maker='A' 
union all
select pc.price as price from product  
inner join pc on pc.model=product.model where maker='A'
) a


select avg(c.price) from ( select a.price as price from pc a join product b on a.model=b.model where b.maker='A'
union all
select a.price as price from laptop a join product b on a.model=b.model where b.maker='A' ) c
