/*
Exercise: 24 (Serge I: 2003-02-03)
List the models of any type having the highest price of all products present in the database.
*/
select model from laptop where price = (select max(price) from (
select max(price) as price from Laptop 
union 
select max(price) as price from pc
union
select max(price) as price from printer
) as a)
union 

select model from PC where price = (select max(price) from (
select max(price) as price from Laptop 
union 
select max(price) as price from pc
union
select max(price) as price from printer
) as b)
union
select model from printer where price = (select max(price) from (
select max(price) as price from Laptop 
union 
select max(price) as price from pc
union
select max(price) as price from printer
) as c)




select c.model from 
(Select a.model as model,b.price as price from product a join pc b on a.model=b.model union Select a.model as model,b.price as price from product a join laptop b on a.model=b.model union Select a.model as model,b.price as price from product a join printer b on a.model=b.model) c
where c.price=(select MAX(c.price) from (Select a.model as model,b.price as price from product a join pc b on a.model=b.model union Select a.model as model,b.price as price from product a join laptop b on a.model=b.model union Select a.model as model,b.price as price from product a join printer b on a.model=b.model) c)
