/*1.Find the names of aircraft such that all pilots certified to operate them have salaries more than $80,000. */
select distinct a.aname from employees e
inner join
certified c
on c.eid = e.eid
inner join
aircraft a
on
a.aid = c.aid
where e.salary > 80000
order by a.aname;



/*2.Find the names of employees whose salary is less than the price of the cheapest route from Bangalore to Frankfurt. */
select ename from employees where salary < (select min(price) from flight where origin = 'Bangalore' 
and destination = 'Frankfurt') order by ename;



/*3.For all aircraft with cruising range over 1,000 miles,
find the name of the aircraft and the average salary of all pilots certified for this aircraft.*/
select a.aname, avg(e.salary) as avg_salary from employees e
inner join
certified c
on e.eid = c.eid
inner join
aircraft a
on
a.aid = c.aid
where a.cruisingrange > 1000
group by a.aname;



/*4.Identify the routes that can be piloted by every pilot who makes more than $70,000.
(In other words, find the routes with distance less than the least cruising range of aircrafts driven by pilots who make more than $70,000) */
select * from flight where distance < (select min(a.cruisingrange) from employees e
inner join
certified c
on c.eid = e.eid
inner join
aircraft a
on
a.aid = c.aid
where e.salary > 70000);



/*5. Print the names of pilots who can operate planes with cruising range greater than 3,000 miles 
but are not certified on any Boeing aircraft. */
select distinct e.ename from employees e
join
certified c
on c.eid = e.eid
join
aircraft a
on a.aid = c.aid
where a.cruisingrange > 3000
and e.ename not in (select e.ename from employees e
join
certified c
on c.eid = e.eid
join
aircraft a
on a.aid = c.aid
where a.aname = 'Boeing');



/*6. Compute the difference between the average salary of a pilot and the average salary of all employees (including pilots).*/
-- select distinct e.ename, e.salary - (select avg(salary) from employees) as avg_salary from employees e
-- inner join
-- certified c
-- on c.eid = e.eid;
select avg(salary) - (select avg(salary) from employees) as diff 
from (select distinct e.eid, e.ename, salary
from employees e
inner join
certified c
on c.eid = e.eid) sub_q;



/*7. Print the name and salary of every non-pilot whose salary is more than the average salary for pilots.*/
select e.ename, e.salary from employees e
left join
certified c
on c.eid = e.eid
where c.eid is null
and e.salary > (select avg(e.salary) from employees e
inner join
certified c
on c.eid = e.eid);