/*

Exercise: 63 (Serge I: 2003-04-08)
Find the names of different passengers that ever travelled more than once occupying seats with the same number.

*/
select name from Passenger where ID_psg in (
select distinct(pit1.ID_psg) 
from Pass_in_trip pit1 
inner join 
Pass_in_trip pit2 
on pit1.ID_psg=pit2.ID_psg and substring(pit1.place,1,9)=substring(pit2.place,1,9) and ((pit1.date!=pit2.date) or (pit1.trip_no!=pit2.trip_no)))

