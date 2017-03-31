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

DROP TABLE IF EXISTS temp_user CASCADE;
CREATE TABLE temp_user(
  email_1 VARCHAR(100),
  user_password VARCHAR(100),
  email_2 VARCHAR(100),
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  middle_initial VARCHAR(100)
  );

DROP TABLE IF EXISTS temp_address CASCADE;
CREATE TABLE temp_address(
  email VARCHAR(100),
  street VARCHAR(100),
  city VARCHAR(100),
  zip VARCHAR(100)
  );

DROP TABLE IF EXISTS temp_zip CASCADE;
CREATE TABLE temp_zip(
  zip VARCHAR(100),
  state VARCHAR(100),
  country VARCHAR(100)
  );

  \i read_data.sql
