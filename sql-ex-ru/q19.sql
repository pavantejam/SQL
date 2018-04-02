/*
Exercise: 19 (Serge I: 2003-02-13)
For each maker having models in the Laptop table, find out the average screen size of the laptops he produces. 
Result set: maker, average screen size.
*/
select p.maker,avg(l.screen) from Laptop as l inner join Product as p on p.model = l.model group by p.maker
