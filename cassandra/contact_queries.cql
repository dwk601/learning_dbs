-- Q1: Return the first name and last name for the person with the area code equal to "952" and the phone number equal to "555-1095"
SELECT firstname, lastname FROM contacts.Contacts_by_areacode WHERE areacode = '952' AND phone = '555-1095';

-- Q2: Find everyone where their last name is "Long"
SELECT * FROM contacts.Contacts_by_names WHERE lastname = 'Long';

-- Q3: Find the person where first name equals 'Kristiann' and last name equals 'Lammers'
SELECT * FROM contacts.Contacts_by_names WHERE lastname = 'Lammers' AND firstname = 'Kristiann';

-- Q4: Find the person with the first name 'Jolie' and last name 'Mccrimmon'
SELECT * FROM contacts.Contacts_by_names WHERE lastname = 'Mccrimmon' AND firstname = 'Jolie';

-- Q5: Find the person with the email 'Marshal.Jonna-filters@yahoo.com'
SELECT * FROM contacts.Contacts_by_email WHERE email = 'Marshal.Jonna-filters@yahoo.com';

-- Q6: Find the person with email 'Glasco.Javone-dx@gmail.com'
SELECT * FROM contacts.Contacts_by_email WHERE email = 'Glasco.Javone-dx@gmail.com';

-- Q7: Find the person with the first name 'Kalvin' and the last name 'Calton'
SELECT * FROM contacts.Contacts_by_names WHERE lastname = 'Calton' AND firstname = 'Kalvin';

-- Q8: Find the person with the first name 'Brihany' and the last name 'Strang'
SELECT * FROM contacts.Contacts_by_names WHERE lastname = 'Strang' AND firstname = 'Brihany';

-- Q9: Find the person with the area code of "249", the phone number of '555-9934'
SELECT * FROM contacts.Contacts_by_areacode WHERE areacode = '249' AND phone = '555-9934';

-- Q10: Find the person with the email Broaddus.Kanoe-bob@yahoo.com
SELECT * FROM contacts.Contacts_by_email WHERE email = 'Broaddus.Kanoe-bob@yahoo.com';