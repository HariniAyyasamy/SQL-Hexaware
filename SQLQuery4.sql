--23
SELECT P.*, C.*
FROM Payments P
INNER JOIN Couriers C ON P.CourierID = C.CourierID;

--24
SELECT P.*, L.*
FROM Payments P
INNER JOIN Locations L ON P.LocationID = L.LocationID;

--25
SELECT P.*, C.*, L.*
FROM Payments P
INNER JOIN Couriers C ON P.CourierID = C.CourierID
INNER JOIN Locations L ON P.LocationID = L.LocationID;

--26
SELECT P.*, C.*
FROM Payments P
INNER JOIN Couriers C ON P.CourierID = C.CourierID;

--27
SELECT C.CourierID, C.SenderName, SUM(P.Amount) AS TotalPayments
FROM Payments P
INNER JOIN Couriers C ON P.CourierID = C.CourierID
GROUP BY C.CourierID, C.SenderName;

--28
SELECT * FROM Payments WHERE PaymentDate = '2025-03-23';
