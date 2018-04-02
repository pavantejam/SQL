/*

Exercise: 78 (Serge I: 2005-01-19)

For each battle, get the first and the last day of the month when the battle occurred.
Result set: battle name, first day of the month, last day of the month.

*/

select name,convert(date,DATEFROMPARTS(year(date),month(date),1)), CONVERT(date,EOMONTH(date)) from Battles


