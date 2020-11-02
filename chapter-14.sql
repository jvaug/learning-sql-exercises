/* Chapter 14 Concepts
	VIEWS
*/

/* Create a view that anonymizes phone numbers and address numbers in the address table */

CREATE VIEW address_anon
	(
		address_id,
		anon_address,
		district,
		city_id,
		anon_phone
	)
AS
SELECT
	address_id,
	REPLACE(address, CAST(address as UNSIGNED), REPEAT('*',LENGTH(CAST(address as UNSIGNED)))) anon_address,
	district,
	city_id,
	REPLACE(phone, RIGHT(phone,4), '****') anon_phone
FROM address; 

/* Create a view that reports the top 10 customers by number of rentals from the latest/current month */

CREATE VIEW cust_top_10
	(
		first_name,
		last_name,
		email,
		month,
		year,
		num_rentals
	)
AS
SELECT
	c.first_name,
	c.last_name,
	c.email,
	MONTHNAME(r.rental_date) month,
	YEAR(r.rental_date) year,
	count(r.rental_date) num_rentals
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
WHERE YEAR(r.rental_date) = (SELECT MAX(YEAR(rental_date)) FROM rental)
AND MONTH(r.rental_date) = 
	(SELECT MAX(MONTH(rental_date))FROM rental 
		WHERE YEAR(rental_date) = (SELECT MAX(YEAR(rental_date)) FROM rental))
GROUP BY YEAR(r.rental_date), MONTHNAME(r.rental_date), c.customer_id
ORDER BY num_rentals DESC
LIMIT 10;



