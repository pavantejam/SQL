/*
Exercise: 58 (Serge I: 2009-11-13)

For each product type and maker in the Product table,
 find out, with a precision of two decimal places, 
 the percentage ratio of the number of models of the actual type produced by the actual maker to
 the total number of models by this maker.

Result set: maker, product type, the percentage ratio mentioned above.

*/

select c.maker,c.type,coalesce((cast( (CAST(a.modelcount as float)/typecount)*100 as decimal(5,2))),0)as count  from 
(select count(*) modelcount,maker,type from Product group by maker,type) a
inner join 
(select count(*) typecount,maker from product group by maker ) b
on a.maker=b.maker
right join 
(select ca.type type,cb.maker maker from 
(select distinct type from product) ca
cross join 
(select distinct maker from Product) cb
) c
on c.maker=a.maker and a.type=c.type