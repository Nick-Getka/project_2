CREATE VIEW sort_products AS

SELECT product_category, product_name, product_price
FROM (SELECT product_category, product_name, product_price
      INNER JOIN product
      ON product_category
      WHERE product.product_sku = product_category.product_sku)
GROUP BY product_category
ORDER BY product_price DESC;
