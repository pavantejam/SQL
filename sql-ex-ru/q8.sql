/*
Find the makers producing PCs but not laptops.
*/

select Distinct(product.maker) from product where product.type='PC' and Product.maker not in  (select maker from  Product where type='Laptop')

select distinct(maker) from product where maker not in (select maker from product where type ='laptop') and (type='PC')
