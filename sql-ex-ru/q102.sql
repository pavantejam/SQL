/*

Exercise: 102 (Serge I: 2003-04-29)

Find the names of different passengers who travelled between 
two towns only (one way or back and forth)

*/
select name from Passenger where ID_psg in	(
select ID_psg from ( 
select Pass_in_trip.ID_psg,town_from,town_to
from Pass_in_trip
inner join Passenger
on Pass_in_trip.ID_psg=Passenger.ID_psg
inner join trip 
on trip.trip_no=Pass_in_trip.trip_no
group by Pass_in_trip.ID_psg,town_from,town_to) a
group by ID_psg
having count(*)<=2 
and (min(town_from) in (max(town_from),min(town_to),max(town_to)))
and (max(town_from) in (min(town_from),min(town_to),max(town_to))) 
and (min(town_to) in (max(town_from),min(town_from),max(town_to)))
and (max(town_to) in (max(town_from),min(town_to),min(town_from)))
) 

