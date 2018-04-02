/*

Exercise: 21 (Serge I: 2003-02-13)
Find out the maximum PC price for each maker having models in the PC table. 
Result set: maker, maximum price.


*/

select product.maker,max(pc.price) from pc inner join product on pc.model=Product.model group by Product.maker