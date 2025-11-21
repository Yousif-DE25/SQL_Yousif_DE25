CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.employees AS (
    SELECT * FROM read_csv_auto('data/employees.csv')
);

CREATE TABLE IF NOT EXISTS staging.more_employees AS (
    SELECT * FROM read_csv_auto('data/more_employees.csv')
);
