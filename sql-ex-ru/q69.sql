/*


Exercise: 69 (Serge I: 2011-01-06)

Using the Income and Outcome tables, find out the balance for each buy-back center by the end of each day when funds were received or payments were made. 
Note that the cash isn’t withdrawn, and the unspent balance/debt is carried forward to the next day.
Result set: buy-back center ID (point), date in dd/mm/yyyy format, unspent balance/debt by the end of this day.

*/

select point,format(cast(date as date),'dd/MM/yyyy') date,sum(distinct(moneyrunning)) from
(
select *,(select sum(money) from (select *,inc money from income union
select *,-out money from outcome) b where b.point=a.point and a.date>=b.date) moneyrunning from
(select *, inc money from income union
select *,-out money from outcome) a
) c
group by point,date
order by point,date
