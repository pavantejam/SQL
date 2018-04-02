/*

Exercise: 23 (Serge I: 2003-02-14)
Get the makers producing both PCs having a speed of 750 MHz or higher and laptops 
with a speed of 750 MHz or higher. 
Result set: maker

*/
select maker from product inner join 
(
select model from pc where speed >=750
union 
select model from Laptop where speed>=750
) as a
on Product.model=a.model
group by maker 
having count(distinct(type))> 1





select distinct(c.maker) from (select b.maker as maker from pc a join product b on a.model=b.model where a.speed>=750) c join (select b.maker as maker from laptop a join product b on a.model=b.model where a.speed>=750) d  on c.maker=d.maker
