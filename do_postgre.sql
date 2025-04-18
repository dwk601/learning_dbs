-- question 1
CREATE TABLE chicago_contacts (
    chicago_id SERIAL PRIMARY KEY,
    contact_id INTEGER NOT NULL,
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    areacode VARCHAR(10),
    phonenumber VARCHAR(10),
    email VARCHAR(100)
);

INSERT INTO chicago_contacts (contact_id, firstname, lastname, areacode, phonenumber, email)
SELECT contact_id, firstname, lastname, areacode, phonenumber, email
FROM contacts
WHERE areacode = '312';

SELECT COUNT(*) FROM chicago_contacts;

-- question 2
CREATE TEMP TABLE contacts_temp AS
SELECT * FROM contacts LIMIT 1000;

SELECT COUNT(*) FROM contacts_temp;

SELECT * FROM pg_class WHERE relname = 'contacts_temp' AND relpersistence = 't';

-- \q

-- docker exec -it postgres_db_container psql -U postgres -d contacts   

SELECT COUNT(*) FROM contacts_temp;

SELECT * FROM pg_class WHERE relname = 'contacts_temp' AND relpersistence = 't';

-- question 3
CREATE INDEX idx_lastname ON contacts (lastname);

SELECT
    indexrelid::regclass AS index_name,
    idx_scan,
    idx_tup_read,
    idx_tup_fetch
FROM
    pg_stat_all_indexes
WHERE
    indexrelid = 'idx_lastname'::regclass;

SELECT * FROM contacts WHERE lastname = 'Bryson';

SELECT
    indexrelid::regclass AS index_name,
    idx_scan,
    idx_tup_read,
    idx_tup_fetch
FROM
    pg_stat_all_indexes
WHERE
    indexrelid = 'idx_lastname'::regclass;

EXPLAIN SELECT * FROM contacts WHERE lastname = 'Bryson';

SELECT * FROM contacts WHERE lastname = 'Bryson';

SELECT
    indexrelid::regclass AS index_name,
    idx_scan,
    idx_tup_read,
    idx_tup_fetch
FROM
    pg_stat_all_indexes
WHERE
    indexrelid = 'idx_lastname'::regclass;

VACUUM ANALYZE contacts;

-- question 4
-- Size of the entire database
SELECT pg_size_pretty(pg_database_size(current_database())) AS database_size;

-- Size of the 'contacts' table
SELECT pg_size_pretty(pg_total_relation_size('contacts')) AS contacts_table_size;

-- question 5
SELECT COUNT(*) FROM contacts;

SELECT AVG(length(areacode) + 1) AS average_size_bytes FROM contacts;

SELECT AVG(length(areacode) + 1) * COUNT(*) AS areacode_size_bytes FROM contacts;

SELECT pg_size_pretty(AVG(length(areacode) + 1) * COUNT(*)::bigint) AS areacode_size FROM contacts;

SELECT * FROM contacts WHERE areacode !~ '^\d+$';

ALTER TABLE contacts ALTER COLUMN areacode TYPE int USING areacode::int;

SELECT indexname FROM pg_indexes WHERE tablename = 'contacts' AND indexdef LIKE '%areacode%';

SELECT COUNT(*) FROM contacts;

SELECT 4 * COUNT(*) AS areacode_size_bytes FROM contacts;

SELECT pg_size_pretty(4 * COUNT(*)::bigint) AS areacode_size FROM contacts;

SELECT pg_size_pretty(pg_relation_size('contacts')) AS table_size;

VACUUM ANALYZE contacts;

-- question 6
SELECT indexname FROM pg_indexes WHERE tablename = 'contacts' AND indexdef LIKE '%contact_id%';

EXPLAIN ANALYZE SELECT * FROM contacts WHERE contact_id = 10081;

CREATE INDEX idx_contact_id ON contacts(contact_id);

EXPLAIN SELECT * FROM contacts WHERE contact_id = 10081;

-- question 7
SELECT reltuples AS estimated_rows
FROM pg_class
WHERE relname = 'contacts';

SELECT n_live_tup AS estimated_rows
FROM pg_stat_all_tables
WHERE relname = 'contacts';

-- question 8
ALTER TABLE contacts SET (autovacuum_enabled = off);

DELETE FROM contacts WHERE contact_id IN (SELECT contact_id FROM contacts ORDER BY contact_id LIMIT 30000);

ANALYZE contacts;

CREATE EXTENSION pgstattuple;

SELECT * FROM pgstattuple('contacts');

VACUUM contacts;

SELECT * FROM pgstattuple('contacts');

SELECT pg_relation_size('contacts') AS table_size;

VACUUM FULL contacts;

ANALYZE contacts;

SELECT * FROM pgstattuple('contacts');

SELECT pg_relation_size('contacts') AS table_size;

ALTER TABLE contacts SET (autovacuum_enabled = on);

-- question 9
CREATE INDEX idx_areacode ON contacts (areacode);

SELECT pg_relation_size('idx_areacode') AS index_size_bytes;

EXPLAIN SELECT * FROM contacts WHERE areacode = '801';

CREATE INDEX idx_areacode_ut ON contacts (areacode) WHERE areacode IN ('801', '435', '385');

SELECT pg_relation_size('idx_areacode_ut') AS partial_index_size_bytes;

EXPLAIN SELECT * FROM contacts WHERE areacode = '801';

ANALYZE contacts;

-- question 10
SELECT pg_relation_size('contacts') AS table_size_before;

ALTER TABLE contacts ADD COLUMN mydata TEXT;

SELECT pg_relation_size('contacts') AS table_size_after_add;

UPDATE contacts SET mydata = 'Fear is the mind killer.';

SELECT pg_relation_size('contacts') AS table_size_after_update;

SELECT contact_id, mydata FROM contacts WHERE contact_id = 1;