-- 1. Match all contact data for the last name 'Klug'
MATCH (c:Contacts)
WHERE c.lastname = 'Klug'
RETURN c;

-- 2. Build a relationship for area code 312
MATCH (c:Contacts), (a:Areacodes)
WHERE c.areacode = '312' AND a.areacode = '312'
CREATE (c)-[:HAS_AREACODE]->(a);

-- 3. Build a relationship for area code 801
MATCH (c:Contacts), (a:Areacodes)
WHERE c.areacode = '801' AND a.areacode = '801'
CREATE (c)-[:HAS_AREACODE]->(a);

-- 4. Build a relationship for area code 415
MATCH (c:Contacts), (a:Areacodes)
WHERE c.areacode = '415' AND a.areacode = '415'
CREATE (c)-[:HAS_AREACODE]->(a);

-- 5. Match data for all Contacts in 312
MATCH (c:Contacts)-[:HAS_AREACODE]->(a:Areacodes)
WHERE a.areacode = '312'
RETURN c;

-- 6. Match data for all Contacts in 801
MATCH (c:Contacts)-[:HAS_AREACODE]->(a:Areacodes)
WHERE a.areacode = '801'
RETURN c;

-- 7. Delete the relationship for area code 415
MATCH (c:Contacts)-[r:HAS_AREACODE]->(a:Areacodes)
WHERE a.areacode = '415'
DELETE r;

-- 8. Match data for all Contacts not in area code 312
MATCH (c:Contacts)
WHERE NOT EXISTS {
    MATCH (c)-[:HAS_AREACODE]->(:Areacodes {areacode: '312'})
}
RETURN c;

-- 9. Use the relationship for area code 312 and the last name "Winkle" to return all the data
MATCH (c:Contacts)-[:HAS_AREACODE]->(a:Areacodes)
WHERE a.areacode = '312' AND c.lastname = 'Winkle'
RETURN c;

-- 10. Build a relationship for area code 385, match all contacts, return the first name, last name and email. Order by lastname
MATCH (c:Contacts), (a:Areacodes)
WHERE c.areacode = '385' AND a.areacode = '385'
MERGE (c)-[:HAS_AREACODE]->(a);

MATCH (c:Contacts)-[:HAS_AREACODE]->(a:Areacodes)
WHERE a.areacode = '385'
RETURN c.firstname, c.lastname, c.email
ORDER BY c.lastname;