/*

Exercise: 104 (Serge I: 2013-07-19)

For each cruiser class whose quantity of guns is known, 
number its guns sequentially beginning with 1.
Output: class name, gun ordinal number in 'bc-N' style.

*/


with digit as (
    select 0 as d union all 
    select 1 union all select 2 union all select 3 union all
    select 4 union all select 5 union all select 6 union all
    select 7 union all select 8 union all select 9        
),
seq as (
    select a.d + (10 * b.d) + (100 * c.d) + (1000 * d.d) as num
    from digit a
        cross join
        digit b
        cross join
        digit c
        cross join
        digit d        
),
cte_seq(num) as(
select num from seq 
where num< (select max(numguns) from Classes)
)
(select class, type+'-'+convert(nvarchar(4),num+1)  from (SELECT CLASS,numGuns,type FROM CLASSES WHERE type='BC' AND numGuns IS NOT NULL) a
inner join 
cte_seq 
on num<numGuns

)
;