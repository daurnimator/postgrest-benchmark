psql -p 1234 -h 127.0.0.1 -d postgres -1 -c 'create role postgres;' -f 1-init-user-db.sql -f 5-schema-mockify.sql  -f 6-schema-api.sql -f  9-user-grants.sql -f data.sql
