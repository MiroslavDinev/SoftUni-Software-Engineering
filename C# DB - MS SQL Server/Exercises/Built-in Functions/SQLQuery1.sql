--01. Find Names of All Employees by First Name 
SELECT FirstName, LastName
FROM Employees
WHERE FirstName LIKE 'SA%'

--02. Find Names of All Employees by Last Name
SELECT FirstName, LastName
FROM Employees
WHERE LastName LIKE '%ei%'

--03. Find First Names of All Employess
SELECT FirstName
FROM Employees
WHERE DepartmentID IN (3,10) AND DATEPART(YEAR,HireDate) BETWEEN 1995 AND 2005

--04. Find All Employees Except Engineers
SELECT FirstName, LastName
FROM Employees
WHERE JobTitle NOT LIKE '%engineer%'

--05. Find Towns with Name Length 
SELECT [Name]
FROM Towns
WHERE LEN([Name]) IN (5,6)
ORDER BY [Name]

--06. Find Towns Starting With
SELECT *
FROM Towns
WHERE [Name] LIKE '[mkbe]%'
ORDER BY [Name]

--07. Find Towns Not Starting With 
SELECT *
FROM Towns
WHERE [Name] NOT LIKE '[rbd]%'
ORDER BY [Name]
GO

--08. Create View Employees Hired After
CREATE VIEW V_EmployeesHiredAfter2000 AS
SELECT FirstName, LastName
FROM Employees
WHERE DATEPART(YEAR,HireDate)>2000
GO


--09. Length of Last Name 
SELECT FirstName,LastName
FROM Employees
WHERE LEN(LastName)=5

--10. Rank Employees by Salary 
SELECT EmployeeID, FirstName, LastName, Salary
,DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
FROM Employees
WHERE Salary BETWEEN 10000 AND 50000
ORDER BY Salary DESC

--11. Find All Employees with Rank 2
SELECT *
FROM (SELECT EmployeeID, FirstName, LastName, Salary
,DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
FROM Employees
WHERE Salary BETWEEN 10000 AND 50000
) AS MyTable
WHERE MyTable.Rank=2
ORDER BY MyTable.Salary DESC

--12. Countries Holding 'A' 
SELECT CountryName, IsoCode
FROM Countries
WHERE CountryName LIKE '%a%a%a%'
ORDER BY IsoCode

--13. Mix of Peak and River Names 
SELECT PeakName,RiverName, LOWER(PeakName + SUBSTRING(RiverName,2,LEN(RiverName))) AS Mix
FROM Peaks, Rivers
WHERE RIGHT(PeakName,1) = LEFT(RiverName,1)
ORDER BY Mix

--14. Games From 2011 and 2012 Year
SELECT TOP (50) [Name], FORMAT([Start],'yyyy-MM-dd') AS [Start]
FROM Games
WHERE DATEPART(YEAR,[Start]) IN (2011,2012)
ORDER BY [Start], [Name]

--15. User Email Providers
SELECT Username, SUBSTRING(Email,CHARINDEX('@',Email,1) +1, LEN(Email)) AS [Email Provider]
FROM Users
ORDER BY [Email Provider], Username

--16. Get Users with IPAddress Like Pattern
SELECT Username, IpAddress
FROM Users
WHERE IpAddress LIKE '___.1_%._%.___'
ORDER BY Username

--17. Show All Games with Duration
SELECT [Name],
CASE
WHEN DATEPART(HOUR,Start)>=0 AND DATEPART(HOUR,Start)<12 THEN 'Morning'
WHEN DATEPART(HOUR,Start)>=12 AND DATEPART(HOUR,Start)<18 THEN 'Afternoon'
WHEN DATEPART(HOUR,Start)>=18 AND DATEPART(HOUR,Start)<24 THEN 'Evening'
END AS [Part of the Day],
CASE 
WHEN Duration<=3 THEN 'Extra Short'
WHEN Duration BETWEEN 4 AND 6 THEN 'Short'
WHEN Duration >6 THEN 'Long'
WHEN Duration IS NULL THEN 'Extra Long'
END AS Duration
FROM Games
ORDER BY [Name],[Duration],[Part of the Day]

--18. Orders Table 
SELECT ProductName, OrderDate, DATEADD(DAY,3,OrderDate) AS [Pay Due], DATEADD(MONTH,1,OrderDate) AS [Deliver Due]
FROM Orders

--19.People Table
CREATE TABLE People(
Id INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(50) NOT NULL,
Birthdate DATETIME NOT NULL
)

INSERT INTO People ([Name],Birthdate) VALUES
('Victor', '2000-12-07'),
('Steven', '1992-09-10'),
('Stephen', '1910-09-19'),
('John', '2010-01-06')

SELECT [Name], DATEDIFF(YEAR,Birthdate,GETDATE()) AS [Age in Years], DATEDIFF(MONTH, Birthdate, GETDATE()) AS [Age in Months],
DATEDIFF(DAY, Birthdate, GETDATE()) AS [Age in Days], DATEDIFF(MINUTE, Birthdate, GETDATE()) AS [Age in Minutes]
FROM People