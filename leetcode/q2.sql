/*

The Employee table holds all employees. The employee table has three columns: Employee Id, Company Name, and Salary.

+-----+------------+--------+
|Id   | Company    | Salary |
+-----+------------+--------+
|1    | A          | 2341   |
|2    | A          | 341    |
|3    | A          | 15     |
|4    | A          | 15314  |
|5    | A          | 451    |
|6    | A          | 513    |
|7    | B          | 15     |
|8    | B          | 13     |
|9    | B          | 1154   |
|10   | B          | 1345   |
|11   | B          | 1221   |
|12   | B          | 234    |
|13   | C          | 2345   |
|14   | C          | 2645   |
|15   | C          | 2645   |
|16   | C          | 2652   |
|17   | C          | 65     |
+-----+------------+--------+
Write a SQL query to find the median salary of each company. Bonus points if you can solve it without using any built-in SQL functions.

+-----+------------+--------+
|Id   | Company    | Salary |
+-----+------------+--------+
|5    | A          | 451    |
|6    | A          | 513    |
|12   | B          | 234    |
|9    | B          | 1154   |
|14   | C          | 2645   |
+-----+------------+--------+


*/
select count(*) AS TCNT,COMPANY from employee group by company

select *, (select count(*) from employee e1 where e1.salary>=e2.salary and e1.company=e2.company) AS CNT from employee e2 

SELECT * FROM 
(select company,salary, (select count(*) from employee e1 where e1.salary>=e2.salary and e1.company=e2.company) AS CNT from employee e2 ) E3
inner join 
(select count(*) AS TCNT,COMPANY from employee group by company ) E4
 ON E3.company=E4.company
 where e3.CNT = case when (TCNT)%2=0 then ((e4.TCNT)/2)
					when (TCNT)%2!=0 then ((e4.TCNT+1)/2)end
 

