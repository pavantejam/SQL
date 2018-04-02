/*

Exercise: 103 (qwrqwr: 2013-05-17)

Find out the three smallest and three greatest trip numbers. 
Output them in a single row with six columns, 
ordered from the least trip number to the greatest one. 
Note: it is assumed the Trip table contains 6 or more row

*/
select	max(aa),
		max(ab),
		max(ac),
		max(ad),
		max(ae),
		max(af)
from(
select	case when row_num=1 then trip_no else null end aa,
		case when row_num=2 then trip_no else null end ab,
		case when row_num=3 then trip_no else null end ac,
		case when row_num=4 then trip_no else null end ad,
		case when row_num=5 then trip_no else null end ae,
		case when row_num=6 then trip_no else null end af
from (
select *,ROW_NUMBER() over (order by (trip_no)) as row_num from (
(select top(3) trip_no from Trip order by trip_no asc) 
union
(select top(3) trip_no from Trip order by trip_no desc)
) a
)b
)c

