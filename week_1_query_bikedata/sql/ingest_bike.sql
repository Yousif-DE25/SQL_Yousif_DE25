CREATE SCHEMA IF NOT EXSITS staging;

CREATE SCHEMA IF NOT EXSITS staging.orders AS (
    SELECT * FROM read_csv_auto('data/orders.csv')
);

CREATE SCHEMA IF NOT EXSITS staging.customers AS (
    SELECT * FROM read_csv_auto('data/customers.csv')
);
