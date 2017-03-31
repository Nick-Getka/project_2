/*
* This script creates the temporary tables which store the raw data
* These temp tables correspond directly to the datafiles categories
*/
DROP TABLE IF EXISTS temp_product CASCADE;
CREATE TABLE temp_product(
  product_category VARCHAR(100),
  product_name VARCHAR(100),
  product_description VARCHAR(100),
  price VARCHAR(100),
  product_option_1 VARCHAR(100),
  option_value_1 VARCHAR(100),
  nothing_useful VARCHAR(100),
  product_option_2 VARCHAR(100),
  option_value_2 VARCHAR(100)
  );
\COPY temp_product(product_category, product_name, product_description, price, product_option_1, option_value_1, nothing_useful, product_option_2, option_value_2) FROM 'final-data/products.dat' WITH CSV HEADER DELIMITER ';'

Drop TABLE IF EXISTS temp_user CASCADE;
CREATE TABLE temp_user(
  email VARCHAR(100),
  user_password VARCHAR(100),
  email VARCHAR(100),
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  middle_initial VARCHAR(100)
  );
\COPY temp_user(email, user_password, email, first_name, last_name, middle_initial) FROM 'final-data/user.dat' DELIMITER '|'
