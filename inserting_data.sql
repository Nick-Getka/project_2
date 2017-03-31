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



/*Inserting Product category*/
INSERT INTO product_category(product_sku, product_category)
SELECT DISTINCT product_sku, product_category
FROM product as p1, temp_product as p2
WHERE p1.product_name = p2.product_name AND p1.product_price = p2.product_price;



/*Inserting Product Option*/
DROP TABLE  IF EXISTSconcat_option CASCADE;
CREATE TABLE concat_option AS(
  SELECT DISTINCT CASE
    WHEN product_option_1 IS NULL THEN product_option_2
    WHEN product_option_2 IS NULL THEN product_option_1
    ELSE product_option_1 || product_option_2
  END AS result_option, product_name, price
FROM temp_product
);
DROP TABLE IF EXISTS concat_value CASCADE;
CREATE TABLE concat_value AS(
  SELECT DISTINCT CASE
    WHEN option_value_1 IS NULL THEN option_value_2
    WHEN option_value_2 IS NULL THEN option_value_1
    ELSE option_value_1 || option_value_2
  END AS result_value, product_name, price
FROM temp_product
);
DROP TABLE IF EXISTS option_final CASCADE;
CREATE TABLE option_final AS(
  SELECT DISTINCT result_option, result_value, p1.product_name, p1.price
  FROM concat_option as p1
  INNER JOIN concat_value as p2
  ON p1.product_name = p2.product_name AND p1.price = p2.price
);

INSERT INTO product_options(product_sku, product_option_type, option_value)
SELECT DISTINCT product_sku, result_option, result_value
FROM product
INNER JOIN option_final AS final
ON product.product_name = final.product_name AND product.product_price = CAST(final.price AS DECIMAL(8,2));
