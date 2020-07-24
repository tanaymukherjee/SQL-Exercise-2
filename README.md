# SQL-Exercise-2
In this exercise we will try to answer a specific data requirement.

## Exercise: 
One of my friend, Youran, got a query request from her company wherein they wanted to look into a data to find no of records/booking such that:
1. It should look for the first ever date in the date field and then based on that date create a 3 month rolling window
2. Now, in the period column we must have period as 1 for the dates that fall between the first date and the next 3 months window.
3. Then we look for thr first date that falls outside this window and take that as the initial point and again create a 3 month window.
4. Next, we repeat step 2 and mark that period as 2.
5. The end date of one period not necessarily connects with the start date of next period.
6. Basically, we create 3 month rolling window but it is based on the first date that comes in the date column which is outside the pervioues rolling window.
7. We have to put a sequence which makes it work for any number of records for any situation irrespective of how the dates are connected.
8. See the image below to understand the flow
![1e743644-01c4-4f4d-bbe7-531e2d60f2c4](https://user-images.githubusercontent.com/6689256/88372795-9a74f000-cd64-11ea-9556-52f478e8c5ce.jpg)

## Steps to replicate:
