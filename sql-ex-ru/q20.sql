/*
Exercise: 20 (Serge I: 2003-02-13)
Find the makers producing at least three distinct models of PCs.
Result set: maker, number of PC models.
*/
/*
made a mistake of assuming that all the models made by the maker are in pc table

*/
select p.maker,count(distinct(p.model)) from product as p 
inner join  pc 
on p.model=pc.model 
group by p.maker 

select p.maker,count(p.model) from product as p 
inner join  pc 
on p.model=pc.model 
group by p.maker 


select p.maker,count(p.model) from product as p 
inner join  pc 
on p.model=pc.model 
group by p.maker having count(p.model)>=3



Select maker, count(maker) from Product where type='PC' group by maker having count(maker)>=3
