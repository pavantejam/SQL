/*
Exercise: 18 (Serge I: 2003-02-03)
Find the makers of the cheapest color printers.
Result set: maker, price.
*/
select distinct(product.maker),a.price from product inner join 
(select  model,price from printer where price=(select min(price) from Printer where color='y') and color ='y' ) as a
on a.model=Product.model 

Select distinct(a.maker), b.price from product a join printer b on a.model=b.model where b.price=(select min(price) from printer where color='y') and color='y'

