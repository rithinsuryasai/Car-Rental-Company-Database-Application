# Car-Rental-Company-Database-Application
---
  
DESCRIPTION
---
This project is about, the design and implementation a database for keeping track of information about a car rental company.
   
* First the design of an EER schema diagram takes place for this database application. 
* Then, we mapped the EER schema into a relational database schema and implemented it on MYSQL.
* Finally, loaded some data into the database, and created some queries and updated the transactions.

INTRODUCTION
---
This application allows the user to rent a car based on car type and model. The customer will be allowed to rent the car on weekly basis or daily basis and the price depends on the type of the car selected. 
#### 1.1	Requirements:
a.	Rental company should have cars which should be rented.  
b.	Each car should belong to any one of the type.  
c.	Customer should be either Individual or Bank and can rent based on car type.  
d.	Based on car type its weekly rate and daily rental rate will be displayed.  
e.	Customer can select the car of his choice based on the budget and schedule it for rent whenever he needs it.   
f.	Car price will be calculated based on car type, rental basis and total days/weeks.  
g.	Once the car is returned it will be available for rent for the customers again.  

#### 1.2	Entities:
##### a. CUSTOMER:
1)Each customer has unique id number. Id_no  
2)And a phone number: Phone  
3)The customer can be individuals or companies.  
4)Individual: It has initial and last name: Initial, Lname  
5)Company: It has only company name: Cname   
##### b. CAR:
1)Car has a vehicleId, Model and year: Vehicle_id, Model, Year  
2)The car will also have an available start and end dates: available_start_date, available_end_date.
 
##### c. CAR TYPE:
1)A car can be rented on weekly basis or daily basis: weekly_rate, daily_rate  
2)Car can be of any of the six types: Compact, Medium, Large, Suv, Truck, Van, Type_Id  
 
##### d. OWNER:
1)Each car has a unique idno: Owner_id.  
2)Each car can be owned by rentalcompany, bank or individual.  
3)Rental Company: The rental company has only a name: Cname  
4)Bank: bank has only a name: Bname  
5)Individual: Individual has a Fname and Lname
  
#### 1.3	Relations:
##### a.	OWNS:
Car which is available is owned by either Rental Company, Bank or an Individual. So, each owner can own more than one car but a car can have only one owner. The relationship between these two entities is 1:N relationship. And CAR participates totally in owns relationship, as every car has to be owned by some source.
  
##### b.	RENTS:
Each car can be rented by more than one customer and a customer can rent more than one car. Therefore, the relationship between these two entities is M:N. This relation keeps track of Weekly_rate, Daily_rate, active or scheduled activity in order to calculate Amount_due.
  
##### c.	BELONGS: 
Every car in CAR entity belongs to any one of the CAR type. Each car type has its own weekly rate and daily rate. Each car type can belong to more than one car. Therefore, the relationship between these two entities is N:1 and car entity totally participates in this relation. 
  
#### 1.4	Assumptions:
a.	Every car in CAR entity must have an owner from OWNER entity.  
b.	Every car in CAR entity should belong to any one of six car types.  
c.	Each car can be rented by more than one customer and each customer can rent more than one car.  
d.	Assuming scheduled and active attributes as a boolean values representing cars which has been booked prior and cars which are on roads taken by customers.  
e.	Amount_due is calculated based on weekly_rate*noofweeks for weekly rental option. Similarly, for daily rental options Amount_due is calculated based on daily_rate * noofdays.  
f.	Noofweeks and Noofdays are calculated based on Start_date and Return_date.  














EER DIAGRAM 
---
   
![eer diagram](https://user-images.githubusercontent.com/11136682/42360629-8a0ca770-80af-11e8-9163-b18d432b7ba0.png)
   
 

EER TO RELATIONAL MAPPING:
---   
![eer to relation mapping](https://user-images.githubusercontent.com/11136682/42360641-9d038f92-80af-11e8-972a-1485a4ada346.png)
  
## AFTER NORMALIZATION:
    
    
![after normalization](https://user-images.githubusercontent.com/11136682/42360650-a9321040-80af-11e8-8041-fffdda513255.png)
  
   
#### Create Table Statements:

##### OWNER
```
CREATE TABLE OWNER (
Owner_id INT NOT NULL,
Owner_type VARCHAR (20),
Cname VARCHAR (20),
Bname VARCHAR (20),
Fname VARCHAR (20),
Lname VARCHAR(20),
PRIMARY KEY(Owner_id))
```
##### CAR
```
CREATE TABLE CAR (
Vehicle_id NUMERIC (4) NOT NULL,
Model VARCHAR (10),
Year NUMERIC (4),
Type_id INT,
PRIMARY KEY(Vehicle_id),
FOREIGN KEY(Type_id) REFERENCES CARTYPE(Type_id))
```
##### VEHICLE_OWNER
```
CREATE TABLE VEHICLE_OWNER(
Vehicle_id NUMERIC (4) NOT NULL,
Owner_id INT,
PRIMAY KEY(Vehicle_id, Owner_id),
FOREIGN KEY(Vehicle_id) REFERENCES CAR (Vehicle_id),
FOREIGN KEY(Owner_id) REFERENCES OWNER(Owner_id))
```


##### AVAILABILITY
```
CREATE TABLE AVAILABILITY(
Vehicle_id NUMERIC (4) NOT NULL,
Available_start DATE,
Available_end DATE,
PRIMARY KEY(Vehicle_id),
FOREIGN KEY(Vehicle_id) REFERENCES CAR (Vehicle_id))
```
##### CARTYPE
```
CREATE TABLE CARTYPE (
Type_id INT,
Weekly_rate DECIMAL(5,2),
Daily_rate DECIMAL(5,2),
Car_type VARCHAR (20)
PRIMARY KEY(Type_id))
```
##### CUSTOMER
```
CREATE TABLE CUSTOMER (
Idno INT,
Phone VARCHAR (12),
Customer_type VARCHAR (20),
Initial CHAR (1),
Lname VARCHAR (20),
Cname VARCHAR (20)
PRIMARY KEY(Idno))
```
##### RENTS
```
CREATE TABLE RENTS (
Customer_id INT,
Vehicle_id NUMERIC (4),
Start_date DATE,
Return_date DATE,
Amount_due DECIMAL,
Noofdays INT,
Noofweeks INT,
Dailyrent DECIMAL(5,2),
Weeklyrent DECIMAL(5,2),
Active BOOLEAN,
Scheduled BOOLEAN,
PRIMARY KEY (Customer_id, Vechicle_id),
FOREIGN KEY(Customer_id) REFERENCES CUSTOMER(Idno),
FOREIGN KEY(Vehicle_id) REFERENCES CAR(Vehicle_id))
```
