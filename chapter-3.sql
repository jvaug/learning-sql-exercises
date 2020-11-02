/* Retrieve customer ID, first name, last name and email for all customers.  Sort by last name and then by first name */

SELECT customer_id, first_name, last_name, email
FROM customer
ORDER BY last_name, first_name; /* alternate ORDER BY 3,2 */

/* Retrieve customer ID, first name, last name and email for all customers whose first name equals either 'KATIE' or 'BILL' */

SELECT customer_id, first_name, last_name, email
FROM customer
WHERE first_name in ('KATIE', 'BILL');

/* Write a query against the payment table that returns the emails of the customers who made a payment on June 20, 2005.  Include a single row per email and order the them reverse alphabetically. */

SELECT DISTINCT email
FROM customer c INNER JOIN payment p
ON c.customer_id = p.customer_id
WHERE date(payment_date) = '2005-06-20'
ORDER BY email DESC;