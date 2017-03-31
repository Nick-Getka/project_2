#!/bin/sh



psql ntg7 << EOF
\i create_tables.sql
\i create_temp.sql
\i data_cleaning.sql
\i inserting_data.sql

EOF
