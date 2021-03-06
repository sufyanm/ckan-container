#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE ROLE ckan NOSUPERUSER NOCREATEDB NOCREATEROLE LOGIN PASSWORD 'ckan';
    CREATE DATABASE ckan OWNER ckan ENCODING 'utf-8';
    GRANT ALL PRIVILEGES ON DATABASE ckan TO ckan;

    CREATE ROLE datastore NOSUPERUSER NOCREATEDB NOCREATEROLE LOGIN PASSWORD 'datastore';
    CREATE ROLE datastore_ro NOSUPERUSER NOCREATEDB NOCREATEROLE LOGIN PASSWORD 'datastore_ro';
    CREATE DATABASE datastore OWNER datastore ENCODING 'utf-8';
    GRANT ALL PRIVILEGES ON DATABASE datastore TO datastore;
EOSQL
