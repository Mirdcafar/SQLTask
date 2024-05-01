SELECT * 
FROM User2;

INSERT INTO User2 ([Name], Email) VALUES ('Aspergillus', 'tniland0@walmart.com');
INSERT INTO User2 ([Name], Email) VALUES ('Doxazosin', 'dbamling1@ed.gov');
INSERT INTO User2 ([Name], Email) VALUES ('Trimipramine', 'afladgate2@cam.ac.uk');
INSERT INTO User2 ([Name], Email) VALUES ('Advance', 'kscocroft3@nydailynews.com');

SELECT *
FROM Phone

insert into Phone (PhonNumber , UserId) values ('759-821-2707' , 1);
insert into Phone (PhonNumber , UserId) values ('501-158-7264' , 2);
insert into Phone (PhonNumber , UserId) values ('737-250-6346', 3);
insert into Phone (PhonNumber , UserId) values ('630-672-6220', 4);


SELECT *
FROM [Message]

insert into [Message] ([Text] , AcountSender , AcountRecipent) values ('Software Test Engineer III' , 1 , 3);
insert into [Message] ([Text] , AcountSender , AcountRecipent) values ('Design Engineer' , 3 , 1);
insert into [Message] ([Text] , AcountSender , AcountRecipent) values ('VP Sales' , 3 , 2);
insert into [Message] ([Text] , AcountSender , AcountRecipent) values ('Internal Auditor' , 2 , 1);

SELECT *
FROM Frends2

insert into Frends2 ([Name] , UserId) values ('Slocombe' , 1);
insert into Frends2 ([Name] , UserId) values ('Juanes' , 2);
insert into Frends2 ([Name] , UserId) values ('Vearncomb' , 3);
insert into Frends2 ([Name] , UserId) values ('Redihough' , 4);

SELECT *
FROM FrendsAndUser
insert into FrendsAndUser (FrendsId , UserId) values (1 , 1);
insert into FrendsAndUser (FrendsId , UserId) values (2 , 2);
insert into FrendsAndUser (FrendsId , UserId) values (2 , 3);
insert into FrendsAndUser (FrendsId , UserId) values (3 , 4);

SELECT *
FROM Message , Phone
JOIN 
