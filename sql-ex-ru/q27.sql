/*

Exercise: 27 (Serge I: 2003-02-03)
Find out the average hard disk drive capacity of PCs produced by makers 
who also manufacture printers.
Result set: maker, average HDD capacity.

*/
--select avg(price) from pc inner join select maker from product where on 
select maker,avg(hd) from (select model as model,maker as maker from product where maker in (select distinct(maker) from product where type='Printer')) as a inner join PC on a.model=pc.model group by maker



select d.maker,avg(c.hd) from 
pc c
join (select model,maker from 
	  product 
		where maker in (
						select distinct(a.maker) maker from 
											(
											(select maker from product where type = 'pc') a
											join
											(select maker from product where type = 'printer')  b
											on a.maker = b.maker
											)
						)
		and type='pc'
	  ) d
on c.model=d.model
group by d.maker
