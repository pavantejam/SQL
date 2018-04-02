/*
Get the models and prices for all commercially available products (of any type) produced by maker B.
*/
select modelL.model as model , Laptop.price as price from
(select product.model as model from product where maker='B') as modelL inner join laptop on laptop.model=modelL.model
union
select modelP.model as model , printer.price as price from
(select product.model as model from product where maker='B') as modelP inner join printer on modelP.model=Printer.model
union
select modelPC.model as model , pc.price as price from
(select product.model as model from product where maker='B') as modelPC inner join PC on modelPC.model=Pc.model



/*second method*/
select models.model,models.price from
(select pc.model as model,pc.price as price from PC
union
select Printer.model as model,Printer.price as price from Printer
union
select Laptop.model as model,Laptop.price as price from Laptop) as models
inner join Product on product.model= models.model
where maker='B'