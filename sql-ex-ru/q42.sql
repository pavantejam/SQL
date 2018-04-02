/*
Exercise: 42 (Serge I: 2002-11-05)
Find the names of ships sunk at battles, along with the names of the corresponding battles.
*/
select ship,name from Battles inner join outcomes on Outcomes.battle=Battles.name where result='sunk'