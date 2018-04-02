DROP TABLE hikes;
DROP TABLE hikers;
DROP TABLE munros;

CREATE TABLE hikers
  (id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT,
  munro_goal INT
);

CREATE TABLE munros
  (id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  region VARCHAR(255),
  altitude INT
);

CREATE TABLE hikes
  (id SERIAL4 PRIMARY KEY,
  hiker_id INT4 REFERENCES hikers(id),
  munro_id INT4 REFERENCES munros(id),
  date DATE
);
