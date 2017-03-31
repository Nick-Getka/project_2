/*
* Inserting the cleaned data into the final tables
*/



/*Inserting Product Data*/
INSERT INTO product(product_name, product_price)
SELECT DISTINCT product_name, CAST( price AS DECIMAL(8,2) )
FROM temp_product;


/*Inserting Customer Data*/
DROP TABLE IF EXISTS full_address CASCADE;
CREATE TABLE full_address AS (                                                                       SELECT email, street, city, state, temp_address.zip
  FROM temp_address
  LEFT JOIN temp_zip
  ON temp_address.zip = temp_zip.zip);

INSERT INTO customer(customer_email, customer_password, first_name, last_name, street_address, city, state, zip_code)
SELECT DISTINCT email, user_password, first_name, last_name, street, city, state, zip
FROM temp_user
FULL JOIN full_address
ON full_address.email = temp_user.email;