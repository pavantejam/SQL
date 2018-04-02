/*Exercise: 142 (Serge I: 2003-08-28)
Among the passengers who only flew by the planes of the same model, 
find names of those who arrived at the same town at least twice.
*/

select distinct(passenger.name) from passenger inner join 
(select pit.ID_psg from Pass_in_trip as pit inner join trip on trip.trip_no =pit.trip_no
group by pit.ID_psg having count(distinct(trip.plane))=1) as pass on Passenger.ID_psg=[pass].ID_psg
inner join Pass_in_trip on Pass_in_trip.ID_psg=Passenger.ID_psg
inner join Trip on Pass_in_trip.trip_no=Trip.trip_no  group by passenger.name, trip.town_to 
having count(*)>=2