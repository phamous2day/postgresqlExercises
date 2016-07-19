



-- ╔═╗┬─┐┬┌┬┐┌─┐┬─┐┬ ┬  ╦╔═┌─┐┬ ┬
-- ╠═╝├┬┘││││├─┤├┬┘└┬┘  ╠╩╗├┤ └┬┘
-- ╩  ┴└─┴┴ ┴┴ ┴┴└─ ┴   ╩ ╩└─┘ ┴


-- A primary key is a column that both has a unique constraint and a NOT NULL constraint\

CREATE TABLE student (
  -- auto-incrementing ID primary key
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  website varchar,
  github_username varchar,
  points integer DEFAULT 0 CHECK (points >= 0),
  gender char(1),
  graduated boolean DEFAULT FALSE,
  -- links to the ID column in the cohort table
  cohort_id integer
);
















--
--    _                      _       _   _
--   /_\  ___ ___  ___   ___(_) __ _| |_(_) ___  _ __  ___
--  //_\\/ __/ __|/ _ \ / __| |/ _` | __| |/ _ \| '_ \/ __|
-- /  _  \__ \__ \ (_) | (__| | (_| | |_| | (_) | | | \__ \
-- \_/ \_/___/___/\___/ \___|_|\__,_|\__|_|\___/|_| |_|___/
--














--
--    ___                  _
--   /___\_ __   ___      | |_ ___        _ __ ___   __ _ _ __  _   _
--  //  // '_ \ / _ \_____| __/ _ \ _____| '_ ` _ \ / _` | '_ \| | | |
-- / \_//| | | |  __/_____| || (_) |_____| | | | | | (_| | | | | |_| |
-- \___/ |_| |_|\___|      \__\___/      |_| |_| |_|\__,_|_| |_|\__, |
--                                                              |___/


CREATE TABLE cohort (
  -- auto-incrementing ID
  id serial PRIMARY KEY,
  name varchar,
  start_date date,
  end_date date
);

-- drop table student;
CREATE TABLE student (
  -- auto-incrementing ID
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  website varchar,
  github_username varchar,
  points integer DEFAULT 0 CHECK (points >= 0),
  gender char(1),
  graduated boolean DEFAULT FALSE,
  -- links to the ID column in the cohort table
  -- REFERENCES constraint forces cohort_id to point to a valid ID in the cohort table
  cohort_id integer REFERENCES cohort (id)
);


insert into cohort values (default, 'The dream team', '2016-05-01', '2016-08-19');
insert into cohort values (default, 'The super friends', '2016-07-01', '2016-10-19');

insert into student values
  (default, 'Kyle', 'http://kyleluck.com/', 'kyleluck', 5, 'M', FALSE, 1);
insert into student values
  (default, 'Anthony', NULL, 'Athompsonjr26', 7, 'M', FALSE, 1);
insert into student values
  (default, 'Matt', 'http://matthewbrimmer.com/', 'mbrimmer83', 6, 'M', FALSE, 1);
insert into student values
  (default, 'Regan', NULL, 'rrgn', 8, 'M', FALSE, 1);
insert into student values
  (default, 'Tim', NULL, 'tsanders30004', 7, 'M', FALSE, 1);















select * from student, cohort where student.cohort_id = cohort.id;





select * from student inner join cohort on student.cohort_id = cohort.id;





/*
╔╦╗┌─┐┌┐┌┬ ┬  ┌┬┐┌─┐  ╔╦╗┌─┐┌┐┌┬ ┬
║║║├─┤│││└┬┘   │ │ │  ║║║├─┤│││└┬┘
╩ ╩┴ ┴┘└┘ ┴    ┴ └─┘  ╩ ╩┴ ┴┘└┘ ┴
*/

CREATE TABLE student (
  -- auto-incrementing ID
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  website varchar,
  github_username varchar,
  points integer DEFAULT 0 CHECK (points >= 0),
  gender char(1),
  graduated boolean DEFAULT FALSE,
  -- links to the ID column in the cohort table
  -- REFERENCES constraint forces cohort_id to point to a valid ID in the cohort table
  cohort_id integer REFERENCES student (id)
);

CREATE TABLE project (
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  fun_factor integer NOT NULL
);

CREATE TABLE project_participation (
  student_id integer NOT NULL REFERENCES student (id),
  project_id integer NOT NULL REFERENCES project (id)
);

insert into project values (default, 'Coffee Store', 5);
insert into project values (default, 'Draw Together', 7);
insert into project values (default, 'Sportakus', 7);
insert into project values (default, 'Rate the Throne', 7);


insert into project_participation values (...);
