/*Exercise: 14 (Serge I: 2012-04-20)
Get the makers who produce only one product type and more than one model.
 Output: maker, type.
*/
select Product.maker,max(Product.type) from computer.dbo.Product group by Product.maker having count(distinct(type))=1 and count(distinct(model))>1
