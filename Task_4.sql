---1 ---2

CREATE TRIGGER Shop
ON Product
INSTEAD OF INSERT
AS
BEGIN
DECLARE @ExistProduct VARCHAR(30) = (SELECT Product.[Name] FROM inserted , Product WHERE Product.[Name] = inserted.[Name])

	IF @ExistProduct is null
    BEGIN
	INSERT INTO Product ([Name], Price, [Count], [Description])
    SELECT 
        inserted.[Name],
        inserted.Price, 
		inserted.[Count],
        CASE
            WHEN inserted.[Count] = 1 THEN 'Mehsul bitmek uzre'
            ELSE 'unknown'
        END

    FROM inserted;
	END
END;

DROP TRIGGER Shop

insert into Product (Name, Price, Count) values ('gurt', 219, 1);
insert into Product (Name, Price, Count) values ('yogurt', 21, 1);




SELECT * FROM Product

---3

CREATE TRIGGER DeleteEmployees ON Employees
AFTER DELETE
AS
BEGIN
	SELECT * FROM deleted
END

DELETE FROM Employees WHERE Id = 2


---4

CREATE TRIGGER EmployeesInserts
ON Employees
INSTEAD OF INSERT
AS
BEGIN

    DECLARE @EmployeeCount INT;
    DECLARE @InsertedCount INT;
    
    SELECT @EmployeeCount = COUNT(*) FROM Employees;
    SELECT @InsertedCount = COUNT(*) FROM inserted;

    IF @EmployeeCount + @InsertedCount <= 6
    BEGIN
        INSERT INTO Employees (FullName)
        SELECT FullName
        FROM inserted;
    END
    ELSE
    BEGIN
        PRINT '6 dan yuhari isci eleve edile bilmez'
    END
END



DROP TRIGGER EmployeesInserts


insert into Employees (FullName) values ('Tobe Le Sieur');


---5

CREATE TRIGGER Shops
ON Product
INSTEAD OF INSERT
AS
BEGIN
	 DECLARE @Name NVARCHAR(50) = (SELECT 1 FROM inserted WHERE [Name] IN ('skuter', 'skeytbord', 'hoverbord'))

	IF @Name IS null
	BEGIN
	INSERT INTO Product ([Name], Price, [Count], [Description])
    SELECT 
        inserted.[Name],
        inserted.Price, 
		inserted.[Count],
		inserted.Description
    FROM inserted;
	END
	BEGIN 
		PRINT 'bu mehsulu eleve etmek gadagandir'
	END
END

DROP TRIGGER Shops
insert into Product (Name, Price, Count , Description) values ('skuter' , 12 , 1  , 'Salam');
insert into Product (Name, Price, Count ) values ('ariel' , 12 , 0  );


SELECT * FROM Product


---6

CREATE TRIGGER ArchiveAdds
ON Product
AFTER INSERT
AS
BEGIN

	INSERT INTO Archive ([Name], Price, [Count], [Description])
    SELECT [Name], Price, [Count], [Description]
	FROM Product
    WHERE [Count] = 0;

END;

insert into Product (Name, Price, Count) values ('kolbosa', 21, 0);


SELECT *
FROM Archive