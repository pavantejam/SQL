/*

Exercise: 77 (Serge I: 2003-04-09)

Find the days with the maximum number of flights departed from Rostov. Result set: number of trips, date.

*/
with cte_date_count(date,count) as (
select (CONVERT(date,date)) date,count(*) count from (select distinct(Pass_in_trip.trip_no),date from Trip 
inner join Pass_in_trip
on trip.trip_no= Pass_in_trip.trip_no
where town_from='Rostov')a group by (CONVERT(date,date)))
(select count,convert(datetime,date) from cte_date_count where count = (select max(count) from cte_date_count))



select * from Trip 
inner join Pass_in_trip
on trip.trip_no= Pass_in_trip.trip_no
where town_from='Rostov'
order by date


select (CONVERT(date,date)) date,count(*) count from (select Pass_in_trip.trip_no,date from Trip 
inner join Pass_in_trip
on trip.trip_no= Pass_in_trip.trip_no
where town_from='Rostov')a group by (CONVERT(date,date))
