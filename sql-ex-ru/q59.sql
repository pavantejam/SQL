/*
Exercise: 59 (Serge I: 2003-02-15)
Calculate the cash balance of each buy-back center for the database with money transactions being recorded not more than once a day.
Result set: point, balance.

*/

select point,sum(inc)-sum(out) from (select coalesce(Income_o.point,outcome_o.point) point,coalesce(Income_o.date,outcome_o.date) date,coalesce(inc,0) inc,coalesce(out,0) out from Income_o full join Outcome_o on Income_o.point=Outcome_o.point and Income_o.date=Outcome_o.date) a group by a.point

