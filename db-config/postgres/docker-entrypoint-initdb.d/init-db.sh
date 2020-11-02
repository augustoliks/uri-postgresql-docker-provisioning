#!/bin/bash
set -e

psql --username=postgres <<-EOSQL
    CREATE DATABASE uri;
    GRANT ALL PRIVILEGES ON DATABASE uri TO postgres;
EOSQL

for sql_file in $(ls /sql); do 
    cat /sql/$sql_file
    psql --username=postgres --dbname=uri < /sql/$sql_file
done
