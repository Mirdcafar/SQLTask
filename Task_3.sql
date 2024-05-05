--1

CREATE FUNCTION MinCountPressPages(@izd NVARCHAR(50))
RETURNS TABLE
AS
RETURN (
    SELECT Press.[Name], MIN(Books.Pages) AS MinPages 
    FROM Press 
    JOIN Books ON Books.Id_Press = Press.Id
    WHERE Press.[Name] = @izd
    GROUP BY Press.[Name]
)

SELECT * FROM dbo.MinCountPressPages('BHV')

--2

CREATE FUNCTION AuthorsNameAndAvg(@N INT)
RETURNS TABLE
AS
	RETURN (
		SELECT Authors.FirstName , Authors.LastName , AVG(Books.Pages) AS Averege
		FROM Authors
		JOIN Books ON Books.Id_Author = Authors.Id
		GROUP BY Authors.FirstName , Authors.LastName
		HAVING AVG(Books.Pages) > @N
	)


SELECT * FROM dbo.AuthorsNameAndAvg(400)

--3


CREATE FUNCTION PressTable(@pressName NVARCHAR(50))
RETURNS TABLE
AS
	RETURN(
	SELECT Press.[Name] , COUNT(Books.Id) as Counts
	FROM Press
	JOIN Books ON Books.Id_Press = Press.Id
	WHERE Press.[Name] = @pressName
	GROUP BY Press.[Name]
	)

SELECT * FROM dbo.PressTable('BHV')

--4

CREATE FUNCTION StudentsData(@data1 NVARCHAR(50) , @data2 NVARCHAR(50))
RETURNS TABLE
AS
	RETURN(
		SELECT Students.FirstName , Students.LastName
		FROM Students
		JOIN S_Cards ON S_Cards.Id_Student = Students.Id
		WHERE S_Cards.DateOut BETWEEN @data1 AND @data2

	)

SELECT * FROM dbo.StudentsData('2001-04-21 00:00:00:000' , '2001-05-17 00:00:00:000')

--5

CREATE FUNCTION StudentBooks(@bookName NVARCHAR(50))
RETURNS TABLE 
AS
	RETURN(
		SELECT Students.FirstName as StudentsFirstName , Students.LastName as StudentsLastName , Authors.FirstName as AuthorsFirstName , Authors.LastName as AuthorsLastName , Books.[Name] as BooksName
		FROM Students 
		JOIN S_Cards ON S_Cards.Id_Student = Students.Id
		JOIN Books ON Books.Id = S_Cards.Id_Book
		JOIN Authors ON Authors.Id = Books.Id_Author
		WHERE Books.[Name] = @bookName
	)

SELECT *
FROM dbo.StudentBooks('SQL')


--6

CREATE FUNCTION AuthorsInfo(@author NVARCHAR(50))
RETURNS TABLE
AS
	RETURN(
	SELECT Authors.FirstName , Authors.LastName , MAX(Books.Pages) AS Pages
	FROM Authors
	JOIN Books ON Books.Id_Author = Authors.Id
	WHERE Authors.FirstName = @author
	GROUP BY Authors.FirstName , Authors.LastName
	)

SELECT *
FROM dbo.AuthorsInfo('Михаил')

--7

CREATE FUNCTION AuthorsTop()
RETURNS TABLE 
AS
	RETURN(
		SELECT MAX(counts) as maxCount
		FROM (SELECT Authors.FirstName , Authors.LastName , COUNT(Books.[Name]) AS counts
		FROM Authors
		JOIN Books ON Books.Id_Author = Authors.Id
		GROUP BY Authors.FirstName , Authors.LastName) AS book
	)

SELECT *
FROM AuthorsTop()

--8

CREATE FUNCTION StudentsIfos()
RETURNS TABLE 
AS
	RETURN(
		SELECT Students.FirstName , Students.LastName , Books.[Name] 
		FROM Students
		JOIN S_Cards ON S_Cards.Id_Student = Students.Id
		JOIN Books ON Books.Id = S_Cards.Id_Book
	)

SELECT *
FROM dbo.StudentsIfos()


CREATE FUNCTION TeacherIfos()
RETURNS TABLE 
AS
	RETURN(
		SELECT Teachers.FirstName , Teachers.LastName , Books.[Name] 
		FROM Teachers
		JOIN T_Cards ON T_Cards.Id_Teacher = Teachers.Id
		JOIN Books ON Books.Id = T_Cards.Id_Book
	)

SELECT *
FROM dbo.TeacherIfos()

--9


CREATE FUNCTION CountStudents()
RETURNS TABLE
AS  
    RETURN (
	SELECT COUNT(*) as num
    FROM Students
    WHERE Students.Id NOT IN (
        SELECT  Id_Student 
        FROM S_Cards
    )
	)

SELECT *
FROM dbo.CountStudents()

--10

CREATE FUNCTION LibsCount()
RETURNS TABLE
AS
	RETURN(
	SELECT Libs.FirstName , Libs.LastName , COUNT(S_Cards.Id_Lib) AS LibsCount
	FROM Libs
	JOIN S_Cards ON S_Cards.Id_Lib = Libs.Id
	GROUP BY Libs.FirstName , Libs.LastName 
	)

SELECT *
FROM dbo.LibsCount()


--Task