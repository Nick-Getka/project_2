CREATE VIEW sort_products AS

SELECT product_category, product_name, product_price
FROM product
JOIN (SELECT product_category, MAX(product_sku)
      FROM product_category
      GROUP BY product_category) AS A
ON product.product_sku = A.product_sku
ORDER BY product_price DESC;
