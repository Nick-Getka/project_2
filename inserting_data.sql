/*
* Inserting the cleaned data into the final tables
*/



/*Inserting Product Data*/
INSERT INTO product(product_name, product_price)
SELECT product_name, CAST( price AS DECIMAL(8,2) )
FROM temp_product;


/*Inserting Customer Data*/
/*Inserting Design Template Data*/
