
select count(*) from restaurants;

CREATE TABLE restaurant (
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  address varchar,
  category varchar
);

CREATE TABLE user_table (
  id serial PRIMARY KEY,
  name varchar NOT NULL
);

CREATE TABLE reviews (
  id serial PRIMARY KEY,
  author_id integer REFERENCES user_table (id),
  restaurant_id integer REFERENCES restaurant (id),
  title varchar NOT NULL,
  stars integer,
  content varchar
);

insert into restaurant values (default, 'NaanStop', '273 blah st', 'India');
insert into restaurant values (default, 'Chipotle', '273 blah st', 'Mexican');

insert into user_table values (default, 'Toby');
insert into user_table values (default, 'Dave');

/*
Aggregation Functions:

* count
* sum
* avg
* max
* min
*/

-- count the number of restaurants
select count(*) from restaurants;

-- get the average star rating for all reviewss
select avg(stars) from reviews;

-- get the lowest star rating for all reviewss
select min(stars) from reviews;

-- get the average star rating by restaurant
select
  restaurant.name,
  avg(stars)
from
  restaurant, reviews
where
  restaurant.id = reviews.restaurant_id
group by
  restaurant.id;


select
  restaurant.id,
  restaurant.name,
  restaurant.address,
  count(reviews.review),
  avg(reviews.stars) as average_stars,
  max(reviews.stars) as max_stars,
  min(reviews.stars) as min_stars
from
  user_table,
  restaurant,
  reviews
where
  reviews.author_id = user_table.id and
  reviews.restaurant_id = restaurant.id
group by
  restaurant.id
;

/*

1. get the average stars by restaurant (restaurant name, average star rating)
2. get the average stars by user (user name, average star rating)
3. get the lowest star rating for each user (user name, lowest star rating)
4. get the number of reviewss by restaurant (restaurant name, reviews count)
5. get the number of restaurants in each category (category name, restaurant count)
6. get number of 5 star reviewss by restaurant (restaurant name, 5-star count)
7. average star rating for a food category (category name, average star rating)

*/






-- MongoDB schema
/*
var Restaurant = mongoose.model('Restaurant', {
  name: String,
  address: String,
  reviewss: [{
    title: String,
    reviews: String,
    stars: Number,
    author: {
      name: String,
      karma: Number,
      email: String
    }
  }]
});

*/
