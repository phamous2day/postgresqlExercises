DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id serial PRIMARY KEY,
  name varchar,
  email varchar
);


--Users Matthew and Dave
insert into users values(default, 'Matthew Brimmer', 'mbrimmer1@gmail.com');
insert into users values(default, 'David Pham', 'dpham@gmail.com');
insert into users values(default, 'Tony Stark', 'tstark@gmail.com');

DROP TABLE IF EXISTS projects;
CREATE TABLE projects (
  id serial PRIMARY KEY,
  name varchar,
  description text,
  master_owner integer REFERENCES users (id),
  star_amount integer
);
--Matthew's Projects
insert into projects values(default, 'coffeeshop', 'Fullstack coffee store', 1, 0);
insert into projects values(default, 'my_website', 'Portfolio website', 1, 10);
insert into projects values(default, 'MemoryGame', 'Frontend matching game', 1, 3);
insert into projects values(default, 'socketchat', 'Fullstack chat application', 1, 5);
insert into projects values(default, 'TicTacToe', 'Frontend TicTacToe game', 1, 2);
--Dave's projects
insert into projects values(default, 'CanvasGame', 'Frontend HTML 5 canvas game', 2, 10);
insert into projects values(default, 'PictionaryGame', 'Socket.IO drawing game', 2, 10);
insert into projects values(default, 'MemoryGame', 'Frontend matching game', 2, 3);
insert into projects values(default, 'Portfolio', 'Frontend personal website chat', 2, 5);
insert into projects values(default, 'Sportakus', 'Frontend group sports aggregator', 2, 2);


DROP TABLE IF EXISTS user_projects;
CREATE TABLE user_projects (
  id serial PRIMARY KEY,
  project_id integer REFERENCES projects (id),
  project_member_id integer REFERENCES users (id)
);
--Dave's projects
insert into user_projects values(default, 6, NULL);
insert into user_projects values(default, 7, NULL);
insert into user_projects values(default, 8, NULL);
insert into user_projects values(default, 9, NULL);
insert into user_projects values(default, 10, 1);



--Matthew's projects
insert into user_projects values(default, 1, NULL);
insert into user_projects values(default, 2, NULL);
insert into user_projects values(default, 3, NULL);
insert into user_projects values(default, 4, NULL);
insert into user_projects values(default, 5, NULL);
insert into user_projects values(default, 10, 2);


DROP TABLE IF EXISTS pullrequests;
CREATE TABLE pullrequests (
  id serial PRIMARY KEY,
  project_id integer REFERENCES projects (id),
  user_id integer REFERENCES users (id),
  approval boolean
);
--Dave's pullrequests
insert into pullrequests values(default, 6, 2, TRUE);
insert into pullrequests values(default, 7, 2, TRUE);
insert into pullrequests values(default, 8, 2, TRUE);
insert into pullrequests values(default, 9, 2, TRUE);
insert into pullrequests values(default, 10, 2, FALSE);
insert into pullrequests values(default, 10, 2, FALSE);
--Matthew's pullrequests
insert into pullrequests values(default, 1, 1, TRUE);
insert into pullrequests values(default, 2, 1, TRUE);
insert into pullrequests values(default, 3, 1, TRUE);
insert into pullrequests values(default, 4, 1, TRUE);
insert into pullrequests values(default, 5, 1, TRUE);
insert into pullrequests values(default, 10, 1, FALSE);

DROP TABLE IF EXISTS technologies;
CREATE TABLE technologies (
  id serial PRIMARY KEY,
  tech_name varchar
);

insert into technologies values (default, 'jQuery');
insert into technologies values (default, 'JavaScript');
insert into technologies values (default, 'HTML');
insert into technologies values (default, 'CSS');
insert into technologies values (default, 'Python');
insert into technologies values (default, 'MongoDB');
insert into technologies values (default, 'PostgreSQL');
insert into technologies values (default, 'Mongoose');
insert into technologies values (default, 'AngularJS');
insert into technologies values (default, 'Bootstrap');
insert into technologies values (default, 'Node.js');
insert into technologies values (default, 'Socket.IO');
insert into technologies values (default, 'Animate.css');
insert into technologies values (default, 'Express');


DROP TABLE IF EXISTS project_techs;
CREATE TABLE project_techs (
  id serial PRIMARY KEY,
  project_id integer REFERENCES projects (id),
  tech_id integer REFERENCES technologies (id)
);

--Coffee Shop
insert into project_techs values (default, 1, 2);
insert into project_techs values (default, 1, 3);
insert into project_techs values (default, 1, 4);
insert into project_techs values (default, 1, 6);
insert into project_techs values (default, 1, 8);
insert into project_techs values (default, 1, 9);
insert into project_techs values (default, 1, 10);
insert into project_techs values (default, 1, 11);
insert into project_techs values (default, 1, 14);


--Portfolio
insert into project_techs values (default, 2, 1);
insert into project_techs values (default, 2, 2);
insert into project_techs values (default, 2, 3);
insert into project_techs values (default, 2, 4);
insert into project_techs values (default, 2, 10);

--Memory/matching game
insert into project_techs values (default, 3, 1);
insert into project_techs values (default, 3, 2);
insert into project_techs values (default, 3, 3);
insert into project_techs values (default, 3, 4);

--SocketChat
insert into project_techs values (default, 4, 1);
insert into project_techs values (default, 4, 2);
insert into project_techs values (default, 4, 3);
insert into project_techs values (default, 4, 4);
insert into project_techs values (default, 4, 12);
insert into project_techs values (default, 4, 11);
insert into project_techs values (default, 4, 14);

--TicTacToe
insert into project_techs values (default, 5, 1);
insert into project_techs values (default, 5, 2);
insert into project_techs values (default, 5, 3);
insert into project_techs values (default, 5, 4);

--Dave's project
--Canvas game
insert into project_techs values (default, 6, 1);
insert into project_techs values (default, 6, 2);
insert into project_techs values (default, 6, 3);
insert into project_techs values (default, 6, 4);

--Pictionary
insert into project_techs values (default, 7, 1);
insert into project_techs values (default, 7, 2);
insert into project_techs values (default, 7, 3);
insert into project_techs values (default, 7, 4);
insert into project_techs values (default, 7, 12);
insert into project_techs values (default, 7, 11);
insert into project_techs values (default, 7, 14);

--Supermemory game
insert into project_techs values (default, 8, 1);
insert into project_techs values (default, 8, 2);
insert into project_techs values (default, 8, 3);
insert into project_techs values (default, 8, 4);


--Portfolio
insert into project_techs values (default, 9, 1);
insert into project_techs values (default, 9, 2);
insert into project_techs values (default, 9, 3);
insert into project_techs values (default, 9, 4);
insert into project_techs values (default, 9, 10);

--Sportakus
insert into project_techs values (default, 10, 1);
insert into project_techs values (default, 10, 2);
insert into project_techs values (default, 10, 3);
insert into project_techs values (default, 10, 4);
insert into project_techs values (default, 10, 10);
insert into project_techs values (default, 10, 9);






DROP TABLE IF EXISTS commits;
CREATE TABLE commits (
  id serial PRIMARY KEY,
  project_id integer REFERENCES projects (id),
  user_id integer REFERENCES users (id),
  commit_message varchar,
  commit_date timestamp
);



insert into commits values (default, 1, 1, 'this is coffeeshop commit', '2004-10-19 10:23:54+02');
insert into commits values (default, 2, 1, 'this is my_website commit', '2004-10-19 10:23:54+02');
insert into commits values (default, 3, 1, 'this is memory game commit', '2004-10-19 10:23:54+02');
insert into commits values (default, 4, 1, 'this is socket chat commit', '2004-10-19 10:23:54+02');
insert into commits values (default, 5, 1, 'this is tictactoe commit', '2004-10-19 10:23:54+02');
insert into commits values (default, 3, 2, 'this Dave commit to Matt memory game', '2004-10-19 10:23:54+02');


--All Dave's Commit
insert into commits values (default, 6, 2, 'this is canvas game commit', '2004-10-19 10:23:54+02');
insert into commits values (default, 7, 2, 'this is pictionary commit', '2004-10-19 10:23:54+02');
insert into commits values (default, 8, 2, 'this is Super memory game commit', '2004-10-19 10:23:54+02');
insert into commits values (default, 9, 2, 'this is portfolio commit', '2004-10-19 10:23:54+02');
insert into commits values (default, 10, 2, 'this is sportakus commit', '2004-10-19 10:23:54+02');
insert into commits values (default, 10, 1, 'this is Matt sportakus commit', '2004-10-19 10:23:54+02');
