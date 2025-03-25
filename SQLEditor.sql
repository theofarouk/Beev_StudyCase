-- a. Total number of cars by model by country
SELECT
    c.name AS country,
    s.model,
    SUM(s.sales_volume) AS total_cars_sold
FROM sales s
JOIN countries c ON s.country_id = c.id
GROUP BY c.name, s.model
ORDER BY c.name, total_cars_sold DESC;



-- b
SELECT
    model,
    country,
    max_sales
FROM (
    SELECT
        s.model,
        c.name AS country,
        SUM(s.sales_volume) AS max_sales,
        RANK() OVER (PARTITION BY s.model ORDER BY SUM(s.sales_volume) DESC) as rk
    FROM sales s
    JOIN countries c ON s.country_id = c.id
    GROUP BY s.model, c.name
) ranked
WHERE rk = 1
ORDER BY model;


-- c. Models sold in USA but not in France
SELECT DISTINCT s.model
FROM sales s
JOIN countries c ON s.country_id = c.id
WHERE c.name = 'USA'
  AND s.model NOT IN (
    SELECT model
    FROM sales s2
    JOIN countries c2 ON s2.country_id = c2.id
    WHERE c2.name = 'France'
);


-- d. Average car price in every country by engine type
SELECT
    c.name AS country,
    ca.engine_type,
    ROUND(AVG(ca.price)::numeric, 2) AS avg_price
FROM sales s
JOIN countries c ON s.country_id = c.id
JOIN cars ca ON s.car_id = ca.car_id
GROUP BY c.name, ca.engine_type
ORDER BY c.name, ca.engine_type;



-- e. Average ratings of electric cars vs thermal cars
SELECT
    ca.engine_type,
    ROUND(AVG(s.review_score)::numeric, 2)
FROM sales s
JOIN cars ca ON s.car_id = ca.car_id
WHERE s.review_score IS NOT NULL
GROUP BY ca.engine_type;















-- TRUNCATE TABLE countries RESTART IDENTITY;
-- SELECT * FROM countries;
-- a. Nombre total de voitures par modèle et par pays
