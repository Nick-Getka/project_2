\encoding KOI8
\COPY temp_product(product_category, product_name, product_description, price, product_option_1, option_value_1, nothing_useful, product_option_2, option_value_2) FROM 'final-data/products.dat' WITH CSV HEADER DELIMITER ';'
\COPY temp_user(email, user_password, email_2, first_name, last_name, middle_initial) FROM 'final-data/user.dat' WITH DELIMITER '|'
\COPY temp_address(email, street, city, zip) FROM 'final-data/address.dat' WITH DELIMITER '|'
\COPY temp_zip(zip,state,country) FROM 'final-data/zip.dat' WITH DELIMITER '|'
