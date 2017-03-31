/*
This Script creates the 10 Required Tables
*/
DROP TABLE customer;
DROP TABLE customer_preferences;
DROP TABLE customer_design;
DROP TABLE customer_artwork;
DROP TABLE design_template;
DROP TABLE product;
DROP TABLE product_category;
DROP TABLE product_options;
DROP TABLE customer_product_details;
DROP TABLE purchase_order;

CREATE TABLE customer(
  customer_id SERIAL PRIMARY KEY NOT NULL,


  PRIMARY KEY(customer_id)
  );
CREATE TABLE customer_preferences();
CREATE TABLE customer_design();
CREATE TABLE customer_artwork();
CREATE TABLE design_template();
CREATE TABLE product();
CREATE TABLE product_category();
CREATE TABLE product_options();
CREATE TABLE customer_product_details();
CREATE TABLE purchase_order();
