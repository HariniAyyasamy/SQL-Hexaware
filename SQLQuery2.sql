-- 1. List all customers
SELECT * FROM Users;

-- 2. List all orders for a specific customer
SELECT * FROM Couriers WHERE SenderName = 'John Doe';

-- 3. List all couriers
SELECT * FROM Couriers;

-- 4. List all packages for a specific order
-- Assuming "order" means specific CourierID
SELECT * FROM Couriers WHERE CourierID = 1;

-- 5. List all deliveries for a specific courier
SELECT * FROM Couriers WHERE TrackingNumber = 'TRK12345';

-- 6. List all undelivered packages
SELECT * FROM Couriers WHERE Status != 'Delivered';

-- 7. List all packages that are scheduled for delivery today
SELECT * FROM Couriers WHERE DeliveryDate = CAST(GETDATE() AS DATE);

-- 8. List all packages with a specific status
SELECT * FROM Couriers WHERE Status = 'In Transit';

-- 9. Calculate the total number of packages for each courier
SELECT SenderName, COUNT(*) AS TotalPackages 
FROM Couriers
GROUP BY SenderName;

-- 10. Find the average delivery time for each courier
SELECT CourierID, AVG(DATEDIFF(DAY, DeliveryDate, GETDATE())) AS AvgDeliveryTime
FROM Couriers
GROUP BY CourierID;

-- 11. List all packages with a specific weight range
SELECT * FROM Couriers WHERE Weight BETWEEN 1.0 AND 3.0;

-- 12. Retrieve employees whose names contain 'John'
SELECT * FROM Employees WHERE Name LIKE '%John%';

-- 13. Retrieve all courier records with payments greater than $50
SELECT C.*
FROM Couriers C
INNER JOIN Payments P ON C.CourierID = P.CourierID
WHERE P.Amount > 50;


