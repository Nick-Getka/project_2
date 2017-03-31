/*
* Inserting the cleaned data into the final tables
*/



/*Inserting Product Data*/
INSERT INTO product(product_name, product_price, product_image)
SELECT product_name, product_price, product_image
FROM temp_product;


/*Inserting Customer Data*/
/*Inserting Design Template Data*/
