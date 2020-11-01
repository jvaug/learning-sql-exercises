/* Chapter 4 Concepts
	FILTERING
		WHERE clause
	NOT, IN, AND, OR
	= < > !=
	RANGE, BETWEEN
	SUBQUERIES
	MATCHING

/* Construct a query that finds all actors whose last names begin with P and are 4 letters long */

SELECT first_name, last_name
FROM actor
WHERE last_name LIKE "P___";

/* Select all films longer than two hours with replacement cost between 21 and 24 dollars */

SELECT title
FROM film
WHERE length > 120 AND replacement_cost BETWEEN 21 AND 24;

/* Select all July 2005 payments made to staff_id 1 that were less than $3 */

SELECT payment_id, amount, payment_date, staff_id
FROM payment
WHERE payment_date BETWEEN CAST('2005-07-01' AS DATE) AND CAST('2005-08-01' AS DATE)
AND staff_id = 1
AND amount < 3;

/* Write a query that returns all rentals that have not been returned */

SELECT rental_id, customer_id, return_date
FROM rental
WHERE return_date IS NULL;
