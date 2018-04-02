/*

Exercise: 66 (Serge I: 2003-04-09)

For all days between 2003-04-01 and 2003-04-07 find the number of trips from Rostov. 
Result set: date, number of trips.

*/
declare @startdate datetime;
set @startdate='2003-04-01 ';
with cte_rownum(date) as(select dateadd(day,row_number() over(order by (trip_no) asc)-1,@startdate) as rownum from Pass_in_trip)(
select cte_rownum.date,coalesce(count,0) from (
select date,count(distinct(trip.trip_no)) count from Trip  
inner join 
Pass_in_trip 
on Pass_in_trip.trip_no=trip.trip_no
where town_from='Rostov' 
and date>='2003-04-01'
and date<='2003-04-07'
group by date
)a
right join 
(select distinct(date) from Pass_in_trip where date>='2003-04-01'
and date<='2003-04-07') b
on a.date=b.date
right join 
cte_rownum on cte_rownum.date=a.date
where cte_rownum.date<='2003-04-07');


--if we can't declare a variable using a recursive cte

WITH Dates AS (
        SELECT
         [Date] = CONVERT(DATETIME,'2003-04-01')
        UNION ALL SELECT
         [Date] = DATEADD(DAY, 1, [Date])
        FROM
         Dates
        WHERE
         Date < '2003-04-07'
)(
select Dates.date,coalesce(count,0) from (
select date,count(distinct(trip.trip_no)) count from Trip  
inner join 
Pass_in_trip 
on Pass_in_trip.trip_no=trip.trip_no
where town_from='Rostov' 
and date>='2003-04-01'
and date<='2003-04-07'
group by date
)a
right join 
(select distinct(date) from Pass_in_trip where date>='2003-04-01'
and date<='2003-04-07') b
on a.date=b.date
right join 
dates on Dates.date=a.date
where Dates.date<='2003-04-07');