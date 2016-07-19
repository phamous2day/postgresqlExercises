CREATE TABLE restaurant (
  id serial PRIMARY KEY,
  name varchar,
  address text,
  category varchar
);

CREATE TABLE user_table (
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  email varchar,
  karma integer DEFAULT 0 CHECK (karma >= 0 AND karma <=7)
);

CREATE TABLE reviews (
  id serial PRIMARY KEY,
  author_id integer REFERENCES user_table (id),
  stars integer DEFAULT 0 CHECK (stars >= 1 and stars <=5),
  title varchar,
  review text,
  restaurant_id integer REFERENCES restaurant (id)
);

--restarant inserts
insert into restaurant values (default,'Naanstop', '124 easy street', 'ethnic');
insert into restaurant values (default,'Chick-Fil-A', '246 Moo street', 'fast food');
insert into restaurant values (default, 'Octane', 'Caffine mean street', 'beverage');

--user_table inserts
insert into user_table values (default,'Peter Parker', 'spidey@gmail.com', 5);
insert into user_table values (default,'Bruce Wayne', 'batman@gmail.com', 2);
insert into user_table values (default,'Clark Kent', 'superman@gmail.com', 7);

--reviews inserts
insert into reviews values (default,1, 4, 'Indian food in McDonalds form', 'Forget the long lines, Indian food here is quick and good.', 1);
insert into reviews values (default,2,2, 'Chick Fil A no surprises', 'Same as any other fast food. Good, cheap, clean place', 2);
insert into reviews values (default,3,1, 'Another hipster coffee joint', 'Overpriced snacks, decent coffee', 3);


--this joins the id relationships to each other
select * from reviews, user_table where reviews.author_id = user_table.id;
select * from reviews, restaurant where restaurant_id = restaurant.id;

--Other way to do it:
user_table.name as user,
restaurant.name as restaurant,
review.title,
review.content as review
from
user_table,
restaurant,
review
where
review.author_id = user_table.id and
review.restaurant_id = restuarant.id;


--Bonus Challenge
-- select
-- user_table.id as author.id,
-- title as title,
-- review as review,
-- stars as stars,
-- restaurant.id as restaurant_id,
-- restaurant.name as restaurant
-- from
-- restaurant,
-- user_table,
-- reviews
-- where
-- user_table.id = reviews.author_id and
-- restaurant.id = reviews.restaurant_id;
