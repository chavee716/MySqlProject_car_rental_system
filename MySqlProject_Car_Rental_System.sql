
create database Car_Rental_System;
use Car_Rental_System;

create table EMPLOYEE(
Employee_ID varchar(15) not null,
Emply_Name varchar(30)  not null,
Email varchar(30) ,
Salary varchar(10),
Address varchar(50),
Phone varchar(12),
Position varchar(40),
primary key(Employee_ID)
);

INSERT INTO EMPLOYEE (Employee_ID, Emply_Name, Email, Salary, Address, Phone, Position) 
VALUES 
('EMP001', 'Samantha Perera', 'samanthaperera85@gmail.com', '50000', '15A, Flower Road, Colombo 07', '94711223344', 'Manager'),
('EMP002', 'Kumar Silva', 'kumarsilva78@gmail.com', '45000', '25, Mahamaya Mawatha, Kandy', '94722334455', 'Assistant Manager'),
('EMP003', 'Malini Fernando', 'mfernando@gmail.com', '40000', '40, Main Street, Galle', '94733445566', 'Team Leader'),
('EMP004', 'Nimal Rajapaksa', 'nimalrajapaksa94@gmail.com', '35000', '10, Beach Road, Negombo', '94744556677', 'Developer'),
('EMP005', 'Anusha Bandara', 'anushabandara87@gmail.com', '30000', '5B, Green Lane, Jaffna', '94755667788', 'Tester'),
('EMP006', 'Priyantha De Silva', 'priyanthadesilva89@gmail.com', '25000', '30, Temple Road, Anuradhapura', '94766778899', 'Intern'),
('EMP007', 'Shanika Perera', 'shanikaperera82@gmail.com', '60000', '18, Lake Drive, Colombo 03', '94777889900', 'Manager'),
('EMP008', 'Ranil Jayantha', 'raniljayantha91@gmail.com', '55000', '8/1, Hill Street, Kandy', '94788990011', 'Assistant Manager');


create table VEHICLE(
Vehicle_ID varchar(15) not null,
primary key(Vehicle_ID)
);

INSERT INTO VEHICLE (Vehicle_ID) 
VALUES 
('VEH001'),
('VEH002'),
('VEH003'),
('VEH004'),
('VEH005'),
('VEH006'),
('VEH007'),
('VEH008');


create table LOCATION(
Location_ID varchar(15) not null,
Location_Address varchar(50),
Vehicle_ID varchar(15),
foreign key (Vehicle_ID) references VEHICLE(Vehicle_ID) on delete cascade on update cascade,
primary key(Location_ID) 
);

INSERT INTO LOCATION (Location_ID, Location_Address, Vehicle_ID) 
VALUES 
('LOC001', 'Colombo', 'VEH006'),
('LOC002', 'Kandy', 'VEH002'),
('LOC003', 'Galle', 'VEH008'),
('LOC004', 'Jaffna', 'VEH004'),
('LOC005', 'Negombo', 'VEH003'),
('LOC006', 'Matara', 'VEH001'),
('LOC007', 'Kalutara', 'VEH007'),
('LOC008', 'Anuradhapura', 'VEH005');


CREATE TABLE CUSTOMER(
    Customer_ID VARCHAR(15) PRIMARY KEY not null,
    phone VARCHAR(12),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    street VARCHAR(100),
    state VARCHAR(50),
    zip_code VARCHAR(15)
);

INSERT INTO CUSTOMER (Customer_ID, phone, first_name, last_name, street, state, zip_code) 
VALUES 
('CUS001', '94761234567', 'Nadeesha', 'Fernando', '45, Dehiwala Road', 'Dehiwala', '10350'),
('CUS002', '94773245678', 'Chaminda', 'Perera', '28, Panadura Street', 'Panadura', '12500'),
('CUS003', '94785456789', 'Sanduni', 'Rathnayake', '12, Gampaha Lane', 'Gampaha', '11000'),
('CUS004', '94797657890', 'Roshan', 'Silva', '67, Mount Lavinia Road', 'Mount Lavinia', '10370'),
('CUS005', '94719878901', 'Nirosha', 'Kumari', '35, Wattala Avenue', 'Wattala', '11300'),
('CUS006', '94721089012', 'Ajith', 'Bandara', '82, Kottawa Street', 'Kottawa', '10230'),
('CUS007', '94732290123', 'Dilini', 'Fernando', '14, Maharagama Lane', 'Maharagama', '10280'),
('CUS008', '94743401234', 'Sanjeewa', 'Perera', '9/5, Ratnapura Road', 'Ratnapura', '70000');


create table VEHICLE_TYPE(
Vehicle_Record varchar(15) not null,
Vehicle_ID varchar(15),
Made_Year int,
Rental_Cost varchar(15),
Milage int,
Availability varchar(15),
primary key(Vehicle_Record,Vehicle_ID),
foreign key(Vehicle_ID) references VEHICLE(Vehicle_ID) on delete cascade on update cascade
);


INSERT INTO VEHICLE_TYPE (Vehicle_Record, Vehicle_ID, Made_Year, Rental_Cost, Milage, Availability) 
VALUES 
('VR001', 'VEH001', 2017, '4500 LKR', 32000, 'Available'),
('VR002', 'VEH002', 2018, '5000 LKR', 28000, 'Available'),
('VR003', 'VEH003', 2016, '4000 LKR', 35000, 'Unavailable'),
('VR004', 'VEH004', 2019, '5500 LKR', 20000, 'Available'),
('VR005', 'VEH005', 2020, '6000 LKR', 15000, 'Available'),
('VR006', 'VEH006', 2018, '4800 LKR', 26000, 'Unavailable'),
('VR007', 'VEH007', 2017, '4200 LKR', 30000, 'Available'),
('VR008', 'VEH008', 2019, '5500 LKR', 18000, 'Available');


create table INSURANCE(
Insurance_ID varchar(15) not null,
Insurance_Company varchar(50),
Insurance_Plan varchar(15),
Vehicle_Record varchar(15),
primary key(Insurance_ID),
foreign key (Vehicle_Record) references VEHICLE_TYPE(Vehicle_Record) on delete set null on update cascade
);

INSERT INTO INSURANCE (Insurance_ID, Insurance_Company, Insurance_Plan, Vehicle_Record) 
VALUES 
('INS001', 'Ceylinco Insurance', 'Basic Plan', 'VR004'),
('INS002', 'Janashakthi Insurance', 'Premium Plan', 'VR002'),
('INS003', 'HNB Assurance', 'Standard Plan', 'VR003'),
('INS004', 'Sri Lanka Insurance Corporation', 'Gold Plan', 'VR006'),
('INS005', 'Amana Takaful', 'Silver Plan', 'VR005'),
('INS006', 'Union Assurance', 'Family Plan', 'VR008'),
('INS007', 'Softlogic Life Insurance', 'Student Plan', 'VR007'),
('INS008', 'Fairfirst Insurance', 'Senior Plan', 'VR001');


create table DISCOUNT(
Discount_ID varchar(15) not null,
Discount_Type varchar(25),
Discount_Percentage varchar(15),
Start_Date date,
End_Date date,
Vehicle_Record varchar(15),
Vehicle_ID varchar(15),
primary key(Discount_ID),
foreign key(Vehicle_ID) references Vehicle(Vehicle_ID) on delete set null on update cascade
);

INSERT INTO DISCOUNT (Discount_ID, Discount_Type, Discount_Percentage, Start_Date, End_Date, Vehicle_Record, Vehicle_ID) 
VALUES 
('DSC001', 'Early Booking', '10%', '2024-05-01', '2024-06-30', 'VR001', 'VEH001'),
('DSC002', 'Weekend Special', '15%', '2024-04-15', '2024-04-30', 'VR002', 'VEH002'),
('DSC003', 'Monthly Discount', '20%', '2024-04-01', '2024-04-30', 'VR003', 'VEH003'),
('DSC004', 'Family Package', '25%', '2024-05-01', '2024-05-31', 'VR004', 'VEH004'),
('DSC005', 'Corporate Discount', '30%', '2024-05-15', '2024-06-15', 'VR005', 'VEH005'),
('DSC006', 'Holiday Special', '20%', '2024-04-10', '2024-04-20', 'VR006', 'VEH006'),
('DSC007', 'Seasonal Offer', '15%', '2024-06-01', '2024-06-30', 'VR007', 'VEH007'),
('DSC008', 'New Year Promotion', '10%', '2024-12-20', '2025-01-10', 'VR008', 'VEH008');


CREATE TABLE MAINTENANCE_RECORD(
    MaintenanceRecordID VARCHAR(15) not null,
  Vehicle_Record varchar(15),
    MaintenanceDate DATE,
    MaintenanceDetails VARCHAR(80),
    primary key(MaintenanceRecordID,Vehicle_Record),
    FOREIGN KEY(Vehicle_Record) REFERENCES VEHICLE_TYPE(Vehicle_Record) on delete cascade on update cascade
);

INSERT INTO MAINTENANCE_RECORD (MaintenanceRecordID, Vehicle_Record, MaintenanceDate, MaintenanceDetails) 
VALUES 
('MR001', 'VR001', '2024-03-15', 'Oil change and engine tune-up'),
('MR002', 'VR002', '2024-04-02', 'Tire rotation and wheel alignment'),
('MR003', 'VR003', '2024-05-10', 'Brake pad replacement and fluid check'),
('MR004', 'VR004', '2024-06-20', 'Battery replacement and electrical system check'),
('MR005', 'VR005', '2024-07-05', 'Transmission flush and filter change'),
('MR006', 'VR006', '2024-08-12', 'Coolant flush and radiator inspection'),
('MR007', 'VR007', '2024-09-25', 'Suspension inspection and alignment'),
('MR008', 'VR008', '2024-10-18', 'Exhaust system check and repair');


create table BOOKING(
Booking_ID varchar(15) not null,
Empl_ID varchar(15),
Vehicle_ID varchar(15),
Customer_ID varchar(15),
primary key(Booking_ID),
foreign key(Empl_ID) references Employee(Employee_ID) on delete set null on update cascade,
foreign key(Vehicle_ID) references Vehicle(Vehicle_ID) on delete set null on update cascade,
foreign key(Customer_ID) references Customer(Customer_ID) on delete set null on update cascade
);


INSERT INTO BOOKING (Booking_ID, Empl_ID, Vehicle_ID, Customer_ID) 
VALUES 
('B001', 'EMP004', 'VEH004', 'CUS004'),
('B002', 'EMP001', 'VEH001', 'CUS001'),
('B003', 'EMP007', 'VEH007', 'CUS007'),
('B004', 'EMP003', 'VEH003', 'CUS003'),
('B005', 'EMP008', 'VEH008', 'CUS008'),
('B006', 'EMP002', 'VEH002', 'CUS002'),
('B007', 'EMP006', 'VEH006', 'CUS006'),
('B008', 'EMP005', 'VEH005', 'CUS005');


create table RENTAL(
Rental_ID varchar(15) not null,
Rental_Date date,
Return_Date date,
Total_Rental_Cost int,
Booking_ID varchar(15),
primary key(Rental_ID),
foreign key(Booking_ID) references Booking(Booking_ID)
);

INSERT INTO RENTAL (Rental_ID, Rental_Date, Return_Date, Total_Rental_Cost, Booking_ID) 
VALUES 
('R001', '2024-04-15', '2024-04-20', 32000, 'B001'),
('R002', '2024-04-17', '2024-04-22', 29000, 'B002'),
('R003', '2024-04-19', '2024-04-24', 35000, 'B003'),
('R004', '2024-04-21', '2024-04-26', 31000, 'B004'),
('R005', '2024-04-23', '2024-04-28', 34000, 'B005'),
('R006', '2024-04-25', '2024-04-30', 30000, 'B006'),
('R007', '2024-04-27', '2024-05-02', 36000, 'B007'),
('R008', '2024-04-29', '2024-05-04', 33000, 'B008');


CREATE TABLE PAYMENT(
    Payment_ID VARCHAR(15) PRIMARY KEY not null,
    Rental_ID VARCHAR(15) not null,
    Payment INT,
    Cust_ID VARCHAR(15) not null,
    FOREIGN KEY (Rental_ID) REFERENCES RENTAL(Rental_ID) on delete cascade on update cascade,
    FOREIGN KEY (Cust_ID) REFERENCES CUSTOMER(Customer_ID) on delete cascade on update cascade
);

INSERT INTO PAYMENT (Payment_ID, Rental_ID, Payment, Cust_ID) 
VALUES 
('P001', 'R004', 31000, 'CUS004'),
('P002', 'R001', 32000, 'CUS001'),
('P003', 'R008', 33000, 'CUS008'),
('P004', 'R003', 35000, 'CUS003'),
('P005', 'R006', 30000, 'CUS006'),
('P006', 'R007', 36000, 'CUS007'),
('P007', 'R002', 29000, 'CUS002'),
('P008', 'R005', 34000, 'CUS005');

UPDATE EMPLOYEE
SET Salary = '48000'
WHERE Employee_ID = 'EMP002';

UPDATE EMPLOYEE
SET Address = '10C, Yellow Lane, Jaffna'
WHERE Employee_ID = 'EMP005';

DELETE FROM EMPLOYEE
WHERE Employee_ID = 'EMP004';

DELETE FROM VEHICLE
WHERE Vehicle_ID = 'EH006';

UPDATE LOCATION
SET Location_Address = 'Ampara'
WHERE Location_ID = 'LOC004';

UPDATE LOCATION
SET Location_Address = 'Kurunegala'
WHERE Location_ID = 'LOC008';

DELETE FROM LOCATION
WHERE Location_ID = 'LOC005';

UPDATE CUSTOMER
SET first_name = 'Nuwan', last_name = 'Kumarasinghe', zip_code = '12090'
WHERE Customer_ID = 'CUS002';

UPDATE CUSTOMER
SET phone = '94772345678'
WHERE Customer_ID = 'CUS006';

DELETE FROM CUSTOMER
WHERE Customer_ID = 'CUS004';

UPDATE INSURANCE
SET Insurance_Company = 'AIA Insurance'
WHERE Insurance_ID = 'INS008';

UPDATE INSURANCE
SET Insurance_Plan = 'Amana special'
WHERE Insurance_ID = 'INS005';

DELETE FROM INSURANCE
WHERE Insurance_ID = 'INS006';

UPDATE VEHICLE_TYPE
SET Made_Year = '2021', Rental_Cost = '7000 LKR', Milage = '12000', Availability = 'Available' 
WHERE Vehicle_Record = 'VR003';

UPDATE VEHICLE_TYPE
SET Rental_Cost = '5500 LKR'
WHERE Vehicle_Record = 'VR007';

DELETE FROM VEHICLE_TYPE
WHERE Vehicle_Record = 'VR004';

UPDATE MAINTENANCE_RECORD
SET MaintenanceDetails = 'Brake pad replacement and fluid check'
WHERE MaintenanceRecordID = 'MR003';

UPDATE MAINTENANCE_RECORD
SET MaintenanceDate = '2024-07-25'
WHERE MaintenanceRecordID = 'MR005';

DELETE FROM MAINTENANCE_RECORD
WHERE MaintenanceRecordID = 'MR007';

UPDATE Discount
set Discount_Type='Family Package' 
where Discount_ID='DSC008';


UPDATE Discount
set Discount_Percentage='35%' 
where Discount_ID='DSC005';

DELETE from Discount
where Discount_ID='DSC008';

UPDATE Payment
set Payment='31500' 
where Payment_ID='P005';

UPDATE Payment
set Cust_ID='CUS003' 
where Payment_ID='P007';

DELETE from Payment
where Payment_ID='P008';

UPDATE Rental
set Total_Rental_Cost='36500' 
where Rental_ID='R007';

UPDATE Rental
set Return_Date='2024-04-25' 
where Rental_ID='R003';

DELETE from Rental
where Rental_ID='R008';

UPDATE Booking
set Vehicle_ID='VEH005' 
where Booking_ID='B003';

UPDATE Booking
set Customer_ID='CUS002' 
where Booking_ID='B008';

DELETE from Booking
where Booking_ID='B008';

#complex queries

#union
SELECT 'Booking' AS Record_Type, Booking_ID AS ID, Empl_ID AS Employee_ID, Vehicle_ID AS Vehicle_ID, Customer_ID AS Customer_ID, NULL AS Date, NULL AS Amount
FROM BOOKING
UNION
SELECT 'Payment' AS Record_Type, Payment_ID AS ID, NULL AS Employee_ID, NULL AS Vehicle_ID, Cust_ID AS Customer_ID, NULL AS Date, Payment AS Amount
FROM PAYMENT;


#intersection
SELECT b.Booking_ID, r.Rental_ID
FROM BOOKING b
INNER JOIN RENTAL r ON b.Booking_ID = r.Booking_ID
INNER JOIN PAYMENT p ON r.Rental_ID = p.Rental_ID;

# set difference
SELECT Customer_ID
FROM Customer AS C
WHERE Customer_ID NOT IN (
    SELECT Cust_ID
    FROM Payment
);

# division
SELECT Customer_ID, first_name, last_name
FROM CUSTOMER
WHERE NOT EXISTS (
    SELECT *
    FROM BOOKING
    WHERE BOOKING.Customer_ID = CUSTOMER.Customer_ID
);


# natural join 
CREATE VIEW Customer_ID_Info AS
select C.Customer_ID,C.first_name from Customer as C natural join Booking as B where B.Booking_ID ='B002';
SELECT * FROM Customer_ID_Info;

#inner join
CREATE VIEW Customer_Payment_Info AS
select C.Customer_ID, C.first_name from Customer as C inner join Payment as P on C.Customer_ID = P.Cust_ID where P.Payment> 3000 ;
SELECT * FROM Customer_Payment_Info;

#right outer join
CREATE VIEW Maintenance_Vehicle_Info AS
SELECT M.MaintenanceRecordID, M.Vehicle_Record, V.Made_Year, V.Rental_Cost, V.Milage, V.Availability
FROM MAINTENANCE_RECORD M
RIGHT OUTER JOIN VEHICLE_TYPE V ON M.Vehicle_Record = V.Vehicle_Record;

SELECT * FROM Maintenance_Vehicle_Info;

#left outer join
CREATE VIEW Customer_Rental_Info AS
SELECT B.Booking_ID, B.Customer_ID, R.Total_Rental_Cost 
FROM BOOKING B
RIGHT OUTER JOIN RENTAL R ON B.Booking_ID = R.Booking_ID;


SELECT * FROM Customer_Rental_Info;
DROP VIEW Employee_Booking_Info ;
#full outer join
CREATE VIEW Employee_Booking_Info AS
SELECT E.Employee_ID, E.Emply_Name, B.Booking_ID,B.Vehicle_ID
FROM EMPLOYEE AS E
LEFT JOIN BOOKING AS B ON E.EMPLOYEE_ID = B.EMPL_ID
UNION
SELECT E.Employee_ID, E.Emply_Name, B.Booking_ID,B.Vehicle_ID
FROM EMPLOYEE AS E
RIGHT JOIN BOOKING AS B ON E.EMPLOYEE_ID = B.EMPL_ID;
CREATE INDEX veh_i ON Employee(Employee_ID);
EXPLAIN
SELECT * FROM  Employee_Booking_Info;


#OUTER UNION
CREATE VIEW Customer_BookingInfo AS
SELECT Customer_ID , first_name, NULL AS Booking_ID, NULL AS Empl_ID, NULL AS Vehicle_ID
FROM CUSTOMER
UNION ALL
SELECT Customer_ID, NULL AS first_name,Booking_ID,Empl_ID, Vehicle_ID
FROM BOOKING; 
explain
SELECT * FROM Customer_BookingInfo;

CREATE VIEW Rental_Info AS
SELECT Rental_ID
FROM RENTAL
WHERE Booking_ID IN (
    SELECT Booking_ID
    FROM BOOKING
    WHERE Empl_ID IN (
        SELECT Employee_ID
        FROM EMPLOYEE
        WHERE Salary > 45000
    )
);

SELECT * FROM Rental_Info;

CREATE VIEW Cust_Info AS
SELECT first_name, last_name
FROM CUSTOMER
WHERE Customer_ID IN (
    SELECT Cust_ID
    FROM PAYMENT
);
SELECT * FROM Cust_Info;
drop VIEW Rental_Cost_Info2;
CREATE VIEW Rental_Cost_Info AS
SELECT Rental_ID, Rental_Date
FROM RENTAL
WHERE Total_Rental_Cost > 30000
AND Rental_ID IN (
    SELECT Rental_ID
    FROM PAYMENT
);
explain
SELECT * FROM Rental_Cost_Info;
drop view Customer_Rental_Info;
#left outer join
CREATE VIEW Customer_Rental_Info AS
SELECT B.Booking_ID, B.Customer_ID, R.Total_Rental_Cost 
FROM BOOKING B
LEFT OUTER JOIN RENTAL R ON B.Booking_ID = R.Booking_ID;
CREATE INDEX CUS ON BOOKING(BOOKING_ID); 
explain
SELECT * FROM Customer_Rental_Info;



