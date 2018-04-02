/*Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker.
*/
select distinct(Product.maker) from product inner join (select model from pc where speed>=450) as model on Product.model=model.model

select distinct(a.maker) from product a join pc b on a.model =b.model where b.speed>=450
