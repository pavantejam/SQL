/*


Exercise: 71 (Serge I: 2008-02-23)
Find the PC makers with all personal computer models produced by them being present in the PC table.

*/

select a.maker from 
(select maker,count(distinct(model)) count from product where type='PC'  group by maker) a
inner join 
(select maker,count(distinct(product.model)) count from pc inner join Product on product.model=pc.model group by maker ) b
on a.count=b.count and a.maker = b.maker
