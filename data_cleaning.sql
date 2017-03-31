/*
* Initial clean of the Raw data in the temp files
*/

/*Making all text capital*/
UPDATE temp_product SET product_category = UPPER(product_category),
product_name = UPPER(product_name),
product_option_1 = UPPER(product_option_1),
product_option_2 = UPPER(product_option_2),
option_value_1 = UPPER(option_value_1),
option_value_2 = UPPER(option_value_2);

UPDATE temp_user SET email_1 = UPPER(email_1),
first_name = UPPER(first_name),
last_name = UPPER(last_name);

UPDATE temp_address SET email = UPPER(email),
street = UPPER(street),
city = UPPER(city);

UPDATE temp_zip SET state = UPPER(state),
country = UPPER(country);

/*Dropping any numbers that are not numbers*/
DELETE FROM temp_product WHERE UPPER(price) ~ '[A-Z]';
DELETE FROM temp_zip WHERE UPPER(zip) ~ '[A-Z]';
DELETE FROM temp_address WHERE UPPER(zip) ~ '[A-Z]';

/*Dropping Strings that contain numbers that should not contain numbers*/
DELETE FROM temp_user WHERE first_name ~ '[0-9]';
DELETE FROM temp_user WHERE last_name ~ '[0-9]';
DELETE FROM temp_zip WHERE state ~ '[0-9]';

/*Updating Prices*/
UPDATE temp_product SET price = 0 WHERE price IS NULL;

/*Removing email address that lack @*/
DELETE FROM temp_user WHERE email_1 !~ '@';
