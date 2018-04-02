/*

Exercise: 76 (Serge I: 2003-08-28)

Find the overall flight duration for passengers who never occupied the same seat. 
Result set: passenger name, flight duration in minutes.

*/

select Passenger.name,sum(case when DATEDIFF(mi,time_out,time_in)<0 then 24*60+DATEDIFF(mi,time_out,time_in) else DATEDIFF(mi,time_out,time_in) end) from (
select ID_psg from Pass_in_trip 
group by ID_psg having count(*)=count(distinct(place))) a
inner join Passenger
on a.ID_psg=Passenger.ID_psg
inner join Pass_in_trip
on Pass_in_trip.ID_psg=a.ID_psg
inner join Trip
on trip.trip_no=Pass_in_trip.trip_no 
group BY A.ID_psg,Passenger.name	

