-- Database: task2

-- DROP DATABASE IF EXISTS task2;

CREATE DATABASE task2
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	

	
CREATE TABLE user_details (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL
);


INSERT INTO user_details (username) VALUES
  ('John Doe'),
  ('Jane Don'),
  ('Alice Jones'),
  ('Lisa Romero');
  
  
CREATE TABLE training_details (
    user_training_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    training_id INT NOT NULL,
    training_date DATE NOT NULL,
	FOREIGN KEY (user_id) REFERENCES user_details (user_id)
);


INSERT INTO training_details (user_id, training_id, training_date) VALUES
  (1, 1, '2015-08-02'),
  (2, 1, '2015-08-03'),
  (3, 2, '2015-08-02'),
  (4, 2, '2015-08-04'),
  (2, 2, '2015-08-03'),
  (1, 1, '2015-08-02'),
  (3, 2, '2015-08-04'),
  (4, 3, '2015-08-03'),
  (1, 4, '2015-08-03'),
  (3, 1, '2015-08-02'),
  (4, 2, '2015-08-04'),
  (3, 2, '2015-08-02'),
  (1, 1, '2015-08-02'),
  (4, 3, '2015-08-03');


SELECT u.user_id, u.username, t.training_id, t.training_date, count(t.training_date)
FROM user_details as u, training_details as t 
where u.user_id = t.user_id
GROUP BY u.user_id, u.username, t.training_id, t.training_date
HAVING count(t.training_date) > 1
ORDER BY t.training_date DESC;
