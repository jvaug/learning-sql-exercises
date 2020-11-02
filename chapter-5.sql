/* Chapter 5 Concepts
	JOINS
	SUBQUERIES
*/

/* Select first and last names for all customers that live in one of the staff member's countries */

SELECT c.first_name, c.last_name, cy.country
FROM customer c 
INNER JOIN address a ON c.address_id = a.address_id
INNER JOIN city ct ON a.city_id = ct.city_id
INNER JOIN country cy ON ct.country_id = cy.country_id
WHERE cy.country IN (SELECT DISTINCT country FROM staff_list);

/* Select all Japanese films rented by Japanese customers and the names of the customers who rented them */

SELECT f.title, c.first_name, c.last_name, l.name
FROM film f
INNER JOIN language l ON f.language_id = l.language_id
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
INNER JOIN customer c ON c.customer_id = r.customer_id
WHERE l.name = 'JAPANESE';

/* */


