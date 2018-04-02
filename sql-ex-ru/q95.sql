/*

Exercise: 95 (qwrqwr: 2013-02-08)

Using the Pass_in_Trip table, calculate for each airline:
1) the number of performed flights;
2) the number of plane types used;
3) the number of different passengers that have been transported;
4) the total number of passengers that have been transported by the company.
Output: airline name, 1), 2), 3), 4).

*/

select companyname,count_trips,count_dist_plane,count_dist_pass,count_pass from (
select	MAX(COMPANY.name) companyname,
		count(distinct(trip.plane)) count_dist_plane,
		count(distinct(Pass_in_trip.ID_psg)) count_dist_pass,
		count(Pass_in_trip.ID_psg) count_pass,
		Company.ID_comp 
		from Pass_in_trip
inner join Passenger
on Pass_in_trip.ID_psg=Passenger.ID_psg
inner join trip 
on trip.trip_no=Pass_in_trip.trip_no
inner join	Company
on Company.ID_comp=trip.ID_comp
group by Company.ID_comp)a
inner join
(
select company.ID_comp,count(c.trip_no) count_trips
from (select trip_no,date from Pass_in_trip group by trip_no,date) c
inner join trip 
on trip.trip_no=c.trip_no
inner join	Company
on Company.ID_comp=trip.ID_comp
group by Company.ID_comp) b 
on a.ID_comp=b.ID_comp 





