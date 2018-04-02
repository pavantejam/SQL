/*

Exercise: 87 (Serge I: 2003-08-28)

Supposing a passenger lives in the town his first flight departs from, find non-Muscovites who have visited Moscow more than once. 
Result set: passenger's name, number of visits to Moscow.

*/

with cte_trip_pit(	trip_no,
					date,
					ID_psg,
					town_from,
					town_to,
					name,
					num) as (
select	A.trip_no,
		date, 
		a.ID_psg,
		town_from,
		town_to,
		name,
		num
	from (select *,ROW_NUMBER() over (partition by id_psg order by id_psg,date) as num from Pass_in_trip) a 
	inner join trip 
	on a.trip_no=trip.trip_no
	inner join Passenger 
	on Passenger.ID_psg=a.ID_psg ),
	
	cte_ID_Moscovite(ID_psg,town_from,name) as (
select	ID_psg,
		town_from,
		name 
	from cte_trip_pit
	where num=1 and town_from='Moscow')
(select name,
		count(*) num
	from cte_trip_pit 
	where	ID_psg not in (select Id_psg 
							from cte_ID_Moscovite )	
			and town_to='Moscow' 
	group by ID_psg,name
	having count(*)>=2
);




WITH moscows AS (SELECT DISTINCT pip.id_psg
FROM pass_in_trip pip
WHERE
 (SELECT TOP 1 t2.town_from
  FROM trip t2, pass_in_trip pip2
  WHERE pip.id_psg = pip2.id_psg
  AND pip2.trip_no = t2.trip_no
  ORDER BY pip2.date, t2.time_out) = 'moscow')

, ans AS (
SELECT pip.id_psg, COUNT(1) cnt
FROM pass_in_trip pip, trip t
WHERE pip.trip_no = t.trip_no
AND t.town_to = 'moscow'
AND pip.id_psg NOT IN (SELECT * FROM moscows)
GROUP BY pip.id_psg
HAVING COUNT(1) > 1)

SELECT name, cnt
FROM ans, passenger p
WHERE ans.id_psg = p.id_psg
