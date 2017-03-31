#!/bin/sh



psql create_db.sql << EOF
\i create_tables.sql
\i create_temp.sql
\i data_cleaning.sql
\i inserting_data.sql

EOF
