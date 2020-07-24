-- Step1: Create table and insert the values:
CREATE TABLE date_practice (
  date DATETIME NOT NULL,
  period INT NULL,
  PRIMARY KEY (date));
  
INSERT INTO date_practice (date) VALUES ('2020-01-02');
INSERT INTO date_practice (date) VALUES ('2020-02-02');
INSERT INTO date_practice (date) VALUES ('2020-03-06');
INSERT INTO date_practice (date) VALUES ('2020-04-08');
INSERT INTO date_practice (date) VALUES ('2020-04-12');
INSERT INTO date_practice (date) VALUES ('2020-05-20');
INSERT INTO date_practice (date) VALUES ('2020-08-05');
INSERT INTO date_practice (date) VALUES ('2020-10-29');
INSERT INTO date_practice (date) VALUES ('2020-12-31');
INSERT INTO date_practice (date) VALUES ('2021-06-29');
INSERT INTO date_practice (date) VALUES ('2021-07-15');

SELECT * from date_practice;

               
               
-- Step2: Set all the values in the period to 0. Do it everytime there is a new record added in the database.
UPDATE date_practice SET period = 0;
SELECT * from date_practice;


               
-- Step3: Repeat from here to the last line for final output
DECLARE @start_date DATETIME 
set @start_date =  (SELECT Top(1) date FROM date_practice ORDER BY date);

DECLARE @end_date DATETIME 
set @end_date = DATEADD(MONTH, 3, @start_date );

DECLARE @counter INT
set @counter = 1;
               
DECLARE @limit INT
SELECT @limit = COUNT(DISTINCT(date)) FROM date_practice where period = 0;

WHILE (@limit != 0)
BEGIN

UPDATE date_practice
SET period = @counter
WHERE date BETWEEN @start_date AND @end_date

set @counter = @counter + 1
set @start_date = (SELECT Top(1) date FROM date_practice where period = 0 ORDER BY date)
set @end_date = DATEADD(MONTH, 3, @start_date)
set @limit = (SELECT COUNT(DISTINCT(date)) FROM date_practice where period = 0)

END;

SELECT * from date_practice;
