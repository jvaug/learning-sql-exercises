/* Other functionality not covered */

/* Create a stored procedure, run it, then drop it */

DELIMITER //

CREATE PROCEDURE GetAllFilms()
BEGIN
	SELECT * FROM film_list;
END //

DELIMITER ;

CALL GetAllFilms;

DROP PROCEDURE GetAllFilms;
/* DROP PROCEDURE IF EXISTS GetAllFilms */

/* Create a stored procedure that takes a parameter and call it */

DELIMITER //

CREATE PROCEDURE GetFilmsByActorLN(
	IN lastName VARCHAR(20)
	)
BEGIN
	SELECT
		f.title,
		a.first_name,
		a.last_name
	FROM film f
	INNER JOIN film_actor fa ON f.film_id = fa.film_id
	INNER JOIN actor a ON a.actor_id = fa.actor_id
	WHERE a.last_name = lastName;
END //

DELIMITER ;

CALL GetFilmsByActorLN('STREEP')

/* Create a store procedure that uses IN and OUT */

DELIMITER //

CREATE PROCEDURE GetRentalsByCID(
	IN custID SMALLINT UNSIGNED,
	OUT total_rentals INT
)
BEGIN
	SELECT COUNT(rental_id)
	INTO total_rentals
	FROM rental
	WHERE customer_id = custID;
END //

DELIMITER ;

CALL GetRentalsByCID(592,@total_rentals);
SELECT @total_rentals
SET @total_rentals = NULL;

/* Output a query to a .csv file */

SELECT * FROM payment
INTO OUTFILE 'tmp/payment.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'

