CREATE DATABASE GRADED_PROJECT4;

USE GRADED_PROJECT4;

CREATE TABLE PASSENGER 
(Passenger_name varchar (50),
 Category varchar (50),
 Gender varchar  (50),
 Boarding_City varchar  (50),
 Destination_City varchar  (50),
 Distance int Primary Key,
 Bus_Type varchar (50) 
);

CREATE TABLE PRICE
(
 Bus_Type varchar (50),

 Distance int,
  FOREIGN KEY (Distance) REFERENCES PASSENGER(Distance),
 Price INT
 );
 
 drop table PASSENGER;
 
 insert into PASSENGER values ('Sejal','AC','F','Bengaluru','Chennai','350','Sleeper');
 
 insert into PASSENGER values ('Anmol', 'Non-AC','M' ,'Mumbai' ,'Hyderabad' ,'700 ','Sleeper');
 
insert into PASSENGER values ('Pallavi','AC','F','Panaji','Bengaluru','600','Sleeper');

insert into PASSENGER values ('Khusboo','AC','F' ,'Chennai',' Mumbai',' 1500', 'Sleeper ') ;

insert into PASSENGER values ('Udit','Non-AC ','M','Trivandrum','panaji ','1000 ','Sleeper ');

insert into PASSENGER values ('Ankur ','AC','M','Nagpur','Hyderabad', '500' ,'Sitting ');

insert into PASSENGER values ('Hemant','Non-AC','M', 'panaji', 'Mumbai', '701', 'Sleeper');

insert into PASSENGER values ('Manish','Non-AC','M', 'Hyderabad',  'Bengaluru', '501', 'Sitting');

insert into PASSENGER values ('Piyush','AC','M', 'Pune',  'Nagpur', '702', 'Sitting');

insert into PRICE values ('Sleeper','350 ','770   ');

insert into PRICE values ('Sleeper','501 ','1100  ');

insert into PRICE values ('Sleeper','600 ','1320  ');

insert into PRICE values ('Sleeper','702 ','1540  ');
insert into PRICE values ('Sleeper','1000',' 2200 ');
insert into PRICE values ('Sleeper','1200',' 2640 ');
insert into PRICE values ('Sleeper','1500',' 2700 ');
insert into PRICE values ('Sitting','500 ','620   ');
insert into PRICE values ('Sitting','600 ','744   ');
insert into PRICE values ('Sitting','700 ','868   ');
insert into PRICE values ('Sitting','1000',' 1240 ');
insert into PRICE values ('Sitting','1200',' 1488 ');
insert into PRICE values ('Sitting','1500',' 1860 ');

SELECT 
COUNT(CASE WHEN Gender='M' THEN 1  END) As Male,
COUNT(CASE WHEN Gender='F' THEN 1  END) As Female
FROM PASSENGER WHERE DISTANCE >=600;

SELECT min(price) FROM PRICE where bus_type ='Sleeper';

SELECT PASSENGER_NAME FROM PASSENGER WHERE PASSENGER_NAME LIKE 'S%';

SELECT PASSENGER.PASSENGER_NAME,PASSENGER.Boarding_City,PASSENGER.Destination_City,PASSENGER.Bus_Type,PRICE.Price 
FROM PASSENGER 
JOIN PRICE ON PASSENGER.DISTANCE =PRICE.DISTANCE;

SELECT PASSENGER.PASSENGER_NAME,PRICE.Price 
FROM PASSENGER 
JOIN PRICE ON PASSENGER.DISTANCE =PRICE.DISTANCE WHERE PASSENGER.DISTANCE ='1000';

SELECT PASSENGER.PASSENGER_NAME,PASSENGER.Boarding_City,PASSENGER.Destination_City,PASSENGER.Bus_Type,PRICE.Price 
FROM PASSENGER 
JOIN PRICE ON PASSENGER.DISTANCE =PRICE.DISTANCE
WHERE PASSENGER_NAME ='Pallavi' ;

SELECT DISTINCT(DISTANCE) FROM PASSENGER ORDER BY DISTANCE DESC;

SELECT PASSENGER_NAME,DISTANCE*100/(SELECT SUM(DISTANCE) FROM PASSENGER) AS DISTANCE_PERCENT FROM PASSENGER group by PASSENGER_NAME;

SELECT PASSENGER.PASSENGER_NAME,PASSENGER.Boarding_City,PASSENGER.Destination_City,PASSENGER.Bus_Type,PRICE.Price 
FROM PASSENGER 
JOIN PRICE ON PASSENGER.DISTANCE =PRICE.DISTANCE;
 


SELECT DISTANCE,Price,
CASE
    WHEN DISTANCE > 1000 THEN 'The quantity is greater than 30'
    WHEN DISTANCE < 1000 and DISTANCE >=500 THEN 'Average cost'
    ELSE 'Cheap'
END AS Expense_Report 
FROM PRICE;




select * from price;

