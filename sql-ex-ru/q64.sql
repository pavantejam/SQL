/*

Exercise: 64 (Serge I: 2010-06-04)
Using the Income and Outcome tables, 
determine for each buy-back center the days when it received funds but made no payments, and vice versa.
Result set: point, date, type of operation (inc/out), sum of money per day

*/
select coalesce(a.point,b.point),coalesce(a.date,b.date),case when inc is null then 'out' else 'inc' end,coalesce(inc,out) from 
(select point,date,sum(inc) inc from Income group by date,point) a
 full outer join 
(select point,date,sum(out) out from Outcome group by date,point) b
on a.date=b.date and a.point=b.point
where a.point is null or b.point is null