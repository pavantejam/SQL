/*

Exercise: 96 (ZrenBy: 2003-09-01)

Considering only red spray cans used more than once, 
get those that painted squares currently 
having a non-zero blue component.
Result set: spray can name

*/

select V_NAME from utv inner join 
(select B_V_ID from utb group by B_V_ID having count(*)>1)a
on utv.V_ID=a.B_V_ID
where V_COLOR='R'
and B_V_ID in (

select B_V_ID from utb inner join (
select B_Q_ID from utb inner join utv on utv.V_ID=utB.B_V_ID
where V_COLOR='B' and B_VOL>0
group by B_Q_ID)b
on utb.B_Q_Id=b.B_Q_ID
group by B_V_ID
) 
