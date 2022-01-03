CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  start_date DATE,
  end_date DATE
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  phone VARCHAR(32),
  github VARCHAR(255),
  start_date DATE,
  end_date DATE,
  cohort_id INTEGER REFERENCES cohorts(id) ON DELETE CASCADE
);

-- INSERT INTO famous_people (first_name, last_name, birthdate)
--   VALUES ('Abraham', 'Lincoln', '1809-02-12');
-- INSERT INTO famous_people (first_name, last_name, birthdate)
--   VALUES ('Mahatma', 'Gandhi', '1869-10-02');
-- INSERT INTO famous_people (first_name, last_name, birthdate)
--   VALUES ('Paul', 'Rudd', '1969-04-06');
-- INSERT INTO famous_people (first_name, last_name, birthdate)
--   VALUES ('Paul', 'Giamatti', '1967-06-06');
-- INSERT INTO famous_people (first_name, last_name, birthdate)
--   VALUES ('Simon', 'Peter', '1500-01-01');
