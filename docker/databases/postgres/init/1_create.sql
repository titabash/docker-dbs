/* DATABASEを初期化 */
create role testuser login password 'password';
CREATE DATABASE pgtest;
grant all privileges on database pgtest to user1;

\c pgtest;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

create table testtbl
(
  id SERIAL NOT NULL,
  name varchar,
  salary int8,
  PRIMARY KEY (id)
);
