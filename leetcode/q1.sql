/*

Given two tables as below, write a query to display the comparison result (higher/lower/same) of the average salary of employees in a department to the company's average salary.
Table: salary
| id | employee_id | amount | pay_date   |
|----|-------------|--------|------------|
| 1  | 1           | 9000   | 2017-03-31 |
| 2  | 2           | 6000   | 2017-03-31 |
| 3  | 3           | 10000  | 2017-03-31 |
| 4  | 1           | 7000   | 2017-02-28 |
| 5  | 2           | 6000   | 2017-02-28 |
| 6  | 3           | 8000   | 2017-02-28 |
The employee_id column refers to the employee_id in the following table employee.
| employee_id | department_id |
|-------------|---------------|
| 1           | 1             |
| 2           | 2             |
| 3           | 2             |
So for the sample data above, the result is:
| pay_month | department_id | comparison  |
|-----------|---------------|-------------|
| 2017-03   | 1             | higher      |
| 2017-03   | 2             | lower       |
| 2017-02   | 1             | same        |
| 2017-02   | 2             | same        |
Explanation
In March, the company's average salary is (9000+6000+10000)/3 = 8333.33...
The average salary for department '1' is 9000, which is the salary of employee_id '1' since there is only one employee in this department. So the comparison result is 'higher' since 9000 > 8333.33 obviously.
The average salary of department '2' is (6000 + 10000)/2 = 8000, which is the average of employee_id '2' and '3'. So the comparison result is 'lower' since 8000 < 8333.33.
With he same formula for the average salary comparison in February, the result is 'same' since both the department '1' and '2' have the same average salary with the company, which is 7000.


*/
select c.date pay_month,department_id,CASE WHEN dept_avg<total_avg THEN 'lower' when dept_avg>total_avg then 'higher' else 'same'end as comparision from (select avg(a.amount) dept_avg,(cast(year(a.pay_date) as varchar(4))+'-'+cast(month(a.pay_date) as varchar(2))) date, department_id from (select employee.employee_id,amount,pay_date,department_id from salary inner join employee on employee.employee_id=salary.employee_id) a  group by a.department_id,(cast(year(a.pay_date) as varchar(4))+'-'+cast(month(a.pay_date) as varchar(2))) ) c
inner join 
( select avg(b.amount) total_avg,(cast(year(b.pay_date) as varchar(4))+'-'+cast(month(b.pay_date) as varchar(2))) date from (select employee.employee_id,amount,pay_date,department_id from salary inner join employee on employee.employee_id=salary.employee_id) b  group by  (cast(year(b.pay_date) as varchar(4))+'-'+cast(month(b.pay_date) as varchar(2))) ) d
on c.date=d.date

select avg(a.amount) dept_avg,(cast(year(a.pay_date) as varchar(4))+'-'+cast(month(a.pay_date) as varchar(2))) date,department_id from (select employee.employee_id,amount,pay_date,department_id from salary inner join employee on employee.employee_id=salary.employee_id) a  group by a.department_id,(cast(year(a.pay_date) as varchar(4))+'-'+cast(month(a.pay_date) as varchar(2)))

select avg(b.amount) total_avg,(cast(year(b.pay_date) as varchar(4))+'-'+cast(month(b.pay_date) as varchar(2))) date from (select employee.employee_id,amount,pay_date,department_id from salary inner join employee on employee.employee_id=salary.employee_id) b  group by  (cast(year(b.pay_date) as varchar(4))+'-'+cast(month(b.pay_date) as varchar(2)))  
