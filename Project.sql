-- 1. What does the entire dataset look like?
SELECT *
FROM Top200RichestPersonintheWorld;

-- 2. Retrieve the 20 richest billionaires.
SELECT *
FROM Top200RichestPersonintheWorld
ORDER BY networth_billion DESC
LIMIT 20;

-- 3. Identify the five youngest billionaires
SELECT *
FROM Top200RichestPersonintheWorld
ORDER BY age ASC
LIMIT 5;

-- 4. Calculate the average age and average net worth.
SELECT AVG(age) AS average_age,
		AVG(networth_billion) AS average_networth
FROM Top200RichestPersonintheWorld;

-- 5. Identify the five most represented countries.
SELECT country,
		COUNT(*) AS billionaire_count
FROM Top200RichestPersonintheWorld
GROUP BY country
ORDER BY billionaire_count DESC
LIMIT 5;

-- 6. Calculate the combined net worth of billionaires from each country.
SELECT country,
		ROUND(SUM(networth_billion), 2) AS combined_networth_billion
FROM Top200RichestPersonintheWorld
GROUP BY country
ORDER BY combined_networth_billion DESC;

-- 7. Identify the five industries with the highest number of billionaires.
SELECT industry,
		COUNT(*) AS billionaire_count
FROM Top200RichestPersonintheWorld
GROUP BY industry
ORDER BY billionaire_count DESC
LIMIT 5;

-- 8. Find countries with at least five billionaires. 
SELECT country,
		COUNT(*) AS billionaire_count
FROM Top200RichestPersonintheWorld
GROUP BY country
HAVING billionaire_count >= 5
ORDER BY billionaire_count DESC;

-- 9. Calculate the total wealth of billionaires younger than 50.
SELECT SUM(networth_billion) AS total_wealth_of_billionaires_younger_than_50
FROM Top200RichestPersonintheWorld
WHERE age < 50;

-- 10. Identify billionaires whose net worth exceeds the overall average net worth.
SELECT name,
		networth_billion
FROM Top200RichestPersonintheWorld
WHERE networth_billion > 
		(
          	SELECT AVG(networth_billion)
        	FROM Top200RichestPersonintheWorld
        )
ORDER BY networth_billion DESC;

-- 11. Identify the industry with the highest average net worth
SELECT industry,
		AVG(networth_billion) AS industry_average_networth
FROM Top200RichestPersonintheWorld
GROUP BY industry
ORDER BY industry_average_networth DESC
LIMIT 1;

-- 12. Who are the billionaires whose names begin with the letter A?
SELECT 	rank,
		name,
		age,
        networth_billion,
        country,
        industry
FROM Top200RichestPersonintheWorld
WHERE name LIKE 'A%';

-- 13. Who are the billionaires aged above 60 with a net worth greater than $50 billion?
SELECT 	rank,
		name,
		age,
        networth_billion,
        country,
        industry
FROM Top200RichestPersonintheWorld
WHERE age > 60
AND networth_billion > 50;

-- 14. Which billionaires belong to industries with more than 10 representatives?
SELECT 	rank,
		name,
		age,
        networth_billion,
        country,
        industry
FROM Top200RichestPersonintheWorld
WHERE industry IN (
	SELECT industry
  	FROM Top200RichestPersonintheWorld
  	GROUP By industry
	HAVING COUNT(*) > 10
)
ORDER BY industry, networth_billion DESC;

-- 15. What is the difference between the richest and poorest billionaire in the dataset?
SELECT 	MAX(networth_billion) AS max_networth_billion,
		MIN(networth_billion) AS min_networth_billion,
        MAX(networth_billion) - MIN(networth_billion) AS networth_billion_difference
FROM Top200RichestPersonintheWorld;

-- 16. What percentage of the dataset is made up of billionaires younger than 50?
SELECT count(*) * 100.0 / (
	SELECT COUNT(*)
	FROM Top200RichestPersonintheWorld
) AS percentage_of_billionaires_younger_than_50
FROM Top200RichestPersonintheWorld
WHERE age < 50;

-- 17. Which country has the highest number of billionaires below age 40?
SELECT 	country,
		COUNT(*) AS number_of_billionaires
FROM Top200RichestPersonintheWorld
WHERE age < 40
GROUP BY country
ORDER BY number_of_billionaires DESC
LIMIT 1;

-- 18. Which industry has the highest average billionaire age?
SELECT 	industry,
		AVG(age) As average_age
FROM Top200RichestPersonintheWorld
GROUP BY industry
ORDER BY average_age DESC
LIMIT 1;

-- 19. Who has a net worth between $50 billion and $100 billion?
SELECT 	rank,
		name,
		age,
        networth_billion,
        country,
        industry
FROM Top200RichestPersonintheWorld
WHERE networth_billion BETWEEN 50 AND 100;

-- 20. Which industry contributes the most to the combined wealth of the top 200?
SELECT 	industry,
		SUM(networth_billion) AS total_networth_billion
FROM Top200RichestPersonintheWorld
GROUP BY industry
ORDER BY total_networth_billion DESC
LIMIT 1;

