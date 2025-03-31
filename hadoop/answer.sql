-- Ensure we are using the correct database
USE contacts;

-- 1. Return the first name and last name for the person with the area code equal to "952" and the phone number equal to "555-1095"?
SELECT firstName, lastName
FROM contacts
WHERE areacode = '952' AND phone = '555-1095';

-- 2. Find everyone where their last name starts with "Long"?
SELECT *
FROM contacts
WHERE lastName LIKE 'Long%';

-- 3. Select the area codes that has more than 2 contacts?
SELECT areacode
FROM contacts
GROUP BY areacode
HAVING COUNT(*) > 2;

-- 4. Find the person with the first name 'Jolie' and last name 'Mccrimmon'?
SELECT *
FROM contacts
WHERE firstName = 'Jolie' AND lastName = 'Mccrimmon';

-- 5. Find the person with the email 'Marshal.Jonna-filters@yahoo.com'?
SELECT *
FROM contacts
WHERE email = 'Marshal.Jonna-filters@yahoo.com';

-- 6. Select the first 25 contacts and sort them by last name?
SELECT *
FROM contacts
ORDER BY lastName
LIMIT 25;

-- 7. Find all contacts that use Yahoo as their email provider?
SELECT *
FROM contacts
WHERE email LIKE '%@yahoo.com';

-- 8. Select the person with the first name 'Brihany' and the last name 'Strang'?
SELECT *
FROM contacts
WHERE firstName = 'Brihany' AND lastName = 'Strang';

-- 9. Select the person with the area code of "249", the phone number of '555-9934' and the last name of 'Falconer'?
SELECT *
FROM contacts
WHERE areacode = '249' AND phone = '555-9934' AND lastName = 'Falconer';

-- 10. Select all contacts in UT area codes? (Assuming standard Utah area codes 801, 435, 385)
SELECT *
FROM contacts
WHERE areacode IN ('801', '435', '385');