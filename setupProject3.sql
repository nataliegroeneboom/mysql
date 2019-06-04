/*set up table and add data */
CREATE TABLE Friends (FriendID INT NOT NULL AUTO_INCREMENT
                     ,FNAME varchar(50) DEFAULT NULL
                     ,LNAME varchar(50) DEFAULT NULL
                     ,dob date DEFAULT NULL
                     ,PRIMARY KEY (FriendID));

INSERT INTO Friends (FNAME, LNAME,dob)
VALUES ('Mashrur', 'Hossain','1982-12-01')
      ,('Matt', 'Berstein','1980-08-05')
      ,('Anastasia', 'Ivanov','1989-04-01')
      ,('Mark', 'Futre','1989-07-04');

/*first and last name in once column*/
select concat(fname, ' ', lname) as Friend from friends;

/* get current age */
select timestampdiff(year, dob, curdate()) as "Current Age" FROM friends;

/* if birthday is today, return 'Call today' else if birthday is less than 14 days, display 'Send Card'
else display Birthday is in (name of month) */

WHEN
timestampdiff(day, curdate(), str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y'))
between 0 and 14
THEN 'send card'
WHEN
timestampdiff(day, curdate(), str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y'))
= 0
THEN 'call friend'
WHEN str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y') >= curdate()

THEN concat('Birthday is in ',monthname(dob))
WHEN str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y') < curdate()
THEN concat('Birthday is in ' , monthname(dob), ' (',year(date_add(curdate(),interval 1 year)),')' )
end as Day
FROM friends;

/* only return friends that are within the next 6 months */



/* his example */
select concat(fname, ' ', lname) as Friend
,timestampdiff(year, dob, curdate()) as age
,case
 WHEN str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y') = curdate()
 THEN "call today!"
 WHEN CASE
   WHEN str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y') >= curdate()
   THEN str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y')
   ELSE date_add(str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y'), interval 1 year)
   END <= date_add(curdate(), interval 14 day)
   THEN "Send a Card"
   ELSE CONCAT("BIRTHDAY IS IN ",monthname(dob))
 end as Todo
 FROM friends

WHERE CASE
 WHEN str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y') >= curdate()
 THEN str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y')
 ELSE date_add(str_to_date(concat(month(dob), '/', day(dob), '/', year(curdate())), '%m/%d/%Y'), interval 1 year)
 END BETWEEN curdate() and date_add(curdate(), interval 6 month);