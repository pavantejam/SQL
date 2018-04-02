/*

Exercise: 74 (dorin_larsen: 2007-03-23)

Get all ship classes of Russia.
If there are no Russian ship classes in the database, display classes of all countries present in the DB.
Result set: country, class.

*/

select country,class from Classes where country like case when ((select count(*) from classes where country='Russia')=0) then '%' else 'Russia' end

