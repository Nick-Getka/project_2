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

  UNIQUE(customer_id),
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
