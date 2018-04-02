/*

Exercise: 91 (Serge I: 2015-03-20)

Determine the average quantity of paint per square 
with an accuracy of two decimal places.

*/
select case when num !=0 then convert(decimal(10,2),(sum/num)) else convert(decimal(10,2),0) end from 
(select  coalesce(convert(float,sum(b_vol)),0) sum from utB) a
inner join 
(select convert(float,count(Q_ID)) num from utQ) b
on 1=1
