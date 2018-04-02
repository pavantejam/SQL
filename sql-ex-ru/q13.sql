select avg(speed) from PC where model in (select model from product where maker ='A')
Select avg(b.speed) from product a join pc b on a.model=b.model where a.maker='A'

