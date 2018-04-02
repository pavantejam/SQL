/*

Exercise: 105 (qwrqwr: 2013-09-11)

Statisticians Alice, Betty, Carol and Diana are numbering rows 
in the Product table.
Initially, all of them have sorted the table rows in ascending order 
by the names of the makers.


Alice assigns a new number to each row, 
sorting the rows belonging to the same maker by model 
in ascending order.

The other three statisticians assign identical numbers to all rows 
having the same maker.


Betty assigns the numbers starting with one, 
increasing the number by 1 for each next maker.


Carol gives a maker the same number the row with this maker's first model 
receives from Alice.


Diana assigns a maker the same number the row with this maker's last model 
receives from Alice.

Output: maker, model, row numbers assigned by Alice, Betty, Carol, and Diana respectively.

*/

with cte_alice(maker,model,num) as
(
select maker,model,row_number() over (order by maker,model) num  
from Product
)
(select	alice.maker,
		alice.model,
		alice.num,
		b.num,
		(select min(num) from cte_alice as carol where carol.maker=alice.maker group by maker) carol_num,
		(select max(num) from cte_alice as diana where diana.maker=alice.maker group by maker) diana_num
	from cte_alice as alice
inner join 
(select maker,row_number() over (order by maker) num from   
(select maker from Product group by maker)a ) b
on b.maker=alice.maker
)


