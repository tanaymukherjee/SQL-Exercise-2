# SQL-Exercise-2
In this exercise we will try to answer a specific data requirement.

## Exercise: 
One of my friend, Youran, got a query request from her company wherein they wanted to look into a data to find number of records/bookings such that:
1. It should look for the first ever date in the date field and then based on that date create a 3 month rolling window
2. Now, in the period column we must have period as 1 for the dates that fall between the first date and the next 3 months window.
3. Then we look for thr first date that falls outside this window and take that as the initial point and again create a 3 month window.
4. Next, we repeat step 2 and mark that period as 2.
5. The end date of one period not necessarily connects with the start date of next period.
6. Basically, we create 3 month rolling window but it is based on the first date that comes in the date column which is outside the pervioues rolling window.
7. We have to put a sequence which makes it work for any number of records for any situation irrespective of how the dates are connected.
8. See the image below to understand the flow
![1e743644-01c4-4f4d-bbe7-531e2d60f2c4](https://user-images.githubusercontent.com/6689256/88373047-1e2edc80-cd65-11ea-9856-4b63b0084eea.jpg)


## Steps to replicate:
Steps to replicate:
1. Go to https://sqliteonline.com/ and connect to "MS SQL" because that's what I used for here.

2. Run these queries:
```
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
```

3. Delete all the queries from that tab and make it blank.

4. Run the following queries:
```
UPDATE date_practice SET period = 0;
SELECT * from date_practice;
```

5. Delete all the queries from that tab and make it blank.

6. Run the final set of queries:
```
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
```
