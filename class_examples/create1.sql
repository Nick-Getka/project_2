/* A number and description of each table in the database. */
CREATE TABLE table_def (
table_num	SERIAL		NOT NULL,
table_name	VARCHAR(65)	NOT NULL,
table_desc	TEXT		,
UNIQUE          (table_name),
PRIMARY KEY     (table_num));
