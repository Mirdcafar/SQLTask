--1

CREATE PROCEDURE BooksThemes
	@books_themes NVARCHAR(50)
AS
BEGIN
	SELECT [Name] , Themes
	FROM books
	WHERE Themes = @books_themes
	ORDER BY [Name]
END

EXEC BooksThemes 'Программирование'

--2

CREATE PROCEDURE FilterDatas
AS
BEGIN
    SELECT COUNT(*) as counts
    FROM books
    WHERE [Date] IS NULL;
END;

EXEC FilterDatas

--3

CREATE PROCEDURE Datas
AS
BEGIN
	UPDATE books
	SET [Date] = GETDATE()
	WHERE [Date] IS NULL
END;

EXEC Datas

SELECT *
FROM books

--4

CREATE PROCEDURE NewDatas
AS
BEGIN 
	SELECT DATEADD(YEAR,4,[Date]) AS NewData
	FROM books
END

EXEC NewDatas

SELECT *
FROM books

--5
CREATE PROCEDURE Pressrunes
    @ThresholdPressrun INT
AS
BEGIN
    UPDATE books
    SET Pressrun = 15000
    WHERE Pressrun > @ThresholdPressrun;
END;


EXEC Pressrunes 10000;

SELECT *
FROM books

--6

CREATE PROCEDURE Deletes
AS
BEGIN 
	DELETE FROM books
	WHERE Pages = 0
END;

EXEC Deletes

SELECT *
FROM books

--7

CREATE PROCEDURE DeleteBooks
  @BooksTime NVARCHAR(50)
AS
BEGIN
	DELETE FROM books
	WHERE [Date] = @BooksTime
END;

EXEC DeleteBooks '2000-07-24'

SELECT *
FROM books

--8

CREATE PROCEDURE MaxCounts
AS
BEGIN
SELECT MAX(counts) as MaxCount
  FROM(
    SELECT Izd , COUNT(*) as counts
    FROM books
    WHERE [Date] = '2024-05-02 00:20:04.760' 
    GROUP BY Izd
  ) as knx
END;

EXEC MaxCounts

--9

CREATE PROCEDURE WievBooks
AS
BEGIN 
	SELECT TOP 1 *
	FROM books
	WHERE Izd = 'BHV С.-Петербург'
	ORDER BY Price DESC
END;

EXEC WievBooks

--10

CREATE PROCEDURE MaxPrices
AS
BEGIN 
	SELECT Izd , MAX(Price) as MaxPrice
	FROM books
	WHERE Izd = 'BHV С.-Петербург'
	GROUP BY Izd
END;

EXEC MaxPrices