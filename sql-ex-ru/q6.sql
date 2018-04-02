/*
For each maker producing laptops with a hard drive capacity of 10 Gb or higher,
find the speed of such laptops. Result set: maker, speed.

*/
select distinct(a.maker),b.speed from product a join laptop b on a.model=b.model where b.hd>=10
