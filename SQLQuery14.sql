SELECT *
FROM Ticer

INSERT INTO Ticer VALUES ('Zabuza' , 1800 , 'Junior' , 1)
INSERT INTO Ticer VALUES ('Jirayya' ,2000 , 'Senyor' , 2)
INSERT INTO Ticer VALUES ('Itachi' ,1400 , 'Midle' , 2)
INSERT INTO Ticer VALUES ('Madara' ,1000 , 'Midle' , 1)
INSERT INTO Ticer VALUES ('Shisui' ,1900 ,'Junior' , 2)
 
SELECT  Position , COUNT(Position) as [Count] 
FROM Ticer
WHERE Position = 'Junior'
GROUP BY  Position

SELECT *
FROM Lectures

INSERT INTO Lectures VALUES ('Marketing')
INSERT INTO Lectures VALUES ('ITService')


SELECT *
FROM Auditory

INSERT INTO Auditory VALUES ('201' , 6)
INSERT INTO Auditory VALUES ('201' , 7)
INSERT INTO Auditory VALUES ('202' , 7)
INSERT INTO Auditory VALUES ('203' , 8)
INSERT INTO Auditory VALUES ('204' , 10)
INSERT INTO Auditory VALUES ('205' , 9)

SELECT *
FROM Student

INSERT INTO Student VALUES ('Haku' , 6)
INSERT INTO Student VALUES ('Naruto' , 7)
INSERT INTO Student VALUES ('Obito' , 7)
INSERT INTO Student VALUES ('Kisame' , 8)
INSERT INTO Student VALUES ('Sasuke' , 10)
INSERT INTO Student VALUES ('Kiba' , 9)


SELECT  FullName ,Position , COUNT([Name] ) as count
From  Lectures
JOIN Ticer ON Ticer.LecturesId = Lectures.Id
WHERE FullName = 'Shisui'
GROUP BY FullName ,Position


SELECT AuditoryName , COUNT(AuditoryName) as count
FROM Auditory 
WHERE AuditoryName = '201'
GROUP BY AuditoryName

SELECT AuditoryName , COUNT(AuditoryName) as count
FROM Auditory
GROUP BY AuditoryName

SELECT  FullName  , COUNT(TicerId) as count
FROM  Ticer
JOIN Student ON Student.TicerId = Ticer.Id
GROUP BY TicerId , FullName

SELECT Position , AVG(Salary) as avarage 
FROM Ticer
WHERE Position = 'Junior'
Group BY Position


SELECT  AVG(Salary) as Avarage
FROM  Ticer
