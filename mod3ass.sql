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
