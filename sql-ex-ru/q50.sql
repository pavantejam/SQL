/*

Exercise: 50 (Serge I: 2002-11-05)
Find the battles in which Kongo-class ships from the Ships table were engaged.

*/

select distinct(battle) from outcomes left join ships on outcomes.ship=Ships.name where class='kongo'