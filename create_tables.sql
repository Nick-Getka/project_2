/*
This Script creates the 10 Required Tables
*/
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS customer_preferences;
DROP TABLE IF EXISTS customer_design;
DROP TABLE IF EXISTS customer_artwork;
DROP TABLE IF EXISTS design_template;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS product_category;
DROP TABLE IF EXISTS product_options;
DROP TABLE IF EXISTS customer_product_details;
DROP TABLE IF EXISTS purchase_order;

CREATE TABLE customer(
  customer_id SERIAL NOT NULL,
  customer_email VARCHAR(45) NOT NULL,
  customer_password VARCHAR(20),
  first_name VARCHAR(20),
  last_name VARCHAR(20),

  PRIMARY KEY(customer_id),
  UNIQUE(customer_email)
  );
CREATE TABLE customer_preferences(
  customer_id INT NOT NULL,
  preference_type VARCHAR(10) NOT NULL,
  preference VARCHAR(100) NOT NULL,

  PRIMARY KEY(customer_id, preference_type, preference),
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
    ON DELETE SET CASCADE
    ON UPDATE CASCADE
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
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
    ON DELETE SET CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY(template_id) REFERENCES design_template(template_id)
    ON DELETE SET CASCADE
    ON UPDATE CASCADE,
  );
CREATE TABLE customer_artwork(
  artwork_id SERIAL NOT NULL,
  customer_id INT,
  design_id INT,
  art_filename VARCHAR(100),

  PRIMARY KEY(artwork_id),
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
    ON DELETE SET CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY(design_id) REFERENCES customer_design(design_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  );
CREATE TABLE design_template();
CREATE TABLE product();
CREATE TABLE product_category();
CREATE TABLE product_options();
CREATE TABLE customer_product_details();
CREATE TABLE purchase_order();
