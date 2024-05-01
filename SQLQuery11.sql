SELECT User2.Name as qebuleden, sub.Name as gonderen ,  sub.Text
FROM (SELECT Text,Name,Email,AcountRecipent
	  FROM Message
	  JOIN User2 ON User2.Id = Message.AcountSender) AS sub
JOIN User2 ON User2.Id = sub.AcountRecipent 


SELECT *
FROM User2

SELECT *
FROM Message