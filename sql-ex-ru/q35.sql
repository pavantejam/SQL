/*

Exercise: 35 (qwrqwr: 2012-11-23)
Find models in the Product table consisting either of digits only or Latin letters (A-Z, case insensitive) only.
Result set: model, type.

*/
--first is worng as it is the super set where any character can be present 
select model, type from product where model like '%[A-Za-z]%' or model like '%[0-9]%'

Select model, type from product where model not like '%[^A-Za-z]%' or model not like '%[^0-9]%'
