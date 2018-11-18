DROP DATABASE IF EXISTS :dbname;
CREATE DATABASE :dbname WITH OWNER :user ENCODING = 'UTF8';
\connect :dbname

CREATE SCHEMA :schema;
ALTER SCHEMA :schema OWNER TO :user;
ALTER DATABASE :dbname SET search_path TO :schema;
