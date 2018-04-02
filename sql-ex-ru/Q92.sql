/*

Exercise: 92 (ZrenBy: 2003-09-01)

Get all white squares that have been painted only with spray cans empty at present. 
Output the square names.

*/
select q_name from utq where q_ID in (
select B_Q_ID from utb 
where B_Q_ID in (select B_Q_ID from utb group by B_Q_ID having sum(B_VOL)=765)
	and B_V_ID in (select b_v_ID from utb group by B_V_ID having sum(b_vol)=255)
group by B_Q_ID
except
select B_Q_ID from utb 
where B_Q_ID in (select B_Q_ID from utb group by B_Q_ID having sum(B_VOL)=765)
	and B_V_ID not in (select b_v_ID from utb group by B_V_ID having sum(b_vol)=255)
group by B_Q_ID)