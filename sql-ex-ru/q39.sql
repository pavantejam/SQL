/*

Exercise: 39 (Serge I: 2003-02-14)
Find the ships that `survived for future battles`; 
that is, after being damaged in a battle, they participated in another one, which occurred later.

*/
select distinct(a.ship) from (select ship,date,result from Outcomes  inner join Battles on Outcomes.battle=battles.name) a inner join  (select ship,date,result from Outcomes  inner join Battles on Outcomes.battle=battles.name) b on a.ship=b.ship and a.date>b.date where b.result='damaged'
