#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
	CREATE ROLE dev WITH LOGIN PASSWORD 'dev';
	CREATE DATABASE dev;
	GRANT ALL PRIVILEGES ON DATABASE dev TO dev;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d dev -c "CREATE EXTENSION ltree";
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d dev -c "CREATE EXTENSION cube";
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d dev -c "CREATE EXTENSION earthdistance";