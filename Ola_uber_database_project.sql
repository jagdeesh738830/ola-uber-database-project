drop table ola;
select * from ola;
create table ola (
Date date,
Time time,
Booking_ID varchar (200),
Booking_Status varchar (300),
Customer_ID varchar(200),
Vehicle_Type varchar(200),
Pickup_Location Varchar(200),
DropLocation varchar(200),
V_TAT int,
C_TAT int,
Canceled_Rides_by_Customer varchar(200),
Canceled_Rides_by_Driver varchar(300),
Incomplete_Rides varchar(100),
Incomplete_Rides_Reason varchar(100),
Booking_Value float,
Payment_Method varchar (100),
Ride_Distance float,
Driver_Ratings float,
Customer_Rating float);

select * from ola;


copy
ola (Date, Time,	Booking_ID,	Booking_Status, Customer_ID, Vehicle_Type, Pickup_Location,DropLocation,
V_TAT,	C_TAT,	Canceled_Rides_by_Customer,	Canceled_Rides_by_Driver,	Incomplete_Rides,	
Incomplete_Rides_Reason,	Booking_Value,	Payment_Method,	Ride_Distance,	Driver_Ratings,	Customer_Rating)
from 'D:\ola file .csv'
delimiter ','
csv header;

select * from ola;

delete from ola where customer_id is null;

SQL Questions:
-- 1. Retrieve all successful bookings:
create view successful_booking as
select * from ola where booking_status = 'Success';

-- 2. Find the average ride distance for each vehicle type:
create view average_rides_distance as
select  vehicle_type, avg(ride_distance) from ola group by vehicle_type;

-- 3. Get the total number of cancelled rides by customers:
create view canceled_by_customer as
select vehicle_type,count(booking_status) from ola where booking_status = 'Canceled by Customer' group by vehicle_type;

select * from ola;
-- 4. List the top 5 customers who booked the highest number of rides:
create view top_5_customer as
select customer_id,count(customer_id) as maximum from ola group by customer_id order by maximum desc limit 5;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view cancelled_by_driver as 
select canceled_rides_by_driver,count(canceled_rides_by_driver) from ola where canceled_rides_by_driver = 'Personal & Car related issue'
group by canceled_rides_by_driver;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_ratings as
select max(driver_ratings)as maximum,min(driver_ratings) as minimum from ola where vehicle_type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI:
create view UPI_payment as
select vehicle_type,count(payment_method) as counting from ola where payment_method = 'UPI' group by vehicle_type;

-- 8. Find the average customer rating per vehicle type:
create view average_customer_rating as 
select vehicle_type,avg(customer_rating) from ola group by vehicle_type;

-- 9. Calculate the total booking value of rides completed successfully:
create view total_booking as
select sum(booking_value) from ola where booking_status = 'Success';

-- 10. List all incomplete rides along with the reason:
create view all_incomplete_rides as
select vehicle_type,incomplete_rides,incomplete_rides_reason from ola where incomplete_rides = 'Yes';


select * from successful_booking;
select * from all_incomplete_rides;
select * from average_rides_distance;
select * from top_5_customer;
select * from canceled_by_customer;
select * from cancelled_by_driver;
select * from max_min_driver_ratings;
select * from UPI_payment;
select * from average_customer_rating;
select * from total_booking;
select * from ola;