CREATE DATABASE AirbnbPakistan2025;

USE AirbnbPakistan2025;

CREATE TABLE Hosts (
    HostID INT PRIMARY KEY,
    HostName VARCHAR(100),
    Superhost BIT
);

INSERT INTO Hosts VALUES
(1, 'Ali', 1),
(2, 'Sara', 1),
(3, 'Usman', 0),
(4, 'Ayesha', 1),
(5, 'Hamza', 1),
(6, 'Nida', 0),
(7, 'Zain', 1),
(8, 'Fatima', 0),
(9, 'Kashif', 1),
(10, 'Mehwish', 0);

----------------------------------------

CREATE TABLE Listings (
    ListingID INT PRIMARY KEY,
    HostID INT FOREIGN KEY REFERENCES Hosts(HostID),
    City VARCHAR(100),
    PricePerNight INT,
    RoomType VARCHAR(50),
    MaxGuests INT,
    ListingName VARCHAR(100)
);

INSERT INTO Listings VALUES
(1, 2, 'Lahore', 14087, 'Shared room', 2, 'Stay_1'),
(2, 5, 'Murree', 3520, 'Entire home/apt', 2, 'Stay_2'),
(3, 2, 'Karachi', 11279, 'Shared room', 1, 'Stay_3'),
(4, 5, 'Karachi', 14731, 'Shared room', 7, 'Stay_4'),
(5, 2, 'Murree', 12654, 'Private room', 1, 'Stay_5'),
(6, 2, 'Murree', 8574, 'Private room', 3, 'Stay_6'),
(7, 2, 'Islamabad', 4674, 'Entire home/apt', 7, 'Stay_7'),
(8, 1, 'Islamabad', 8635, 'Shared room', 5, 'Stay_8'),
(9, 1, 'Murree', 11785, 'Entire home/apt', 7, 'Stay_9'),
(10, 1, 'Skardu', 7803, 'Shared room', 6, 'Stay_10');

select * from Listings
========================================

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    ListingID INT FOREIGN KEY REFERENCES Listings(ListingID),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewDate DATE,
    Comment VARCHAR(255)
);

INSERT INTO Reviews VALUES
(1, 5, 2, '2025-02-24', 'Okay experience'),
(2, 9, 3, '2025-06-19', 'Loved it'),
(3, 10, 4, '2025-03-08', 'Very clean'),
(4, 9, 4, '2025-01-25', 'Great stay!'),
(5, 2, 2, '2025-06-06', 'Loved it'),
(6, 10, 1, '2025-04-13', 'Okay experience'),
(7, 8, 5, '2025-03-18', 'Great stay!'),
(8, 2, 5, '2025-03-25', 'Could be better'),
(9, 2, 3, '2025-04-06', 'Loved it'),
(10, 1, 3, '2025-05-25', 'Very clean');

====================================================================

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    ListingID INT FOREIGN KEY REFERENCES Listings(ListingID),
    CheckIn DATE,
    CheckOut DATE,
    Guests INT
);

INSERT INTO Bookings VALUES
(1, 10, '2025-02-23', '2025-02-24', 1),
(2, 4,  '2025-03-03', '2025-03-05', 1),
(3, 7,  '2025-03-15', '2025-03-18', 2),
(4, 6,  '2025-03-07', '2025-03-10', 6),
(5, 2,  '2025-05-21', '2025-05-23', 5),
(6, 4,  '2025-02-15', '2025-02-19', 3),
(7, 9,  '2025-02-22', '2025-02-25', 1),
(8, 4,  '2025-01-11', '2025-01-15', 3),
(9, 2,  '2025-02-19', '2025-02-22', 2),
(10, 8, '2025-04-21', '2025-04-25', 2);

----------------------------
CREATE TABLE Amenities (
    AmenityID INT PRIMARY KEY,
    AmenityName VARCHAR(100)
);

INSERT INTO Amenities VALUES
(1, 'Wi-Fi'),
(2, 'Air Conditioning'),
(3, 'Kitchen'),
(4, 'Washer'),
(5, 'Heating'),
(6, 'TV'),
(7, 'Parking'),
(8, 'Balcony'),
(9, 'Pool'),
(10, 'Pet-friendly');

--------- 
CREATE TABLE ListingAmenities (
    ListingID INT,
    AmenityID INT,
    PRIMARY KEY (ListingID, AmenityID),
    FOREIGN KEY (ListingID) REFERENCES Listings(ListingID),
    FOREIGN KEY (AmenityID) REFERENCES Amenities(AmenityID)
);

INSERT INTO ListingAmenities VALUES
(1, 1), (1, 3), (1, 4),
(2, 1), (2, 2), (2, 3), (2, 7),
(3, 1), (3, 5),
(4, 2), (4, 3), (4, 6),
(5, 1), (5, 4),
(6, 3), (6, 7),
(7, 1), (7, 9), (7, 10),
(8, 1), (8, 6),
(9, 2), (9, 4), (9, 7),
(10, 1), (10, 3);

------------------ 
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT FOREIGN KEY REFERENCES Bookings(BookingID),
    Amount INT,
    PaymentDate DATE,
    PaymentMethod VARCHAR(50)
);

INSERT INTO Payments VALUES
(1, 1, 14087, '2025-02-22', 'Credit Card'),
(2, 2, 29462, '2025-03-01', 'JazzCash'),
(3, 3, 14022, '2025-03-14', 'Easypaisa'),
(4, 4, 25722, '2025-03-06', 'Bank Transfer'),
(5, 5, 7040, '2025-05-20', 'Credit Card'),
(6, 6, 58924, '2025-02-14', 'Debit Card'),
(7, 7, 35355, '2025-02-21', 'JazzCash'),
(8, 8, 58924, '2025-01-10', 'Credit Card'),
(9, 9, 10560, '2025-02-18', 'Cash'),
(10, 10, 34540, '2025-04-20', 'Debit Card');

-----------

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Country VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'Ahmed', 'ahmed@gmail.com', '03001234567', 'Pakistan'),
(2, 'Fatima', 'fatima@hotmail.com', '03123456789', 'Pakistan'),
(3, 'Zain', 'zain@yahoo.com', '03219876543', 'Pakistan'),
(4, 'Hira', 'hira@gmail.com', '03331231234', 'Pakistan'),
(5, 'Bilal', 'bilal@gmail.com', '03455667788', 'Pakistan'),
(6, 'Rabia', 'rabia@outlook.com', '03557789900', 'Pakistan'),
(7, 'Tariq', 'tariq@protonmail.com', '03668890011', 'Pakistan'),
(8, 'Maha', 'maha@yahoo.com', '03779900112', 'Pakistan'),
(9, 'Sami', 'sami@gmail.com', '03880011223', 'Pakistan'),
(10, 'Nida', 'nida@hotmail.com', '03991122334', 'Pakistan');

select * from customers 

-- Add CustomerID to Bookings table
ALTER TABLE Bookings
ADD CustomerID INT;

select * from Bookings

-- Add foreign key relationship
ALTER TABLE Bookings
ADD CONSTRAINT FK_Bookings_Customers
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

-- Update Bookings with CustomerID values

UPDATE Bookings SET CustomerID = 1 WHERE BookingID = 1;
UPDATE Bookings SET CustomerID = 2 WHERE BookingID = 2;
UPDATE Bookings SET CustomerID = 3 WHERE BookingID = 3;
UPDATE Bookings SET CustomerID = 1 WHERE BookingID = 4;
UPDATE Bookings SET CustomerID = 4 WHERE BookingID = 5;
UPDATE Bookings SET CustomerID = 2 WHERE BookingID = 6;
UPDATE Bookings SET CustomerID = 5 WHERE BookingID = 7;
UPDATE Bookings SET CustomerID = 3 WHERE BookingID = 8;
UPDATE Bookings SET CustomerID = 4 WHERE BookingID = 9;
UPDATE Bookings SET CustomerID = 5 WHERE BookingID = 10;

=========================================================================================================================

--- 1. ?? Which listings have never received a review?

SELECT l.ListingID, l.ListingName
FROM Listings l
LEFT JOIN Reviews r ON l.ListingID = r.ListingID
WHERE r.ReviewID IS NULL;

--- 2. ?? What is the total revenue generated by each listing (Price × Nights Booked)?

SELECT l.ListingID, l.ListingName, SUM(p.Amount) AS TotalRevenue
FROM Listings l
JOIN Bookings b ON l.ListingID = b.ListingID
JOIN Payments p ON b.BookingID = p.BookingID
GROUP BY l.ListingID, l.ListingName;

--- 3. ?? Which cities have the highest average rating for listings? (min 10 reviews)

SELECT l.City, AVG(r.Rating) AS AvgRating, COUNT(*) AS ReviewCount
FROM Reviews r
JOIN Listings l ON r.ListingID = l.ListingID
GROUP BY l.City
HAVING COUNT(*) < = 10
ORDER BY AvgRating DESC;

--- 4. ?? How many bookings were made each month in 2025?

SELECT MONTH(CheckIn) AS Month, COUNT(*) AS TotalBookings
FROM Bookings
WHERE YEAR(CheckIn) = 2025
GROUP BY MONTH(CheckIn)
ORDER BY Month;

--- 5. ?? Top 3 Superhosts with the most bookings in 2025

SELECT TOP 3 h.HostName, COUNT(b.BookingID) AS TotalBookings
FROM Hosts h
JOIN Listings l ON h.HostID = l.HostID
JOIN Bookings b ON l.ListingID = b.ListingID
WHERE h.Superhost = 1 AND YEAR(b.CheckIn) = 2025
GROUP BY h.HostName
ORDER BY TotalBookings DESC;

--- 6. ?? Identify repeat customers (who booked more than once) and the number of bookings.

SELECT c.CustomerName, COUNT(*) AS BookingCount
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
GROUP BY c.CustomerName
HAVING COUNT(*) > 1;

--- 7. ?? Create a view to show active bookings with customer name, listing, and stay duration.

CREATE VIEW vw_ActiveBookings AS
SELECT b.BookingID, c.CustomerName, l.ListingName,
       DATEDIFF(DAY, b.CheckIn, b.CheckOut) AS Duration
FROM Bookings b
JOIN Customers c ON b.CustomerID = c.CustomerID
JOIN Listings l ON b.ListingID = l.ListingID;

--- 8. ?? Stored procedure to calculate total payment received for a given ListingID.

CREATE PROCEDURE GetListingRevenue
    @ListingID INT
AS
BEGIN
    SELECT l.ListingName, SUM(p.Amount) AS TotalRevenue
    FROM Listings l
    JOIN Bookings b ON l.ListingID = b.ListingID
    JOIN Payments p ON b.BookingID = p.BookingID
    WHERE l.ListingID = @ListingID
    GROUP BY l.ListingName;
END;

--- 9. ?? Which room types generate the highest average revenue per booking?

SELECT l.RoomType,
       AVG(p.Amount / DATEDIFF(DAY, b.CheckIn, b.CheckOut)) AS AvgRevenuePerNight
FROM Listings l
JOIN Bookings b ON l.ListingID = b.ListingID
JOIN Payments p ON b.BookingID = p.BookingID
GROUP BY l.RoomType;

--- 10. ?? Use a CTE to find listings with above-average price per night per city.

WITH CityAvg AS (
    SELECT City, AVG(PricePerNight) AS AvgPrice
    FROM Listings
    GROUP BY City
)
SELECT l.ListingName, l.City, l.PricePerNight
FROM Listings l
JOIN CityAvg c ON l.City = c.City
WHERE l.PricePerNight > c.AvgPrice;

--- 11. ?? Add an index on ListingID in the Bookings and Payments tables.

CREATE INDEX idx_bookings_listingid ON Bookings(ListingID);
CREATE INDEX idx_payments_listingid ON Payments(ListingID);

--- 12. ?? Use a window function to rank listings by total number of reviews within each city.

SELECT l.City, l.ListingName, COUNT(r.ReviewID) AS ReviewCount,
       RANK() OVER (PARTITION BY l.City ORDER BY COUNT(r.ReviewID) DESC) AS ListingRank
FROM Listings l
JOIN Reviews r ON l.ListingID = r.ListingID
GROUP BY l.City, l.ListingName;

--- 13. ?? List the most reviewed listings along with average rating and total reviews.

SELECT l.ListingName, COUNT(r.ReviewID) AS TotalReviews, AVG(r.Rating) AS AvgRating
FROM Listings l
JOIN Reviews r ON l.ListingID = r.ListingID
GROUP BY l.ListingName
ORDER BY TotalReviews DESC

--- 14. ?? Show customers and the total amount they’ve spent, using a subquery or derived table.

SELECT c.CustomerName, SUM(p.Amount) AS TotalSpent
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
JOIN Payments p ON b.BookingID = p.BookingID
GROUP BY c.CustomerName;

--- 15. ?? Find listings that support more than 4 guests, have at least 3 amenities, and cost below city average.

WITH AmenityCount AS (
    SELECT ListingID, COUNT(*) AS AmenityTotal
    FROM ListingAmenities
    GROUP BY ListingID
),
CityAvgPrice AS (
    SELECT City, AVG(PricePerNight) AS AvgCityPrice
    FROM Listings
    GROUP BY City
)
SELECT l.ListingID, l.ListingName, l.City, l.PricePerNight, l.MaxGuests, a.AmenityTotal
FROM Listings l
JOIN AmenityCount a ON l.ListingID = a.ListingID
JOIN CityAvgPrice c ON l.City = c.City
WHERE l.MaxGuests > 4 AND a.AmenityTotal >= 3 AND l.PricePerNight < c.AvgCityPrice;

========================================================================================================

