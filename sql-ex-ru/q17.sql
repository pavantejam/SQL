/*
Exercise: 17 (Serge I: 2003-02-03)
Get the laptop models that have a speed smaller than the speed of any PC. 
Result set: type, model, speed.
*/
select distinct('Laptop') as type,model,speed from Laptop where speed<(select min(speed) from PC)

Select distinct(b.type),a.model,a.speed from laptop a join product b on a.model=b.model where speed<(select min(speed) from pc)
