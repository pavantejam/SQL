/*


Exercise: 79 (Serge I: 2003-04-29)

Get the passengers who, compared to others, spent most time flying. 
Result set: passenger name, total flight duration in minutes.

*/

with cte_name_time(name,time_flown) as(
select Passenger.name,sum(case when DATEDIFF(mi,time_out,time_in)<0 then 24*60+DATEDIFF(mi,time_out,time_in) else DATEDIFF(mi,time_out,time_in) end) time_flown from  Passenger
inner join Pass_in_trip
on Pass_in_trip.ID_psg=Passenger.ID_psg
inner join Trip
on trip.trip_no=Pass_in_trip.trip_no 
group BY Passenger.ID_psg,Passenger.name)
(select name,time_flown from cte_name_time where time_flown=(select max(time_flown) from cte_name_time)
)
