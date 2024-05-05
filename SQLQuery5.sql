--1

SELECT MIN(Pages) as Pages
FROM Books

--2

SELECT Comment , AVG(Pages) as Pages
FROM Books
WHERE Pages > 100
GROUP BY Comment

--3

SELECT Press.[Name] , SUM(Books.Pages)
FROM Press 
JOIN Books ON Books.Id_Press = Press.Id
WHERE Press.[Name] = 'BHV' 
GROUP BY Press.[Name]

--4

SELECT Students.FirstName , S_Cards.DateOut
FROM Students
JOIN S_Cards ON S_Cards.Id_Student = Students.Id
WHERE S_Cards.DateOut > '2001-01-01 00:00:00:000'

--5

SELECT  Books.[Name] , Authors.FirstName as AuthorsFirstName , Authors.LastName as AuthorsLastName ,Students.FirstName as StudentsFirstName
FROM Books
JOIN Authors ON Books.Id_Author = Authors.Id
JOIN S_Cards ON S_Cards.Id_Book = Books.Id
JOIN Students ON S_Cards.Id_Student = Students.Id
WHERE 
    Authors.FirstName = 'Îכüדא' AND 
    Books.[Name] = 'Ðווסענ Windows 2000';

--6

SELECT Authors.FirstName , Authors.LastName , Books.Pages
FROM Authors
JOIN Books ON Books.Id_Author = Authors.Id
WHERE Books.Pages > 600

--7

SELECT Press.[Name], SUM(Books.Pages) AS TotalPages
FROM Press
JOIN Books ON Books.Id_Press = Press.Id
GROUP BY Press.[Name] 
HAVING SUM(Books.Pages) > 700;

--8

SELECT  Books.[Name] , Teachers.FirstName as TeachersFirstName , Teachers.LastName as TeachersLastName 
FROM Books
JOIN Teachers ON Books.Id_Author = Teachers.Id

--9

SELECT Books.[Name] , Students.FirstName as StudentsFirstName , Students.LastName as StudentsLastName
FROM Books
JOIN S_Cards ON S_Cards.Id_Book = Books.Id
JOIN Students ON S_Cards.Id_Student = Students.Id

--10

SELECT Authors.FirstName , Authors.LastName , COUNT(*) AS BooksBorrowed
FROM Authors
JOIN Books ON Books.Id_Author = Authors.Id
JOIN S_Cards ON S_Cards.Id_Book = Books.Id
GROUP BY Authors.FirstName, Authors.LastName



SELECT Authors.FirstName , Authors.LastName , COUNT(*) AS BooksBorrowed
FROM Authors
JOIN Books ON Books.Id_Author = Authors.Id
JOIN T_Cards ON T_Cards.Id_Book = Books.Id
GROUP BY Authors.FirstName, Authors.LastName

--11

SELECT COUNT( Themes.[Name]) as ThemesCount
FROM Themes
JOIN Books ON  Books.Id_Themes = Themes.Id
GROUP BY  Themes.[Name]

--12

SELECT COUNT(Id_Book) as StudentsCount
FROM S_Cards

SELECT COUNT(Id_Book) as TicherCount
FROM T_Cards


--Task