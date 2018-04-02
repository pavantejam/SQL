/*

Exercise: 108 (Baser: 2013-10-16)

Restoration of the exhibits in the Department "Triangles" of the museum PFAS 
conducted according to technical requirements. 
For each record in the table utb painters tinted the side of any figure 
if its side length equals to b_vol.
Find all-side colored triangles, 
except the equilateral, 
isosceles and obtuse ones. 
For each triangle (but without repetitions) output 
three values X, Y, Z , where X - small, Y – intermediate and Z - the large side.

*/

select * from
(select distinct(a) a,b b,c c from 
(select distinct(convert(int,b_vol)) a from utb)a
cross join
(select distinct(convert(int,b_vol)) b from utb)b
cross join
(select distinct(convert(int,b_vol)) c from utb)c
)  setr
where a+b>c and b+c>a and a+c>b
and (a!=b and b!=c and c!=a)
and a*a+b*b>c*c
and c*c+b*b>a*a 
and a*a+c*c>b*b
and b>a 
and c>b
order by a


