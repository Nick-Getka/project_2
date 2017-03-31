/*
* Inserting the cleaned data into the final tables
*/



/*Inserting Product Data*/
INSERT INTO product(product_name, product_price)
SELECT DISTINCT product_name, CAST( price AS DECIMAL(8,2) )
FROM temp_product;


/*Inserting Customer Data*/
DROP TABLE IF EXISTS full_address CASCADE;
/*Creates a full address from the left Join of temp address and temp_zip*/
CREATE TABLE full_address AS (
  SELECT email, street, city, state, temp_address.zip
  FROM temp_address
  LEFT JOIN temp_zip
  ON temp_address.zip = temp_zip.zip
  );
/*Inserts the customer data in to the final table*/
INSERT INTO customer(customer_email, customer_password, first_name, last_name, street_address, city, state, zip_code)
SELECT DISTINCT email_1, user_password, first_name, last_name, street, city, state, zip
FROM temp_user
FULL JOIN full_address
ON full_address.email = temp_user.email_1
WHERE full_address.email iS NOT NULL AND temp_user.email_1 IS NOT NULL;
DROP TABLE IF EXISTS full_address CASCADE;



/*Inserting Protuct category*/
