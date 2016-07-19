








--    ___          _                 __    ____  __
--   / _ \___  ___| |_ __ _ _ __ ___/ _\  /___ \/ /
--  / /_)/ _ \/ __| __/ _` | '__/ _ \ \  //  / / /
-- / ___/ (_) \__ \ || (_| | | |  __/\ \/ \_/ / /___
-- \/    \___/|___/\__\__, |_|  \___\__/\___,_\____/
--                 |___/










-- ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐  ┌─┐  ┌┬┐┌─┐┌┬┐┌─┐┌┐ ┌─┐┌─┐┌─┐
-- ║  ├┬┘├┤ ├─┤ │ ├┤   ├─┤   ││├─┤ │ ├─┤├┴┐├─┤└─┐├┤
-- ╚═╝┴└─└─┘┴ ┴ ┴ └─┘  ┴ ┴  ─┴┘┴ ┴ ┴ ┴ ┴└─┘┴ ┴└─┘└─┘

/*

$ psql
username=# CREATE DATABASE students_db;
username=# \c students_db

*/

















-- ╔═╗┬─┐┌─┐┌─┐┌┬┐┌─┐┬┌┐┌┌─┐  ╔╦╗┌─┐┌┐ ┬  ┌─┐┌─┐
-- ║  ├┬┘├┤ ├─┤ │ ├┤ │││││ ┬   ║ ├─┤├┴┐│  ├┤ └─┐
-- ╚═╝┴└─└─┘┴ ┴ ┴ └─┘┴┘└┘└─┘   ╩ ┴ ┴└─┘┴─┘└─┘└─┘


CREATE TABLE student (
  -- defines a name field with the type of varchar,
  -- which is short for a variable number of characters,
  -- in other words, a string
  name varchar,
  website varchar,
  github_username varchar,
  -- points has type of integer
  points integer,
  -- gender has type of 1 character, it's like a string
  -- of length 1
  gender char(1),
  -- cohort_start_date is a date
  cohort_start_date date,
  graduated boolean
);














/*

╔╦╗┌─┐┌┬┐┌─┐  ╔╦╗┬ ┬┌─┐┌─┐┌─┐
 ║║├─┤ │ ├─┤   ║ └┬┘├─┘├┤ └─┐
═╩╝┴ ┴ ┴ ┴ ┴   ╩  ┴ ┴  └─┘└─┘

* char(n) or character(n)
* varchar(n) or character varying(n) or varchar/text
* integer
* numeric - precise decimal numbers
* money
* real - floating point numbers
* date
* timestamp
* boolean

*/

























-- ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐┬┌┐┌┌─┐  ╔╦╗┌─┐┌┬┐┌─┐
-- ║│││└─┐├┤ ├┬┘ │ │││││ ┬   ║║├─┤ │ ├─┤
-- ╩┘└┘└─┘└─┘┴└─ ┴ ┴┘└┘└─┘  ═╩╝┴ ┴ ┴ ┴ ┴

insert into student values
  ('Kyle', 'http://kyleluck.com/', 'kyleluck', , 'M', '2016-05-01', FALSE);
insert into student values
  ('Anthony', NULL, 'Athompsonjr26', 7, 'M', '2016-05-01', FALSE);
insert into student values
  ('Matt', 'http://matthewbrimmer.com/', 'mbrimmer83', 6, 'M', '2016-05-01', FALSE);

/*

# select * from student;
  name   |          website           | github_username | points | gender | cohort_start_date
---------+----------------------------+-----------------+--------+--------+-------------------
 Kyle    | http://kyleluck.com/       | kyleluck        |      5 | M      | 2016-05-01
 Anthony |                            | Athompsonjr26   |      7 | M      | 2016-05-01
 Matt    | http://matthewbrimmer.com/ | mbrimmer83      |      6 | M      | 2016-05-01
(3 rows)

*/











-- ╦┌┐┌┌─┐┌─┐┬─┐┌┬┐┬┌┐┌┌─┐  ╔╦╗┌─┐┌┬┐┌─┐
-- ║│││└─┐├┤ ├┬┘ │ │││││ ┬   ║║├─┤ │ ├─┤
-- ╩┘└┘└─┘└─┘┴└─ ┴ ┴┘└┘└─┘  ═╩╝┴ ┴ ┴ ┴ ┴

-- specifying only certain fields
insert into student (name, github_username) values
  ('Regan', 'rrgn');
insert into student (name, github_username) values
  ('Cody', 'codybarber');


/*

# select * from student;
  name   |          website           | github_username | points | gender | cohort_start_date
---------+----------------------------+-----------------+--------+--------+-------------------
 Kyle    | http://kyleluck.com/       | kyleluck        |      5 | M      | 2016-05-01
 Anthony |                            | Athompsonjr26   |      7 | M      | 2016-05-01
 Matt    | http://matthewbrimmer.com/ | mbrimmer83      |      6 | M      | 2016-05-01
 Regan   |                            | rrgn            |        |        |
 Cody    |                            | codybarber      |        |        |
(5 rows)

*/










-- ╔╦╗┌─┐┌─┐┌─┐┬ ┬┬ ┌┬┐  ╦  ╦┌─┐┬  ┬ ┬┌─┐┌─┐
--  ║║├┤ ├┤ ├─┤│ ││  │   ╚╗╔╝├─┤│  │ │├┤ └─┐
-- ═╩╝└─┘└  ┴ ┴└─┘┴─┘┴    ╚╝ ┴ ┴┴─┘└─┘└─┘└─┘

CREATE TABLE student (
  name varchar,
  website varchar,
  github_username varchar,
  -- defaults points to 0 if not specified
  points integer DEFAULT 0,
  gender char(1),
  cohort_start_date date,
  -- defaults graduate to FALSE if not specified
  graduated boolean DEFAULT FALSE
);












-- ╔═╗┌─┐┌┐┌┌─┐┌┬┐┬─┐┌─┐┬┌┐┌┌┬┐┌─┐
-- ║  │ ││││└─┐ │ ├┬┘├─┤││││ │ └─┐
-- ╚═╝└─┘┘└┘└─┘ ┴ ┴└─┴ ┴┴┘└┘ ┴ └─┘

-- Constraints are checked a insert time. The insert will fail if constraints
-- are violated.

CREATE TABLE student (
  -- NOT NULL constraint: prevents name from being unspecified
  -- UNIQUE constraint: prevents there from being two rows of the same name
  name varchar NOT NULL UNIQUE,
  website varchar,
  github_username varchar,
  -- CHECK constraint, ensures points is greater or equal to 0
  points integer DEFAULT 0 CHECK (points >= 0),
  gender char(1),
  -- NOT NULL constraint: prevents cohort_start_date from being unspecified
  cohort_start_date date NOT NULL,
  graduated boolean DEFAULT FALSE
);










-- ╔═╗┬ ┬┌┬┐┌─┐┬┌┐┌┌─┐┬─┐┌─┐┌┬┐┌─┐┌┐┌┌┬┐┬┌┐┌┌─┐  ╦╔╦╗┌─┐
-- ╠═╣│ │ │ │ ││││││  ├┬┘├┤ │││├┤ │││ │ │││││ ┬  ║ ║║└─┐
-- ╩ ╩└─┘ ┴ └─┘┴┘└┘└─┘┴└─└─┘┴ ┴└─┘┘└┘ ┴ ┴┘└┘└─┘  ╩═╩╝└─┘

CREATE TABLE student (
  -- auto-incrementing ID, is unique, and is auto-incremented for each new row
  -- when you insert it
  -- *DO NOT* specifiy the id when you insert if you are using an auto-incrementindg ID
  -- Specifying the UNIQUE constraint because serial does not require uniqueness
  id serial UNIQUE,
  name varchar NOT NULL,
  website varchar,
  github_username varchar,
  points integer DEFAULT 0 CHECK (points >= 0),
  gender char(1),
  cohort_start_date date NOT NULL,
  graduated boolean DEFAULT FALSE
);










/*
Some data:

insert into student (name, website, github_username, points, gender, cohort_start_date) values
  ('Kyle', 'http://kyleluck.com/', 'kyleluck', 5, 'M', '2016-05-01');
insert into student (name, github_username, points, gender, cohort_start_date) values
  ('Anthony', 'Athompsonjr26', 7, 'M', '2016-05-01');
insert into student (name, website, github_username, points, gender, cohort_start_date) values
  ('Matt', 'http://matthewbrimmer.com/', 'mbrimmer83', 6, 'M', '2016-05-01');
insert into student (name, github_username, points, gender, cohort_start_date) values
  ('Regan', 'rrgn', 8, 'M', '2016-05-01');
insert into student (name, github_username, points, gender, cohort_start_date) values
  ('Tim', 'tsanders30004', 7, 'M', '2016-05-01');
insert into student (name, github_username, points, gender, cohort_start_date) values
  ('Shanda', 'ShandaQ', 10, 'F', '2016-05-01');
insert into student (name, website, github_username, points, gender, cohort_start_date) values
  ('Allen', 'https://www.allenhthompson.com/', 'AllenHThompson', 9, 'M', '2016-05-01');
insert into student (name, website, github_username, points, gender, cohort_start_date) values
  ('Carolyn', 'http://www.carolynsdaniel.com/', 'csdaniel17', 7, 'F', '2016-05-01');
insert into student (name, website, github_username, points, gender, cohort_start_date) values
  ('Sandhya', 'https://ramsandhya.herokuapp.com/', 'ramsandhya', 10, 'F', '2016-05-01');

*/











-- ╔═╗┌─┐┬  ┌─┐┌─┐┌┬┐  ╔═╗┌┬┐┌─┐┌┬┐┌─┐┌┬┐┌─┐┌┐┌┌┬┐
-- ╚═╗├┤ │  ├┤ │   │   ╚═╗ │ ├─┤ │ ├┤ │││├┤ │││ │
-- ╚═╝└─┘┴─┘└─┘└─┘ ┴   ╚═╝ ┴ ┴ ┴ ┴ └─┘┴ ┴└─┘┘└┘ ┴

select * from student;














-- Specifying specific fields

select name, website from student;

-- Finds all values in columns: name and website






-- ╦ ╦┬ ┬┌─┐┬─┐┌─┐  ┌─┐┬  ┌─┐┬ ┬┌─┐┌─┐
-- ║║║├─┤├┤ ├┬┘├┤   │  │  ├─┤│ │└─┐├┤
-- ╚╩╝┴ ┴└─┘┴└─└─┘  └─┘┴─┘┴ ┴└─┘└─┘└─┘

-- find all female students
select name from student where gender = 'F';










-- find all students with points greater than 7
select * from student where points > 7;










-- find all female students with points greater than 7
select * from student where gender = 'F' and points > 7;








-- Partial string match:

select * from student where github_username ilike '%thompson%';






-- FIN
