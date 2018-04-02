/*

Exercise: 28 (Serge I: 2012-05-04)
Using Product table, find out the number of makers who produce only one model.

*/
select count(*) from (select maker from product group by maker having count(distinct(model))=1) a

select count(*) from product where maker in (select distinct(maker) from product group by maker having count(*)=1)
