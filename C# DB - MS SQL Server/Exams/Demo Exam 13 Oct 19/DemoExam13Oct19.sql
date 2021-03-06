--01. DDL

CREATE TABLE Users(
Id INT PRIMARY KEY IDENTITY,
Username VARCHAR(30) NOT NULL,
[Password] VARCHAR(30) NOT NULL,
Email VARCHAR(50) NOT NULL
)

CREATE TABLE Repositories(
Id INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE RepositoriesContributors(
RepositoryId INT FOREIGN KEY REFERENCES Repositories(Id) NOT NULL,
ContributorId INT FOREIGN KEY REFERENCES Users(Id) NOT NULL,
PRIMARY KEY (RepositoryId, ContributorId)
)

CREATE TABLE Issues(
Id INT PRIMARY KEY IDENTITY,
Title VARCHAR(255) NOT NULL,
IssueStatus CHAR(6) NOT NULL,
RepositoryId INT FOREIGN KEY REFERENCES Repositories(Id) NOT NULL,
AssigneeId INT FOREIGN KEY REFERENCES Users(Id) NOT NULL
)

CREATE TABLE Commits(
Id INT PRIMARY KEY IDENTITY,
[Message] VARCHAR(255) NOT NULL,
IssueId INT FOREIGN KEY REFERENCES Issues(Id),
RepositoryId INT FOREIGN KEY REFERENCES Repositories(Id) NOT NULL,
ContributorId INT FOREIGN KEY REFERENCES Users(Id) NOT NULL
)

CREATE TABLE Files(
Id INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(100) NOT NULL,
Size DECIMAL(15,2) NOT NULL,
ParentId INT FOREIGN KEY REFERENCES Files(Id),
CommitId INT FOREIGN KEY REFERENCES Commits(Id) NOT NULL
)

--02. Insert

INSERT INTO Files (Name,	Size,	ParentId,	CommitId) VALUES
('Trade.idk',	2598.0,	1,	1),
('menu.net',	9238.31,	2,	2),
('Administrate.soshy',	1246.93,	3,	3),
('Controller.php',	7353.15,	4,	4),
('Find.java',	9957.86,	5,	5),
('Controller.json',	14034.87,	3,	6),
('Operate.xix',	7662.92,	7,	7)

INSERT INTO Issues (Title,	IssueStatus,	RepositoryId,	AssigneeId) VALUES
('Critical Problem with HomeController.cs file',	'open',	1,	4),
('Typo fix in Judge.html',	'open',	4,	3),
('Implement documentation for UsersService.cs',	'closed',	8,	2),
('Unreachable code in Index.cs',	'open',	9,	8)

--03. Update

UPDATE Issues
SET IssueStatus = 'closed'
WHERE AssigneeId =6

--04. Delete

DELETE FROM RepositoriesContributors
WHERE RepositoryId = (SELECT TOP(1) Id FROM Repositories WHERE [Name] = 'Softuni-Teamwork')

DELETE FROM Issues
WHERE RepositoryId = (SELECT TOP(1) Id FROM Repositories WHERE [Name] = 'Softuni-Teamwork')

-- 05. Commits

SELECT Id, Message, RepositoryId, ContributorId FROM Commits
ORDER BY Id, Message, RepositoryId, ContributorId

--06. Heavy HTML

SELECT Id, Name, Size FROM Files
WHERE Size > 1000 AND [Name] LIKE '%html%'
ORDER BY Size DESC, Id, [Name]

--07. Issues and Users

SELECT I.Id, U.Username + ' : ' + I.Title AS [IssueAssignee] FROM Issues AS I
JOIN Users AS u
ON u.Id = I.AssigneeId
ORDER BY I.Id DESC, [IssueAssignee]

--08. Non-Directory Files

SELECT Id, [Name], CAST(Size AS varchar) + 'KB' AS [Size] FROM Files 
WHERE Id NOT IN(
SELECT f.Id FROM Files AS f
JOIN Files AS fl
ON f.Id = fl.ParentId) 
ORDER BY Id, Name, Size DESC

--09. Most Contributed Repositories
 
SELECT TOP(5) r.Id, r.[Name], COUNT(c.RepositoryId) AS [Commits] FROM Repositories AS r
JOIN Commits AS c
ON c.RepositoryId = r.Id
LEFT JOIN RepositoriesContributors AS rc
ON rc.RepositoryId = r.Id
GROUP BY r.Id, r.[Name]
ORDER BY [Commits] DESC, r.Id, r.[Name]

-- 10. User and Files

SELECT u.Username, AVG(f.Size) AS [Size] FROM Users AS u
JOIN Commits AS c
ON c.ContributorId = u.Id
JOIN Files AS f
ON f.CommitId = c.Id
GROUP BY u.Username
ORDER BY [Size] DESC, u.Username

GO

--11. User Total Commits

CREATE FUNCTION udf_UserTotalCommits(@username VARCHAR(50)) 
RETURNS INT
BEGIN
DECLARE @userId INT = (SELECT TOP(1) Id FROM Users WHERE Username = @username)
DECLARE @countNeeded INT = (SELECT COUNT(Id) FROM Commits WHERE ContributorId = @userId)
RETURN @countNeeded
END

GO

-- 12. Find by Extensions

CREATE PROCEDURE usp_FindByExtension(@extension VARCHAR(50))
AS
BEGIN
SELECT Id, [Name], CAST(Size AS varchar) + 'KB' AS [Size] FROM Files
WHERE [Name] LIKE '%' + @extension
ORDER BY Id, [Name], [Size] DESC
END

 




