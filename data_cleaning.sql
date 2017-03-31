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
