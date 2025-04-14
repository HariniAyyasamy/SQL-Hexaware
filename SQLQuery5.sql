--29
SELECT P.*, C.*
FROM Payments P
INNER JOIN Couriers C ON P.CourierID = C.CourierID;

-- 30. Get Payment Details with Location
SELECT P.*, L.*
FROM Payments P
INNER JOIN Locations L ON P.LocationID = L.LocationID;

-- 31. Calculating Total Payments for Each Courier
SELECT C.CourierID, C.SenderName, SUM(P.Amount) AS TotalPayments
FROM Payments P
INNER JOIN Couriers C ON P.CourierID = C.CourierID
GROUP BY C.CourierID, C.SenderName;

-- 32. List Payments Within a Date Range
SELECT *
FROM Payments
WHERE PaymentDate BETWEEN '2025-03-20' AND '2025-03-23';

-- 33. Retrieve All Users and Their Corresponding Courier Records (Full Outer Join)
SELECT U.*, C.*
FROM Users U
FULL OUTER JOIN Couriers C ON U.UserID = C.CourierID;

-- 34. Retrieve All Couriers and Their Corresponding Services (Full Outer Join)
SELECT C.*, CS.*
FROM Couriers C
FULL OUTER JOIN CourierServices CS ON C.CourierID = CS.ServiceID;

-- 35. Retrieve All Employees and Their Corresponding Payments
SELECT E.*, P.*
FROM Employees E
FULL OUTER JOIN Payments P ON E.EmployeeID = P.CourierID;

-- 36. List All Users and All Courier Services (Cross Join)
SELECT C.*, CS.*
FROM Couriers C
CROSS JOIN CourierServices CS;

-- 37. List All Employees and All Locations (Cross Join)
SELECT E.*, L.*
FROM Employees E
CROSS JOIN Locations L;

-- 38. Retrieve Couriers with Sender Information
SELECT C.CourierID, C.SenderName, C.SenderAddress
FROM Couriers C;

-- 39. Retrieve Couriers with Receiver Information
SELECT C.CourierID, C.ReceiverName, C.ReceiverAddress
FROM Couriers C;

-- 40. Retrieve Couriers with Courier Service Details
SELECT C.*, CS.*
FROM Couriers C
LEFT JOIN CourierServices CS ON C.CourierID = CS.ServiceID;

-- 41. Employees and the Number of Couriers Assigned to Each
SELECT E.EmployeeID, E.Name, COUNT(C.CourierID) AS CourierCount
FROM Employees E
LEFT JOIN Couriers C ON E.EmployeeID = C.CourierID
GROUP BY E.EmployeeID, E.Name;

-- 42. Locations and Total Payment Amount Received
SELECT L.LocationID, L.LocationName, SUM(P.Amount) AS TotalPayments
FROM Locations L
LEFT JOIN Payments P ON L.LocationID = P.LocationID
GROUP BY L.LocationID, L.LocationName;

-- 43. Couriers Sent by the Same Sender
SELECT C.*
FROM Couriers C
WHERE SenderName = 'Alice';

-- 44. Employees Sharing the Same Role
SELECT E.Role, COUNT(*) AS EmployeeCount
FROM Employees E
GROUP BY E.Role
HAVING COUNT(*) > 1;

-- 45. Payments for Couriers Sent from the Same Location
SELECT P.*
FROM Payments P
INNER JOIN Couriers C ON P.CourierID = C.CourierID
WHERE C.SenderAddress = 'SpecificAddress';

-- 46. Couriers Sent from the Same Location
SELECT *
FROM Couriers
WHERE SenderAddress = 'SpecificAddress';

-- 47. Employees and Number of Couriers Delivered
SELECT E.EmployeeID, E.Name, COUNT(C.CourierID) AS CourierCount
FROM Employees E
LEFT JOIN Couriers C ON E.EmployeeID = C.CourierID
GROUP BY E.EmployeeID, E.Name;

-- 48. Couriers Paid More Than the Courier Service Cost
SELECT P.*, CS.Cost
FROM Payments P
INNER JOIN CourierServices CS ON P.CourierID = CS.ServiceID
WHERE P.Amount > CS.Cost;

-- 49. Couriers with Weight Greater Than the Average Weight
SELECT *
FROM Couriers
WHERE Weight > (SELECT AVG(Weight) FROM Couriers);

-- 50. Employees with Salary Greater Than the Average Salary
SELECT *
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 51. Total Cost of Courier Services Less Than Maximum Cost
SELECT SUM(Cost) AS TotalCost
FROM CourierServices
WHERE Cost < (SELECT MAX(Cost) FROM CourierServices);

-- 52. Couriers That Have Been Paid For
SELECT DISTINCT C.*
FROM Couriers C
INNER JOIN Payments P ON C.CourierID = P.CourierID;

-- 53. Locations Where Maximum Payment Was Made
SELECT L.*
FROM Locations L
WHERE L.LocationID = (SELECT TOP 1 LocationID FROM Payments GROUP BY LocationID ORDER BY SUM(Amount) DESC);

-- 54. Couriers with Weight Greater Than All Couriers Sent by a Specific Sender
SELECT *
FROM Couriers
WHERE Weight > ALL (
    SELECT Weight
    FROM Couriers
    WHERE SenderName = 'SpecificSenderName'
);

