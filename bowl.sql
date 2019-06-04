
CREATE TABLE bowl (Primary_key int not null auto_increment
, Fname varchar(100)
,Lname varchar(100)
,Game1 int null
,Game2 int null
,Game3 int null
,Game4 int null
, primary key (Primary_key));

INSERT INTO bowl (Fname, Lname, Game1, Game2, Game3, Game4) VALUES
('Natalie', 'Groeneboom', 10, 3, 4, 6)
,('Christina', 'Holme', 4, 10, 8, 7)
,('Annelies', 'Macintosh', 7, 9, 10, 3)
,('Jan Paul', 'Groeneboom', 8, 8, 10, 5);


/* Create BowlResults table */
CREATE TABLE bowlResults (BowlResultID INT NOT NULL AUTO_INCREMENT

                         ,FNAME varchar(50) DEFAULT NULL
                         ,LNAME varchar(50) DEFAULT NULL
                         ,Game_Num int DEFAULT NULL
                         ,Game_Score int DEFAULT NULL
                         ,PRIMARY KEY (BowlResultID));



SELECT CONCAT(SUBSTRING(Fname,1,1), SUBSTRING(Lname,1,1)) AS INITIALS
,CONCAT(Lname, ', ', Fname) AS "Name"
,Game1 AS "First Game"
,Game2 AS "Second Game"
,Game3 AS "Third Game"
,Game4 AS "Fourth Game"
,(Game1+Game2+Game3+Game4) AS "Total"
, (Game1+Game2+Game3+Game4)/4 AS "Average Score" FROM bowl;


INSERT INTO bowlResults (FNAME, LNAME, Game_Num, Game_Score)
VALUES ('Mashrur', 'Hossain', 1,121)
,('Mashrur', 'Hossain', 2,87)
,('Mashrur', 'Hossain', 3,115)
,('Mashrur', 'Hossain', 4,124)
,('Matt', 'Berstein', 1,111)
,('Matt', 'Berstein', 2,99)
,('Matt', 'Berstein', 3,135)
,('Matt', 'Berstein', 4,105)
,('Anastasia', 'Ivanov', 1,75)
,('Anastasia', 'Ivanov', 2,99)
,('Anastasia', 'Ivanov', 3,125)
,('Anastasia', 'Ivanov', 4,141)
,('Mark', 'Futre', 1,115)
,('Mark', 'Futre', 2,128)
,('Mark', 'Futre', 3,101)
,('Mark', 'Futre', 4,84);

/* Write a select statement listing the top 3 players and their tournament total, tournament average in order best to worst */
SELECT CONCAT(FNAME, ' ', LNAME) AS Player
,SUM(Game_Score) AS "Tournament Total"
,SUM(Game_Score)/COUNT(*) AS "Tournament Average"
FROM bowlResults
GROUP BY FNAME, LNAME
ORDER BY SUM(Game_Score)/COUNT(*) DESC
LIMIT 3;

/* Write another select statement with each player's best game score, ordered by best to worse*/
SELECT CONCAT(FNAME, ' ', LNAME) AS Player
,MAX(Game_Score) AS "Best Game"
FROM bowlResults
GROUP BY FNAME, LNAME
ORDER BY MAX(Game_Score) DESC;

/* Write a third select statement listing the players names, one row per player */
SELECT DISTINCT FNAME AS "First Name"
,LNAME AS "Last Name"
FROM bowlResults;
END AS "birthday reminder"
FRO
