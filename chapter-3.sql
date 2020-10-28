/* Retrieve customer ID, first name, last name and email for all customers.  Sort by last name and then by first name */

SELECT customer_id, first_name, last_name, email
FROM customer
ORDER BY last_name, first_name; /* alternate ORDER BY 3,2 */

/* Retrieve customer ID, first name, last name and email for all customers whose first name equals 'KATIE' or 'BILL' */

SELECT customer_id, first_name, last_name, email
FROM customer
WHERE first_name in ('KATIE', 'BILL');

/* Write a query against the rental table that returns the emails of the customers woh rented a film on August 19, 2005.  Include a single from for each distinct email, ordered reverse alphabetically. */

SELECT DISTINCT email
FROM customer c INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(rental_date) = '2005-08-19'
ORDER BY email DESC;