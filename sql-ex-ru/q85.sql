/*

Exercise: 85 (Serge I: 2012-03-16)

Get makers producing either printers only or personal computers only; 
in case of PC manufacturers they should produce at least 3 models.

*/

select a.maker from (
select distinct(maker),type from product where type in ('PC','Printer')) a
inner join   
(select maker from Product group by maker having count(distinct(type))=1) b 
on a.maker=b.maker
where type='Printer'
union 
select D.maker from (  
select distinct(maker),type from product where type in ('PC','Printer')) c
inner join   
(select maker from Product group by maker having count(distinct(type))=1) d
on c.maker=d.maker
inner join Product
on d.maker=Product.maker
group by d.maker
having count(model)>=3


