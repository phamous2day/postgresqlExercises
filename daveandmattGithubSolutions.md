# Make Your Own Github

You will make your own GitHub-like database.

This project has three sections:

* building the schema
* inserting the data
* writing the queries

## Building the Schema

Here are *some* of the domain objects in *your* GitHub:

* project
* pull request
* user
* commit
* star (for projects)
* tech (represents either a language, library, or a framework). The project table will have a many-to-many association with the tech table.

Design your schema (screen-less activity):

* list the columns you would want to have for each domain object in the list above. Read ahead to the "Questions" section below to make sure you have the columns you need to answer those questions.
* identify the one-to-many and many-to-many associations, do this on the board or on paper by diagraming

Author the schema:

Write your schema in a .sql file, say my_github.sql. Load in that schema by doing `psql my_github_db < my_github.sql`. To ease fast development, I suggest putting a `DROP TABLE IF EXISTS my_table` statement before each `CREATE TABLE my_table` statement - otherwise you will get a "relation already exists" error.

Ask me to check off on the schema before moving on to the next step.

## Entering Data

You will now painstakingly enter data into this database. You should enter data for all projects you have on the real GitHub and for each partner. I suggest using Postico to enter data, it will be less painful than writing individual insert statements.

For commits, entering every individual commit would be too tedious, so I suggest just entering 3 or 4 mock commits for each project.

Add some stars to each project.

## Questions

You will answer the following questions using SQL queries:

* How popular is this project (based on number of stars)?

SELECT
projects.star_amount,
projects.name
FROM
    projects
group by
	projects.star_amount, projects.name
order by
  projects.star_amount desc

<!-- SELECT
project.star_amount,
  sum(case when project.star_amountis NULL then 0 else 1 end) as star_popularity
FROM
    projects
  order by
  project.star_amount desc; -->

  <!-- select star_amount from projects where name = 'PictionaryGame'; -->

* How many projects does this user have?


SELECT
user_projects.project_member_id,
  sum(case when user_projects.project_member_id is NULL then 0 else 1 end) as project_count
FROM
user_projects
  group by
  user_projects.project_member_id
  order by
  user_projects.project_member_id;

<!-- select * from users inner join user_projects on users.id = user_projects.project_member_id where users.name = 'David Pham' -->


* List this user's projects.
select users.name, projects.name
from
  users
left outer join
  projects on users.id = projects.master_owner;



* What are this user's top 3 projects based on number of stars?
SELECT
name, star_amount,
  sum(case when star_amount is NULL then 0 else 1 end) as top_projects
FROM
    projects
  group by
  star_amount, name
  order by
  <!-- projects.start_amount desc limit 3; -->
top_projects desc limit 3;



* What are the top 3 projects overall based on the number of tech used?

SELECT
projects.id,
  projects.name,
  sum(case when project_techs.tech_id is NULL then 0 else 1 end) as tech_count
FROM
 projects
left outer join
  project_techs on projects.id = project_techs.project_id
  group by
  projects.id
   order by tech_count desc;

<!-- select
projects.id,
projects.name
count(technologies.id) as tech_count
from
projects
left outer join
  project_techs on projects.id = project_techs.project_id
  left outer join
  technologies on technologies.id = project_techs.tech.id
  group by
  projects.id
  order by tech_count desc limit 3 -->



* Are there more than one project with the same name? (opposite of distinct)

<!-- SELECT name, COUNT(*) as count
FROM projects
group by name
order by count desc limit 1; -->

select count(distinct name)
from
projects


* How many contributors does each project have (include even projects that have no contributors)?

select
project_id, projects.name, project_member_id
from projects
left outer join user_projects on project_id = projects.id
order by projects.id desc;



<!-- select
count(user_projects.id) as contributor count,
projects.name, project_member_id
from projects
left outer join user_projects on project_id = user_projects.projects.id
where projects.name in ('TicTacToe', 'CanvasGame'); -->



* How many projects does each user have (include even users that have no projects)?

select users.name,
sum(case when projects.master_owner is NULL then 0 else 1 end) as projects_count from projects
right outer join
users on projects.master_owner = users.id
group by users.name;




* What is the average number of commits on a project?

select avg(commit_count)

from
	(select
		commits.project_id, projects.name,
		sum(case when commits.project_id is NULL then 0 else 1 end) as commit_count
		from commits
		right outer join
			projects on commits.project_id = projects.id
		group by
		commits.project_id, projects.name order by commits.project_id desc) average_commits;







* What is the average number of contributors on a project?

select avg(users_count)

from
	(select
		user_projects.project_member_id, projects.name,
		sum(case when user_projects.project_member_id is NULL then 0 else 1 end) as users_count
		from user_projects
		right outer join
			projects on user_projects.project_member_id = projects.id
		group by
		user_projects.project_member_id, projects.name order by user_projects.project_member_id desc) average_users;





* What is the average number of stars on a project?
select avg(star_amount) from projects





* Who are the contributors to this project?
select
	users.name, projects.name
from
    users
left outer join
  user_projects on user_projects.project_member_id = users.id
left outer join
  projects on projects.id = user_projects.project_id
  where projects.name = 'Sportakus';



* Who made the most PRs (pull requests) to this project?
select
<!-- *from
(SELECT
pullrequests.project_id,
users.id,
users.name,
  sum(case when pullrequests.project_id is NULL then 0 else 1 end) as pullrequests_amount
FROM
    users
left outer join
  pullrequests on pullrequests.user_id = users.id where project.id = 10
  group by
  pullrequests.id,users.id,users.name) as most_pulls; -->




* What is this user's PR acceptence rate (ratio of PRs merged vs PRs unmerged)?
<!-- select
users.name,
sum(case when approval then 1 else 0 end) as approved_count,
count(*) total_pr_count
from
users
inner join
pullrequests on users.id = pullrequests.user_id
group by
users.id; -->



<!-- select
approved_count::real/total_pr_count as approval_rating
from
(select
users.name,
sum(case when approval then 1 else 0 end) as approved_count,
count(*) total_pr_count
from
users
inner join
pullrequests on users.id = pullrequests.user_id
group by
users.id) as user_pr_counts; -->


* What tech does this project use?
* What tech does this user know - based on the tech used in his projects?

select*
from
users
inner join
user_projects on users.id = user_projects.project_member_id
inner join
projects on projects.id = user_projects.project_id
inner join
project_techs on projects.id= project_techs.project_id
inner join
technologies on technologies.id = project_techs.tech_id where users.name = 'David Pham';

<!-- select count(*) as times_used,
tech_name
from
users
inner join
user_projects on users.id = user_projects.project_member_id
inner join
projects on projects.id = user_projects.project_id
inner join
project_techs on projects.id= project_techs.project_id
inner join
technologies on technologies.id = project_techs.tech_id where users.name = 'David Pham'
group by tech_name
having count(*) >= 5; -->


* Who are the top 3 contributors to this project based on number of commits?



* What are this user's top 3 projects based on number of commits?
* Write a query to enable plotting a project's commit activity by date.
* Write a query to enable plotting a user's number of commits by date.

## Bonus

Think of other questions you would like to answer, and write queries for them. If you need to build more schema in order to answer those questions, do that.
