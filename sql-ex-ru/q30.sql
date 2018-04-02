/*

Exercise: 30 (Serge I: 2003-02-14)
Under the assumption that receipts of money (inc) and payouts (out) can be registered
any number of times a day for each collection point 
[i.e. the code column is the primary key], display a table with one corresponding row for 
each operating date of each collection point.
Result set: point, date, total payout per day (out), total money intake per day (inc). 
Missing values are considered to be NULL.

*/


select coalesce(Income.point,outcome.point),coalesce(Income.date,outcome.date) as date, sum(Outcome.out),sum(Income.inc) from Income full join Outcome on Income.date=Outcome.date and Income.point=Outcome.point group by income.point,Outcome.point,Income.date,Outcome.date order by date


select t.point,t.date,max(t.out),max(t.inc) from 
(select * from
(select  point, date, sum(inc) as inc, null as out from income group by date, point) as i
union
select * from
(select point, date, null as inc, sum(out) as out  from outcome group by date, point) as o) t
group by t.point, t.date
order by t.point, t.date
