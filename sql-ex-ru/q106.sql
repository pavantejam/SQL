/*

Exercise: 101 (qwrqwr: 2013-03-29)

The Printer table is sorted by the code field in ascending order.
The ordered rows form groups: the first group starts with the first row,
Each row having color=’n’ begins a new group, the groups of rows don’t overlap.
 
For each group, determine the maximum value of the model field (max_model), 
the number of unique printer types (distinct_types_cou), 
and the average price (avg_price).
For all table rows, 
display code, 
model,
color,
type, 
price, 
max_model, 
distinct_types_cou, 
avg_price.

*/
select code,model,color,type,price,mx_model,distinct_types_cou,avg_price from 
(
select *,DENSE_RANK() over (order by (select max(code)from printer a where a.code<=b.code and a.color='n')) group_cal from printer b
)d
inner join
(select max(model) mx_model,count(distinct(type)) distinct_types_cou,avg(price) avg_price, group_cal from (
select *,DENSE_RANK() over (order by (select max(code)from printer a where a.code<=b.code and a.color='n')) group_cal from printer b
) c
group by group_cal) e
on d.group_cal=e.group_cal

