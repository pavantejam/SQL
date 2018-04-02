/*
find the printer models having the highest price. 
*/

select Printer.model,Printer.price from Printer where Printer.price=(select max(price) from Printer)

