/*
This Script creates the 10 Required Tables
*/
DROP TABLE IF EXISTS customer_preferences;
DROP TABLE IF EXISTS product_category;
DROP TABLE IF EXISTS product_options;
DROP TABLE IF EXISTS customer_product_details;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS purchase_order;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS customer_artwork;
DROP TABLE IF EXISTS customer_design;
DROP TABLE IF EXISTS design_template;

CREATE TABLE customer(
  customer_id SERIAL NOT NULL,
  customer_email VARCHAR(45) NOT NULL,
  customer_password VARCHAR(20) NOT NULL,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  street_address VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(30),
  zip_code VARCHAR(10),

  PRIMARY KEY(customer_id),
  UNIQUE(customer_email)
  );
CREATE TABLE customer_preferences(
  customer_id INT NOT NULL,
  preference_type VARCHAR(10) NOT NULL,
  preference VARCHAR(100) NOT NULL,

  PRIMARY KEY(customer_id, preference_type, preference),
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
  );
CREATE TABLE design_template(
  template_id SERIAL NOT NULL,
  template_name VARCHAR(45),
  template_description VARCHAR(100),
  template_filename VARCHAR(45),

  PRIMARY KEY(template_id)
  );
CREATE TABLE customer_design(
  design_id SERIAL NOT NULL,
  customer_id INT,
  template_id INT,
  user_design_name VARCHAR(50),
  design_date DATE,
  design_filename VARCHAR(100),
  design_custom_text VARCHAR(50),
  design_font VARCHAR(20),
  design_font_size INT,
  design_font_color VARCHAR(10),

  PRIMARY KEY(design_id),
  UNIQUE(customer_id,design_id,design_date),
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY(template_id) REFERENCES design_template(template_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
  );
CREATE TABLE customer_artwork(
  artwork_id SERIAL NOT NULL,
  customer_id INT,
  design_id INT,
  art_filename VARCHAR(100),

  PRIMARY KEY(artwork_id),
  UNIQUE(customer_id, design_id, art_filename),
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY(design_id) REFERENCES customer_design(design_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
  );
CREATE TABLE product(
  product_sku SERIAL NOT NULL,
  product_name VARCHAR(50),
  product_price DECIMAL(8,2),
  product_image VARCHAR(100),

  PRIMARY KEY(product_sku)
  );
CREATE TABLE product_category(
  product_sku INT NOT NULL,
  product_category VARCHAR(45),

  PRIMARY KEY(product_sku,product_category),
  FOREIGN KEY(product_sku) REFERENCES product(product_sku)
    ON DELETE CASCADE
    ON UPDATE CASCADE
  );
CREATE TABLE product_options(
  product_sku INT NOT NULL,
  product_option_type VARCHAR(45),
  option_value VARCHAR(45),

  PRIMARY KEY(product_sku,product_option_type,option_value),
  FOREIGN KEY(product_sku) REFERENCES product(product_sku)
    ON DELETE CASCADE
    ON UPDATE CASCADE
  );
CREATE TABLE purchase_order(
  order_id SERIAL NOT NULL,
  order_date DATE,
  total_price DECIMAL(8,2),
  customer_id INT,
  street_address_1 VARCHAR(100),
  street_address_2 VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(30),
  zip_code VARCHAR(10),
  credit_card_number VARCHAR(16),
  credit_card_expiration DATE,
  credic_card_security INT,
  approval_code VARCHAR(20),

  PRIMARY KEY(order_id)
  );
CREATE TABLE customer_product_details(
  customer_id INT,
  product_sku INT,
  order_id INT,
  design_id INT,
  product_price DECIMAL(8,2),
  product_size VARCHAR(10),
  product_quantity INT,

  PRIMARY KEY(customer_id,product_sku,order_id,design_id),
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
    ON UPDATE CASCADE,
  FOREIGN KEY(product_sku) REFERENCES product(product_sku)
    ON UPDATE CASCADE,
  FOREIGN KEY(order_id) REFERENCES purchase_order(order_id)
    ON UPDATE CASCADE,
  FOREIGN KEY(design_id) REFERENCES customer_design(design_id)
    ON UPDATE CASCADE
  );
