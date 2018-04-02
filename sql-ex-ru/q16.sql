/*
Exercise: 16 (Serge I: 2003-02-03)
Get pairs of PC models with identical speeds and the same RAM capacity. Each resulting pair should be displayed only once, i.e. (i, j) but not (j, i). 
Result set: model with the bigger number, model with the smaller number, speed, and RAM.
*/


select distinct(pc1.model),pc2.model,pc1.speed,pc1.ram from pc as pc1 inner join pc as pc2  on pc1.speed=pc2.speed and pc1.ram=pc2.ram and pc1.model>pc2.model

select pc1.model,pc2.model,max(pc1.speed),max(pc1.ram) from pc as pc1
inner join pc as pc2
on pc1.speed=pc2.speed
and  pc1.ram=pc2.ram
group by pc1.model,pc2.model
having pc1.model>pc2.model
