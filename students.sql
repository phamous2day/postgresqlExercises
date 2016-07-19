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
