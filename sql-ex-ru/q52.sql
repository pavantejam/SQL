/*

Exercise: 52 (qwrqwr: 2010-04-23)
Determine the names of all ships in the Ships table 
that can be a Japanese battleship having at least nine main guns with a caliber of less than 19 inches 
and a displacement of not more than 65 000 tons.

*/

select name from ships inner join classes on classes.class=Ships.class where (country like 'Japan' or country is null) and (type='bb' or type is null) and (numGuns>=9 or numGuns is null) and (bore<19 or bore is null) and (displacement<=65000 or displacement is null)