/*

Exercise: 107 (VIG: 2003-09-01)

Find the company, trip number, and trip date for the fifth passenger 
from among those who have departed from Rostov in April 2003.
Note. For this exercise it is assumed two flights can’t depart 
from Rostov simultaneously.

*/

select name, trip_no, DATE from 
(
select company.name,date,trip.trip_no,ROW_NUMBER() over( order by date,pass_in_trip.trip_no) row_num from Pass_in_trip 
inner join Passenger
on Pass_in_trip.ID_psg=Passenger.ID_psg
inner join Trip
on trip.trip_no= Pass_in_trip.trip_no
inner join Company
on Company.ID_comp=trip.ID_comp
where town_from='Rostov' and month(date)=4 and YEAR(date)=2003 
) d
where row_num=5
