/* his example */
select concat(fname, ' ', lname) as Friend
,timestampdiff(year, dob, '2019-06-15') as age
,case
 WHEN str_to_date(concat(month(dob), '/', day(dob), '/', year('2019-06-15')), '%m/%d/%Y') = '2019-06-15'
 THEN "call today!"
 WHEN CASE
   WHEN str_to_date(concat(month(dob), '/', day(dob), '/', year('2019-06-15')), '%m/%d/%Y') >= '2019-06-15'
   THEN str_to_date(concat(month(dob), '/', day(dob), '/', year('2019-06-15')), '%m/%d/%Y')
   ELSE date_add(str_to_date(concat(month(dob), '/', day(dob), '/', year('2019-06-15')), '%m/%d/%Y'), interval 1 year)
   END <= date_add('2019-06-15', interval 14 day)
   THEN "Send a Card"
   ELSE CONCAT("BIRTHDAY IS IN ",monthname(dob))
 end as Todo
 FROM friends

WHERE CASE
 WHEN str_to_date(concat(month(dob), '/', day(dob), '/', year('2019-06-15')), '%m/%d/%Y') >= '2019-06-15'
 THEN str_to_date(concat(month(dob), '/', day(dob), '/', year('2019-06-15')), '%m/%d/%Y')
 ELSE date_add(str_to_date(concat(month(dob), '/', day(dob), '/', year('2019-06-15')), '%m/%d/%Y'), interval 1 year)
 END BETWEEN '2019-06-15' and date_add('2019-06-15', interval 6 month);

/* updating a table
 */

UPDATE MOVIES SET release_year = 1999 WHERE TITLE = "Fight Club";