CREATE TABLE Ticer
(
 Id INT PRIMARY KEY IDENTITY(1,1),
 FullName NVARCHAR(50) NOT NULL,
 Salary INT NOT NULL,
 Position NVARCHAR(50) NOT NULL,
 LecturesId INT NOT NULL REFERENCES Lectures(Id)
)

CREATE TABLE Lectures
(
 Id INT PRIMARY KEY IDENTITY(1,1),
 [Name] NVARCHAR(50) NOT NULL,
	
)

CREATE TABLE Student
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	NameStudent NVARCHAR(50) NOT NULL ,
	TicerId INT NOT NULL REFERENCES Ticer(Id) 
)

CREATE TABLE Auditory
(
 Id INT PRIMARY KEY IDENTITY(1,1),
 AuditoryName NVARCHAR(50) NOT NULL,
 TicerId INT NOT NULL REFERENCES Ticer(Id) 
)

DROP TABLE Auditory