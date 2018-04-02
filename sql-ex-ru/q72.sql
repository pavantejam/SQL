/*

Exercise: 72 (Serge I: 2003-04-29)

Among the customers using a single airline, 
find distinct passengers who have flown most frequently. 
Result set: passenger name, number of trips.

*/
with cte_pass(name,trip_no) as(
select Passenger.name,COUNT(*) trip_no from passenger
inner join Pass_in_trip 
on Passenger.ID_psg=Pass_in_trip.ID_psg
inner join Trip 
on Trip.trip_no=Pass_in_trip.trip_no
inner join Company 
on company.ID_comp=Trip.ID_comp
group by pass_in_trip.ID_psg,Passenger.name
having count(distinct(company.ID_comp))=1)
(
select distinct(name),trip_no from cte_pass where trip_no=(select max(Trip_no) from cte_pass))

