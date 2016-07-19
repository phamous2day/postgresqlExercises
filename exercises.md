# PostgreSQL Exercises

## Create Database

Create a database, call it restaurant_db or anything you want. In your terminal:

$ psql
username=# CREATE DATABASE restaurant_db;
CREATE DATABASE
username=# \c restaurant_db
You are now connected to database "restaurant_db" as user "username".

## Create Database Table

Write a database schema: create a restaurant_db.sql file, in it create a table called "restaurant". This table will contain the following information, you will use the appropriate data types to represent the info. Please use an auto-incrementing ID:
  * name
  * distance (in miles from ATV)
  * stars
  * category (type of food)
  * favorite dish
  * does takeout?
  * last time you ate there

Run your file one of two ways:

1. psql restaurant_db < restaurant_db.sql
2. copy-n-paste the "CREATE TABLE" statement into the PostgreSQL shell

If the table has been created successfully, you should see "CREATE TABLE" being printed. You can also describe the table schema in the shell using the \d command:

restaurant_db=# \d restaurant

## Insert Data

Insert data into this table by writing insert statements either directly in the PostgreSQL shell or putting it into a separate restaurant_data.sql file and then run the statements in that file using in the terminal:

$ psql restaurant_db < restaurant_data.sql

## Writing Queries

Write queries to get

1. The names of the restaurants that you gave a 5 stars to
select name from restaurant where stars <=5;

2. The favorite dishes of all 5-star restaurants
select favoritedish where stars<=5;

3. The the id of a restaurant by a specific restaurant name, say 'NaanStop'
select name from restaurant where name = 'Naanstop';

4. restaurants in the category of 'BBQ'
select name from restaurant where category = 'BBQ';

5. restaurants that do take out
select name from restaurant where takeout = "True";

6. restaurants that do take out and is in the category of 'BBQ'
select name from restaurant where takeout = "true" AND category = 'BBQ';


7. restaurants within 2 miles
select name from restaurant where distance <= 2;


8. restaurants you haven't ate at in the last week
select name from restaurant where last_ate < '2016-07-12'

OR

select current_date - interval '7 days' from restaurant;


9. restaurants you haven't ate at in the last week and has 5 stars

select name from restaurant where last_ate < '2016-07-12' AND stars <=5;
