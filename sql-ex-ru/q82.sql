/*

Exercise: 82 (Serge I: 2011-10-08)

Assuming the PC table is sorted by code in ascending order, 
find the average price for each group of six consecutive personal computers. 
Result set: the first code value in a set of six records, average price for the respective set.

*/

select min(code),avg_set_price from (
select *,(select count(*) from pc a where a.code<pc.code)/6 set_number, avg(price) over(partition by (select count(*) from pc a where a.code<pc.code)/6) avg_set_price from pc  
)a 
group by set_number,avg_set_price



select *,(select avg(price) from (select *, ROW_NUMBER() over(order by code) as rownum from PC) b where b.rownum>=a.rownum and b.rownum-a.rownum<6 ), from  
(select *, ROW_NUMBER() over(order by code) as rownum from PC) a

