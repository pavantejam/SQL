/*

Exercise: 29 (Serge I: 2003-02-14)
Under the assumption that receipts of money (inc) and payouts (out)
 are registered not more than once a day for each collection point 
 [i.e. the primary key consists of (point, date)], 
 write a query displaying cash flow data (point, date, income, expense). 
Use Income_o and Outcome_o tables.

*/

select coalesce(Income_o.point,outcome_o.point),coalesce(Income_o.date,outcome_o.date),Income_o.inc, Outcome_o.out from Income_o full join Outcome_o on Income_o.date=Outcome_o.date and Income_o.point=Outcome_o.point

select a.point,a.date,a.inc,b.out from income_o a left join outcome_o b  on a.point=b.point and a.date=b.date
union
select b.point,b.date,a.inc,b.out from income_o a right join outcome_o b  on a.point=b.point and a.date=b.date
