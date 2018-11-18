--
-- PostgreSQL database dump
--
-- Login as edtadmin
CREATE USER edtadmindev WITH password 'PASSWORD_NEEDED_HERE';
GRANT edtadmindev TO edtadmin;
CREATE DATABASE edtdbdev WITH OWNER edtadmindev ENCODING = 'UTF8';
\connect edtdbdev
CREATE SCHEMA datafabric;
ALTER SCHEMA datafabric OWNER TO edtadmindev;
ALTER ROLE edtadmindev SET search_path TO datafabric;

CREATE TABLE datafabric.assets
(
    equipment_id character varying(20) NOT NULL,
    equipment_type_id character varying(20) NOT NULL,
    data jsonb,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    CONSTRAINT pk_assets PRIMARY KEY (equipment_id)
);

ALTER TABLE datafabric.assets
    OWNER to edtadmindev;

INSERT INTO datafabric.assets(
	equipment_id, equipment_type_id, data, created, updated)
	VALUES ('test', 'test', '{"name": "test"}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


CREATE USER edtadminqa WITH password 'PASSWORD_NEEDED_HERE';
GRANT edtadminqa TO edtadmin;
CREATE DATABASE edtdbqa WITH OWNER edtadminqa ENCODING = 'UTF8';
\connect edtdbqa
CREATE SCHEMA datafabric;
ALTER SCHEMA datafabric OWNER TO edtadminqa;
ALTER ROLE edtadminqa SET search_path TO datafabric;

CREATE TABLE datafabric.assets
(
    equipment_id character varying(20) NOT NULL,
    equipment_type_id character varying(20) NOT NULL,
	location point,
	route line,	
    data jsonb,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    CONSTRAINT pk_assets PRIMARY KEY (equipment_id)
);

ALTER TABLE datafabric.assets
    OWNER to edtadminqa;
	
CREATE INDEX locationindex
    ON datafabric.assets USING gist
    (location);	

INSERT INTO datafabric.assets(equipment_id, equipment_type_id, location, created, updated, data) VALUES('TestID1', 'TypeA', point(-71.060316, 48.432044), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '{"equipment_id": "test1"}');	

