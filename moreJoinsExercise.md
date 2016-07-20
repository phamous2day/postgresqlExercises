# Projects DB Exercises

## Setup

Create a new database called projects_db or whatever you want. Restore the database from the projects.sql file via the command:

psql projects_db < projects.sql

## Problems

* Do a cartesian join between the project table and the tech table
select
  project.name, tech.id
from
  project, tech;



* Perform a left outer join between the project table and the project_uses_tech tables
SELECT * FROM
  project left outer join project_uses_tech on project.id = project_uses_tech.project_id;




* Perform a left outer join between the tech table and the project_uses_tech table
SELECT * FROM tech left outer join project_uses_tech on tech.id = project_uses_tech.project_id;



* Perform a left outer join from the project table to the project_users_tech table and then left outer join again to the tech table.

SELECT * FROM
  project left outer join project_uses_tech on project.id = project_uses_tech.project_id left outer join tech on tech.id = project_uses_tech.tech_id;






* Start from the answer on the previous problem and get the count of how many different tech each project uses
SELECT
project.id,
  project.name,
  sum(case when tech.name is NULL then 0 else 1 end) as tech_count
FROM
    project
left outer join
  project_uses_tech on project.id = project_uses_tech.project_id
left outer join
  tech on tech.id = project_uses_tech.tech_id
  group by
  project.id;






* For each tech, get the count of how many projects use it
SELECT
tech.id,
  tech.name,
  sum(case when project.name is NULL then 0 else 1 end) as project_count,
  count(tech.id) as otherway_to_count
FROM
    tech
left outer join
  project_uses_tech on tech.id = project_uses_tech.tech_id
left outer join
  project on project.id = project_uses_tech.project_id
  group by
  tech.id;




* Rank each project by how many tech it uses
SELECT
project.id,
  project.name,
  sum(case when tech.name is NULL then 0 else 1 end) as tech_count

FROM
    project
left outer join
  project_uses_tech on project.id = project_uses_tech.project_id
left outer join
  tech on tech.id = project_uses_tech.tech_id
  group by
  project.id
  order by
tech_count desc;



* Rank each tech by how many projects use it
SELECT
tech.id,
  tech.name,
  sum(case when project.name is NULL then 0 else 1 end) as project_count
FROM
    tech
left outer join
  project_uses_tech on tech.id = project_uses_tech.tech_id
left outer join
  project on project.id = project_uses_tech.project_id
  group by
  tech.id
  order by
  tech.name desc
  limit 5;



* What is the average number of techs used by a project?
select
	avg(tech_count) as average_techs_used
from
	(select
		project.id,
		project.name,
		sum(case when tech.id is NULL then 0 else 1 end) as tech_count,
		count(tech.id) as tech_count
	from
		project
	left outer join
		project_uses_tech on project.id = project_uses_tech.project_id
	left outer join
		tech on tech.id = project_uses_tech.tech_id
	group by
		project.id
	order by
		tech_count desc) as project_by_tech



  --sidenote
select * from (select project.name, count(tech.name)from project left outer join project_uses_tech on project.id = project_uses_tech.project_id left outer join tech on tech.id = project_uses_tech.tech)id group by project.id order by count(tech.name) desc) as project_by_tech_count
