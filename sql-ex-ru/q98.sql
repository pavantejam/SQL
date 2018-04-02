/*


Exercise: 98 (qwrqwr: 2010-04-26)

Display the list of PCs, 
for each of which the result of 
the bitwise OR operation performed on the binary 
representations of its respective processor speed 
and RAM capacity contains a sequence of 
at least four consecutive bits set to 1.
Result set: PC code, processor speed, RAM capacity.

*/

select *,convert(binary(1),ram,2),CONVERT(binary(1),speed,1) from PC


