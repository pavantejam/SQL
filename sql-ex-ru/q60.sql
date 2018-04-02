/*
Exercise: 60 (Serge I: 2003-02-15)
For the database with money transactions being recorded not more than once a day, 
calculate the cash balance of each buy-back center at the beginning of 4/15/2001. 
Note: exclude centers not having any records before the specified date.
Result set: point, balance

*/

select point,sum(inc)-sum(out) from (

select coalesce(Income1.point,outcome1.point) point,
		coalesce(Income1.date,outcome1.date) date,
		coalesce(inc,0) inc,
		coalesce(out,0) out 
from 
	(select point,date,SUM(INC) INC from Income_o group by POINT,date) income1 
full join 
	(select point,date,SUM(out) out from Outcome_o group by POINT,date) outcome1
on Income1.point=Outcome1.point and Income1.date=Outcome1.date ) a
group by point

