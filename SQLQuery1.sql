CREATE DATABASE CourierManagement;
USE CourierManagement;
go


-----------TASK 1--------------------

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    ContactNumber VARCHAR(20),
    Address TEXT
);

CREATE TABLE Courier (
    CourierID INT IDENTITY(1,1) PRIMARY KEY,
    SenderName VARCHAR(255),
    SenderAddress TEXT,
    ReceiverName VARCHAR(255),
    ReceiverAddress TEXT,
    Weight DECIMAL(5,2),
    Status VARCHAR(50),
    TrackingNumber VARCHAR(20) UNIQUE,
    DeliveryDate DATE
);


CREATE TABLE CourierServices (
    ServiceID INT IDENTITY(1,1) PRIMARY KEY,
    ServiceName VARCHAR(100),
    Cost DECIMAL(8,2)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    ContactNumber VARCHAR(20),
    Role VARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE Location (
    LocationID INT IDENTITY(1,1) PRIMARY KEY,
    LocationName VARCHAR(100),
    Address TEXT
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);


INSERT INTO Users (Name, Email, Password, ContactNumber, Address)
VALUES 
('Charlie Brown', 'charlie@email.com', 'pass789', '3456789012', '789 Pine St, TX'),
('David White', 'david@email.com', 'pass111', '4567890123', '321 Maple St, FL'),
('Eve Black', 'eve@email.com', 'pass222', '5678901234', '654 Birch St, CA'),
('Frank Green', 'frank@email.com', 'pass333', '6789012345', '987 Cedar St, WA'),
('Grace Adams', 'grace@email.com', 'pass444', '7890123456', '159 Elm St, CO'),
('Hank Miller', 'hank@email.com', 'pass555', '8901234567', '753 Spruce St, NV'),
('Ivy Wilson', 'ivy@email.com', 'pass666', '9012345678', '258 Palm St, AZ'),
('Jack Carter', 'jack@email.com', 'pass777', '1230984567', '369 Redwood St, MI');

INSERT INTO Courier (SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate)
VALUES 
('Charlie Brown', '789 Pine St, TX', 'David White', '321 Maple St, FL', 5.0, 'In Transit', 'TRK1002', '2025-03-15'),
('Eve Black', '654 Birch St, CA', 'Frank Green', '987 Cedar St, WA', 1.2, 'Pending', 'TRK1003', '2025-03-18'),
('Grace Adams', '159 Elm St, CO', 'Hank Miller', '753 Spruce St, NV', 3.8, 'Delivered', 'TRK1004', '2025-03-12'),
('Ivy Wilson', '258 Palm St, AZ', 'Jack Carter', '369 Redwood St, MI', 4.5, 'Out for Delivery', 'TRK1005', '2025-03-17'),
('David White', '321 Maple St, FL', 'Alice Johnson', '123 Main St, NY', 2.0, 'Delivered', 'TRK1006', '2025-03-09'),
('Bob Smith', '456 Oak St, LA', 'Charlie Brown', '789 Pine St, TX', 6.3, 'Pending', 'TRK1007', '2025-03-19'),
('Hank Miller', '753 Spruce St, NV', 'Ivy Wilson', '258 Palm St, AZ', 2.9, 'In Transit', 'TRK1008', '2025-03-14'),
('Frank Green', '987 Cedar St, WA', 'Eve Black', '654 Birch St, CA', 3.0, 'Delivered', 'TRK1009', '2025-03-11'),
('Jack Carter', '369 Redwood St, MI', 'Grace Adams', '159 Elm St, CO', 5.5, 'Out for Delivery', 'TRK1010', '2025-03-16');


INSERT INTO CourierServices (ServiceName, Cost)
VALUES 
('Standard Shipping', 10.00),
('Express Shipping', 25.00),
('Overnight Shipping', 40.00),
('Same-Day Delivery', 50.00),
('International Shipping', 100.00),
('Two-Day Shipping', 30.00),
('Local Pickup', 5.00),
('Business Express', 20.00),
('Priority Handling', 15.00),
('Freight Service', 150.00);

INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)
VALUES
(1,'John Manager', 'johnm@courier.com', '1112223333', 'Manager', 60000.00),
(2,'Lisa Supervisor', 'lisa@courier.com', '2223334444', 'Supervisor', 50000.00),
(3,'Mike Dispatcher', 'mike@courier.com', '3334445555', 'Dispatcher', 40000.00),
(4,'Nancy Driver', 'nancy@courier.com', '4445556666', 'Driver', 35000.00),
(5, 'Steve Clerk', 'steve@courier.com', '5556667777', 'Clerk', 30000.00),
(6,'Emma Coordinator', 'emma@courier.com', '6667778888', 'Coordinator', 45000.00),
(7,'George Handler', 'george@courier.com', '7778889999', 'Handler', 32000.00),
(8,'Rachel Assistant', 'rachel@courier.com', '8889990000', 'Assistant', 28000.00),
(9,'Kevin Loader', 'kevin@courier.com', '9990001111', 'Loader', 25000.00),
(10,'Sophia Packer', 'sophia@courier.com', '0001112222', 'Packer', 27000.00)
;

INSERT INTO Location (LocationName, Address)
VALUES 
('New York Hub', '123 Warehouse St, NY'),
('Los Angeles Hub', '456 Depot Ave, LA'),
('Texas Distribution', '789 Logistics Rd, TX'),
('Florida Warehouse', '321 Cargo Blvd, FL'),
('California Center', '654 Supply Ln, CA'),
('Washington Storage', '987 Transit Ct, WA'),
('Colorado Hub', '159 Freight St, CO'),
('Nevada Dispatch', '753 Delivery Dr, NV'),
('Arizona Logistics', '258 Express Rd, AZ'),
('Michigan Depot', '369 Transport Ave, MI');

INSERT INTO Payment (CourierID, LocationID, Amount, PaymentDate)
VALUES 
(1, 1, 50.00, '2025-03-10'),
(2, 2, 75.00, '2025-03-15'),
(3, 3, 20.00, '2025-03-18'),
(4, 4, 45.00, '2025-03-12'),
(5, 5, 60.00, '2025-03-17'),
(6, 6, 55.00, '2025-03-09'),
(7, 7, 30.00, '2025-03-19'),
(8, 8, 40.00, '2025-03-14'),
(9, 9, 90.00, '2025-03-11'),
(10, 10, 100.00, '2025-03-16');




------TASK 2-------

-- 1. List all customers
SELECT * FROM Users;

-- 2. List all orders for a specific customer 
SELECT * FROM Courier WHERE SenderName = 'Alice Johnson';

-- 3. List all couriers
SELECT * FROM Courier;

-- 4. List all packages for a specific order 
SELECT * FROM Courier WHERE CourierID = 1;

-- 5. List all deliveries for a specific courier
SELECT * FROM Courier WHERE CourierID = 2;


-- 6. List all undelivered packages
SELECT * FROM Courier WHERE Status != 'Delivered';


-- 7. List all packages scheduled for delivery today
SELECT * FROM Courier WHERE DeliveryDate = CONVERT(DATE, GETDATE());

-- 8. List all packages with a specific status (Example: 'In Transit')
SELECT * FROM Courier WHERE Status = 'In Transit';

-- 9. Calculate the total number of packages for each courier
SELECT SenderName, COUNT(*) AS TotalPackages FROM Courier GROUP BY SenderName;

-- 10. Find the average delivery time for each courier
SELECT SenderName, 
       AVG(DATEDIFF(DAY, '2025-03-15', DeliveryDate)) AS AvgDeliveryTime 
FROM Courier 
GROUP BY SenderName;


-- 11. List all packages with a specific weight range 
SELECT * FROM Courier WHERE Weight BETWEEN 2.0 AND 5.0;


-- 12. Retrieve employees whose names contain 'John'
SELECT * FROM Employee WHERE Name LIKE '%John%';


-- 13. Retrieve all courier records with payments greater than $50
SELECT c.* FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.Amount > 50;



------TASK 3 -------

--14--
SELECT EmployeeID, COUNT(*) AS TotalCouriersHandled
FROM Courier
GROUP BY EmployeeID;


