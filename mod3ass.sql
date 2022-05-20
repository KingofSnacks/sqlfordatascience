--Using a subquery, find the names of all the tracks for the album "Californication".

SELECT *
FROM Tracks AS t
WHERE t.AlbumId =

(SELECT AlbumId
    FROM Albums AS a
    WHERE a.Title = 'Californication')

ORDER BY TrackId

--Find the total number of invoices for each customer along with the customer's full name, city and email.

SELECT *
FROM Customers AS c
JOIN
    (SELECT COUNT(InvoiceId) invCount, CustomerID
    FROM Invoices
    GROUP BY CustomerId) AS t1
    ON c.CustomerId = t1.CustomerId
    
--Retrieve the track name, album, artistID, and trackID for all the albums.
  
SELECT 
Tracks.Name AS TrackName,
Albums.Title AS Album,
Artists.artistID,
Tracks.TrackId
FROM Albums
JOIN Artists
ON Albums.ArtistId = Artists.ArtistId
JOIN Tracks
ON Tracks.AlbumId = Albums.AlbumId

--Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

SELECT t1.LastName AS Manager, e.EmployeeId, e.LastName AS Employee
FROM Employees AS e
JOIN 
    (SELECT EmployeeId, LastName
    FROM Employees
    WHERE Title LIKE '%Manager%') AS t1
ON e.ReportsTo = t1.EmployeeId

--Find the name and ID of the artists who do not have albums. 

SELECT a.Name, a.ArtistId
FROM Artists AS a
LEFT JOIN
    (SELECT ArtistId
    FROM Albums
    GROUP BY ArtistId) AS t1
ON a.ArtistId = t1.ArtistId
WHERE t1.ArtistId IS null

--Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

SELECT FirstName, LastName
FROM Employees
UNION
SELECT FirstName, LastName
FROM Customers
ORDER BY LastName desc

--See if there are any customers who have a different city listed in their billing city versus their customer city.

SELECT c.CustomerId, c.City AS CustomerCity, i.BillingCity
FROM Customers AS c
JOIN INVOICES AS i
ON c.CustomerId = i.CustomerId
WHERE CustomerCity <> BillingCity
