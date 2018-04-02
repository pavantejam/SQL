/*

Exercise: 81 (Serge I: 2011-11-25)

For each month-year combination with the maximum sum of payments (out), retrieve all records from the Outcome table.

*/
with cte_month_year_sum(month,year,sum) as (
select month(date) month,year(date) year ,sum(out) sum from outcome group by month(date),year(date)),
cte_max_month_year(month,year) as(
select MONTH,YEAR from cte_month_year_sum where sum=(select max(sum) from cte_month_year_sum))
(select code,point,date,out from Outcome inner join cte_max_month_year on cte_max_month_year.month=month(date) and cte_max_month_year.year=year(date) )
