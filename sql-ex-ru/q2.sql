/* List all printer makers
*/


select distinct(Product.maker) from Product where product.type= 'Printer'