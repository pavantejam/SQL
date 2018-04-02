/*

Exercise: 33 (Serge I: 2002-11-02)
Get the ships sunk in the North Atlantic battle. 
Result set: ship.

*/
select ship from Outcomes where battle='North Atlantic' and result='sunk'
