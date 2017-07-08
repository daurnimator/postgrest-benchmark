#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE ROLE api nologin;
    CREATE ROLE web_anon nologin;
    CREATE SCHEMA mockify;
    CREATE SCHEMA api;
EOSQL
