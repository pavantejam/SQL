/*

Find out the names of the ships in the Ships table that meet at least four criteria from the following list:
numGuns = 8, 
bore = 15,
displacement = 32000,
type = bb,
launched = 1915,
class = Kongo,
country = USA.

*/
select name from (
select name,	(case when numGuns = 8 then 1 else 0 end +
			case when bore = 15 then 1 else 0 end+
			case when displacement = 32000 then 1 else 0 end +
			case when type = 'bb' then 1 else 0 end +
			case when launched = 1915 then 1 else 0 end+
			case when ships.class = 'Kongo' then 1 else 0 end+
			case when country = 'USA' then 1 else 0 end)  num_cond from Ships inner join Classes on Ships.class=Classes.class) a
where a.num_cond >=4