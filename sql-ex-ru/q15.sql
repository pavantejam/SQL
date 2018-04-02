/*
Get hard drive capacities that are identical for two or more PCs. 
Result set: hd.
*/

select hd from pc group by hd having count(*)>=2