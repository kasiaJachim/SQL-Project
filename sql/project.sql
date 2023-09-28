use caravan_parks;

CREATE TABLE park
(id INT AUTO_INCREMENT PRIMARY KEY,
park_name VARCHAR (100) NOT NULL,
email VARCHAR(100),
place_count INT,
checkin_time TIME NOT NULL,
checkout_time TIME NOT NULL,
address_id INT NOT NULL,
rating DECIMAL(4,2) NOT NULL,
FOREIGN KEY(address_id) REFERENCES address(id)
);

CREATE TABLE pitches
(id INT AUTO_INCREMENT PRIMARY KEY,
pitchType_id INT NOT NULL,
swimming_pool BOOLEAN,
seaside BOOLEAN,
park_id INT NOT NULL,
FOREIGN KEY(park_id) REFERENCES park(id),
FOREIGN KEY (pitchType_id) REFERENCES pitchType(id)
);

CREATE TABLE pitchType
(id INT AUTO_INCREMENT PRIMARY KEY,
pitch_name VARCHAR(50) NOT NULL,
pitch_cost DECIMAL (6,2),
pitch_description TEXT,
pet_friendly BOOLEAN
);


CREATE TABLE bookings
(id INT AUTO_INCREMENT PRIMARY KEY,
booking_date DATE,
nights_count INT NOT NULL,
checkin_date DATE NOT NULL,
checkout_date DATE NOT NULL,
card_payment BOOLEAN NOT NULL,
booking_amount DECIMAL (10,2),
park_id INT NOT NULL,
guest_id INT NOT NULL,
FOREIGN KEY (park_id) REFERENCES park(id),
FOREIGN KEY(guest_id) REFERENCES guest(id)
);

CREATE TABLE pitchBooked
(id INT AUTO_INCREMENT PRIMARY KEY,
bookings_id INT NOT NULL,
pitchType_id INT NOT NULL,
FOREIGN KEY (pitchType_id) REFERENCES pitchType(id),
FOREIGN KEY (bookings_id) REFERENCES bookings(id)
);


 CREATE TABLE address
 (id INT AUTO_INCREMENT PRIMARY KEY,
 address_line1 VARCHAR(10) NOT NULL,
 address_line2 VARCHAR(50) NOT NULL,
 city VARCHAR(20) NOT NULL,
 post_code VARCHAR(10) NOT NULL
 );
 
  CREATE TABLE guest
  (id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone_number CHAR(11),
  email VARCHAR(50) NOT NULL,
  address_id INT NOT NULL,
  FOREIGN KEY (address_id) REFERENCES address(id)
  );
  
  INSERT INTO park (park_name, email, place_count, checkin_time ,checkout_time,address_id,rating )
  VALUES
  ('Cala Gran Holiday Park','calagran@gmail.com', '2450', '11:30:00', '15:00:00',1,8.0),
  ('Marton Mere Holiday Village','martonmere@gmail.com','1600','10:30:00','15:30:00',2,8.8),
  ('Perran Sands Holiday Park','perransand@gmail.com','2600','10:00:00','14:00:00',3,9.0),
  ('Riviere Sands Holiday Park','rivieresand@gmail.com','3900','11:30:00','15:30:00',4,9.1),
  ('Devon Cliffs Holiday Park','devoncliffs@gmail.com','850','10:30:00','14:30:00',5,7.9),
  ('Littlesea Holiday Park','littleseaholiday@gmail.com','4000','12:00:00','17:00:00',6,9.7);
INSERT INTO address ( address_line1, address_line2, city, post_code)
 VALUES
 ('46','Fleetwood Road', 'Fleetwood', 'FY7 8JY'),
 ('189','Mythop Road', 'Blackpool', 'FY4 4XN'),
 ('45','Perranporth', 'Cornwall', 'TR6 0AQ'),
 ('67', 'Riviere Towans','Hayle','TR27 5AX'),
 ('98','Sandy Bay','Exmouth','EX8 5BT'),
 ('154','Lynch Lane','Dorset','DT4 9DT');
INSERT INTO pitches (pitchType_id, swimming_pool, seaside, park_id)
VALUES
(2,True,False,1),
(2,True,True,2),
(1,False,True,3),
(1,True,True,4),
(3,False,True,5),
(4,True,True,6);

INSERT INTO pitchType (pitch_name, pitch_cost, pitch_description, pet_friendly)
VALUES
('Super Delux',100.00,'Seaside,Fully-serviced gravel touring pitch with awning',False),
('Premium',90.00,'Fully-serviced hardstanding and grass pitch',True),
('Super',80.00,'Hard standing Super pitch with awning',True),
('Comfort',50.00,'Non-electric grass pitch',True);


INSERT INTO bookings (booking_date, nights_count, checkin_date, checkout_date, card_payment, booking_amount, park_id, guest_id)
VALUES
('2023-01-04',10,'2023-04-10','2023-04-20',True,1000.00,4,5),
('2023-01-12',14,'2023-08-01','2023-08-15',True,980.00,3,1),
('2023-01-15',4,'2023-06-25','2023-06-29',True,360.00,6,2),
('2023-01-19',6,'2023-05-05','2023-05-11',True,480.00,6,3),
('2023-02-01',17,'2023-09-11','2023-09-28',True,850.00,2,5),
('2023-02-03',8,'2023-08-02','2023-08-10',True,800.00,1,4),
('2023-02-10',3,'2023-07-13','2023-07-16',True,270.00,2,2),
('2023-02-13',1,'2023-03-17','2023-03-18',False,100.00,4,1),
('2023-02-17',7,'2023-07-14','2023-07-21',True,490.00,5,5),
('2023-02-23',9,'2023-10-01','2023-10-19',True,900.00,3,6),
('2023-02-26',11,'2024-07-07','2024-07-18',True,880.00,4,4),
('2023-03-03',2,'2023-08-19','2023-08-21',True,200.00,6,1),
('2023-03-13',23,'2023-07-01','2023-07-24',True,1350.00,4,3);
 INSERT INTO guest (first_name, last_name, phone_number, email, address_id)
 VALUES
 ('Crystal','Duffy','545-1292','Cduff@mail.com',6),
 ('Isla','Chase','255-1212','islachas@mail.com',6),
 ('	Pedro','Mueller','432-1212','Pemuel@mail.com',1),
 ('Karson','Hartman','775-1212','Karhard@mail.com',1),
 ('Julie', 'Smith','555-12992','julismith@mail.com',1),
 ('James', 'Andrews','545-1212','jamesand@mail.com',5),
 ('Jack', 'Oakes','5005-1212','Jackoak@mail.com',5),
 ('Jasper', 'Wolf','577-1212','Jaswolf@mail.com',2),
 ('Jon', 'Flanders','555-1212','jon@mail.com',4),
 ('Sam', 'Smith','555-3344','ssmith@mail.com',4),
 ('Thomas','Fisher','785-1212','Tfish@mail.com',4),
 ('Luck','Mins','5009-1212','Lmins@mial.com',4),
 ('Alen','Port','665-1212','Aport@mail.com',3),
 ('Leanne','Prins','155-1212','Lepris@mail.com',1),
 ('Kate','Moor','3355-1212','Kmoor@mail.com',6),
 ('Julie', 'Hoops', '755-1212','Julihoo@mail.com',4),
 ('Kim','Jonson', '225-1212','Kjons@mail.com',1),
 ('Reachel','Trond', '555-1992','Rtrond@mail.com',3);

 INSERT INTO pitchBooked( bookings_id, pitchType_id)
 VALUES
 (1,4),
 (2,2),
 (3,1),
 (4,3),
 (5,4),
 (6,3),
 (7,2),
 (8,2),
 (9,4),
 (10,3),
 (11,2),
 (12,1),
 (13,2);
 select * from bookings;
 
 
 
 select * from guest;
 
 
 -- Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis
 -- Unique cities in our address list, where those cities contains  'm' , 'l' or 'w'
SELECT 
	DISTINCT(A.City) AS 'City'
FROM
	address AS A
GROUP BY A.City
HAVING (A.City LIKE '%m%' OR A.City LIKE '%l%' OR A.City LIKE '%w%')
ORDER BY A.City DESC;

-- In your database, create a stored function that can be applied to a query in your DB
-- step:1 Minimumum , maximum and average booking amount
SELECT
	MIN(booking_amount) AS 'Minimum amount', 
    MAX(booking_amount) AS 'Maximun amount', 
    AVG(booking_amount) AS 'Average amount'
FROM
	bookings;
 
 
 -- step 2 Create a stored function to calculate discount eligibility based on  Booking Amount
DELIMITER //
CREATE FUNCTION discount_eligibility(
      booking_amount DECIMAL(10,2)
	) 
RETURNS VARCHAR(20)
DETERMINISTIC
	BEGIN
    DECLARE guest_discount_status VARCHAR(20);
    IF booking_amount < 400 THEN
        SET guest_discount_status = 'NO';
    ELSEIF (booking_amount >= 400 AND 
            booking_amount <= 800) THEN
        SET guest_discount_status = 'YES - 10%';
    ELSEIF (booking_amount > 800 AND booking_amount <= 1000) THEN
        SET guest_discount_status = 'YES - 20%';
	ELSEIF (booking_amount > 1000) THEN
		SET guest_discount_status = 'YES - 25%';
    END IF;
    RETURN (guest_discount_status);
	END//booking_amount
DELIMITER ;
-- Step 3: Get the first name, last name, email address and discount eligibility information for guests to send out a voucher
SELECT 
	G.first_name AS 'Guest First Name',
    G.last_name AS 'Guest Last Name',
    G.email AS 'Guest Email Address',
    B.booking_amount AS 'Total Booking Amount',
    discount_eligibility(booking_amount) AS 'Discount eligibility'
FROM
    guest AS G
INNER JOIN 
	bookings AS B
ON G.id = B.id;

-- In your database, create a stored procedure and demonstrate how it runs
-- First 2 stored procedure is to get the whole list of staff emails and guest emails to be able to quickly send a bulk email to all

DELIMITER //
CREATE PROCEDURE All_Park_Email_List()
BEGIN
	SELECT email FROM park;
END //
DELIMITER ;

CALL All_Park_Email_List();

DELIMITER //
CREATE PROCEDURE All_guest_email_List()
BEGIN
	SELECT email FROM guest;
END //
DELIMITER ;

CALL All_Guest_Email_List();


-- Create a view that uses at least 3-4 base tables; prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis.-- 
-- I create a view that joins 4 tables to show all of the pitch reservation information together
CREATE VIEW Full_Booking_Information
AS
	SELECT 
		B.checkin_date,
        B.checkout_date,
        B.booking_amount,
        G.first_name,
        G.last_name,
        G.phone_number,
        G.email,
		P.pitch_name,
        P.pitch_cost,
        P.pet_friendly,
        P.pitch_description,
        PK.park_name,
        PK.checkin_time,
        PK.checkout_time
	FROM bookings AS B
    LEFT JOIN
		guest AS G
		ON B.guest_id = G.id
    LEFT JOIN 
		pitchBooked AS PB
        ON B.id = PB.id
	LEFT JOIN
		pitchType AS P
        ON PB.pitchType_id = P.id
	LEFT JOIN
		park AS PK
        ON B.park_id = PK.id;
        
SELECT * FROM Full_Booking_Information;

-- Extra information to inform guest which parks are pet friendly
SELECT DISTINCT 
	FB.First_Name,
    FB.Last_Name,
    FB.Phone_Number, 
    FB.Email
FROM Full_Booking_Information AS FB
WHERE pet_friendly = TRUE;

-- Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis
-- What is the first name, last name, email address  of guests who booked 2 or more pitches.  
SELECT 
	G.First_Name AS 'First Name',
    G.Last_Name AS 'Last Name',
    G.email AS 'Email Address'
FROM guest AS G
WHERE G.id IN
	(SELECT DISTINCT B.guest_id
	FROM
	bookings AS B
    WHERE B.park_id >= 2);


-- In your database, create a trigger and demonstrate how it runs
-- I will be using a before insert trigger to change the data inserted into tables to be consistent and in line with reporting requirements. 
DELIMITER //
CREATE TRIGGER Guest_Details
BEFORE INSERT 
ON guest FOR EACH ROW
BEGIN
SET NEW.First_Name = TRIM(CONCAT(UPPER(SUBSTRING(NEW.first_Name,1,1)), LOWER(SUBSTRING(NEW.first_Name,2))));
SET NEW.Last_Name = TRIM(CONCAT(UPPER(SUBSTRING(NEW.last_Name,1,1)), LOWER(SUBSTRING(NEW.last_Name,2))));
END;
//
DELIMITER ;

INSERT INTO guest(first_name,last_name, phone_number, email, address_id)
VALUES
('adaM', 'wiLf','76858463','adamwil@gmail.com', 3);
select * from guest;
DELETE FROM guest WHERE first_name = 'Adam';










