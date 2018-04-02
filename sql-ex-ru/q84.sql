/*

Exercise: 84 (Serge I: 2003-06-05)

For each airline, calculate the number of passengers carried in April 2003 
(if there were any) by ten-day periods. 

Consider only flights that departed that month.
Result set: company name, number of passengers carried for each ten-day period.

*/
select name,sum(num1),sum(num2),sum(num3) from (
select Company.ID_comp,name,pass_in_trip.trip_no,date,case when day(date)<=10 then 1 else 0 end num1,case when (day(date)>10 and day(date)<=20) then 1 else 0 end num2,case when day(date)>20 then 1 else 0 end num3 from Company 
inner join Trip
on Company.ID_comp=trip.ID_comp
inner join Pass_in_trip
on Pass_in_trip.trip_no=trip.trip_no
where MONTH(date)=4 and year(date)=2003) a 
group by a.ID_comp,a.name



