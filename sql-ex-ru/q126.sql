/*

Exercise: 126 (Serge I: 2015-04-17)

For passengers sequence ordered over id_psg, define ones who has done maximum number of flights.

Define also those who was in this sequence directly before and after him.

For the first passenger in a sequence, the previous passenger is the last one, and for the last passenger in a sequence, 
the next passenger is the first one.
For each passenger matching the conditions, output must be: his name, name of previous passenger, and name of next passenger.

*/


select count) from (select count(*)as count,ID_psg from Pass_in_trip group by ID_psg) a
