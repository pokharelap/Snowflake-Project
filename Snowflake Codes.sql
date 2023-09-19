Snowflake:

-- Create a Database
CREATE DATABASE DATAANALYTICS;

-- Use the Database
USE DATABASE DATAANALYTICS;

-- Create a Schema within the Database
CREATE SCHEMA DATAANALYTICS_12345;

-- Create an AWS S3 Integration
CREATE OR REPLACE STORAGE INTEGRATION aws_s3_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::380460936039:role/dataanalyticsrole'
  ENABLED = TRUE
  STORAGE_ALLOWED_LOCATIONS = ('s3://dataanalytics787889/');

  SHOW INTEGRATIONS;

  DESC integration aws_s3_integration;

GRANT usage on integration aws_s3_integration to role accountadmin;

create or replace file format DATAANALYTICS_FORMAT
type='CSV'
field_delimiter='|'
skip_header=1;

Create or replace stage dataanalytics_aws_stage
storage_integration = ‘aws_s3_integration’
file_format = DATAANALYTICS_FORMAT
url = 's3://dataanalytics787889/';

list @dataanalytics_aws_stage;

remove @DATAANALYTICS_AWS_STAGE/Diabetes.csv

-- Create a table with DATE columns and double quotes around column names
CREATE TABLE your_table_name (
  "Date" DATE,
  "F1 final" DATE,
  "F2A final" DATE,
  "F2B final" DATE,
  "3rd final" DATE,
  "4th final" DATE,
  "F1 filing" DATE,
  "F2A filing" DATE,
  "F2B filing" DATE,
  "3rd filing" DATE,
  "4th filing" DATE
);

CREATE OR REPLACE FILE FORMAT my_csv_format
TYPE = 'CSV'
SKIP_HEADER = 1
ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE;

COPY INTO visa
FROM @dataanalytics_aws_stage/Visa.csv
ON_ERROR = 'CONTINUE';



SELECT
   COUNT("F1 final") AS "F1 Final Missing",
   COUNT("F2A final") AS "F2A Final Missing",
   COUNT("F2B final") AS "F2B Final Missing",
   COUNT("3rd final") AS "3rd Final Missing",
   COUNT("4th final") AS "4th Final Missing",
   COUNT("F1 filing") AS "F1 Filing Missing",
   COUNT("F2A filing") AS "F2A Filing Missing",
   COUNT("F2B filing") AS "F2B Filing Missing",
   COUNT("3rd filing") AS "3rd Filing Missing",
   COUNT("4th filing") AS "4th Filing Missing"
FROM visa;


F1 Final Missing	F2A Final Missing	F2B Final Missing	3rd Final Missing	4th Final Missing	F1 Filing Missing	F2A Filing Missing	F2B Filing Missing	3rd Filing Missing	4th Filing Missing
95	95	95	95	95	261	261	261	261	261


