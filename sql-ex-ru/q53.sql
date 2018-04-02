/*

Exercise: 53 (Serge I: 2002-11-05)
With a precision of two decimal places, determine the average number of guns for the battleship classes.

*/
select cast(round(avg(b.a),2) as decimal(5,2)) from (select cast(avg(numguns) as float) as a from Classes where type='bb' group by class)b
