/*

Exercise: 93 (Serge I: 2003-06-05)

For each airline that transported passengers 
calculate the total flight duration of its planes. 
Result set: company name, duration in minutes.

*/

select Company.name,sum(case when DATEDIFF(mi,time_out,time_in)<0 then 24*60+DATEDIFF(mi,time_out,time_in) else DATEDIFF(mi,time_out,time_in) end) 
from (select trip_no,date from Pass_in_trip group by trip_no,date) pass_in_Trip1
inner join trip 
on trip.trip_no=pass_in_Trip1.trip_no
inner join	Company
on Company.ID_comp=trip.ID_comp
group by Trip.ID_comp,company.name

select *,case when DATEDIFF(mi,time_out,time_in)<0 then 24*60+DATEDIFF(mi,time_out,time_in) else DATEDIFF(mi,time_out,time_in) end from (select trip_no,ID_psg,date from Pass_in_trip group by trip_no,date,ID_psg) pass_in_Trip1
inner join Passenger
on pass_in_Trip1.ID_psg=Passenger.ID_psg
inner join trip 
on trip.trip_no=pass_in_Trip1.trip_no
inner join	Company
on Company.ID_comp=trip.ID_comp
where Trip.ID_comp=3
order by trip.ID_comp,Company.name



select trip_no,date,count(ID_psg) from Pass_in_trip group by trip_no,date
