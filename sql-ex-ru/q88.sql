/*

Exercise: 88 (Serge I: 2003-04-29)

Among those flying with a single airline find the names of 
different passengers who have flown most often. 
Result set: passenger name, number of trips, and airline name.

*/
with cte_pass_single_airline(name,count,companyname) as(
select Passenger.name,COUNT(*) count,MAX(COMPANY.name) companyname from Pass_in_trip
inner join Passenger
on Pass_in_trip.ID_psg=Passenger.ID_psg
inner join trip 
on trip.trip_no=Pass_in_trip.trip_no
inner join	Company
on Company.ID_comp=trip.ID_comp
group by Pass_in_trip.ID_psg,Passenger.name
having count(DISTINCT(COMPANY.ID_comp))=1 
)
(select * from cte_pass_single_airline
where count=(select max(count) from cte_pass_single_airline))


