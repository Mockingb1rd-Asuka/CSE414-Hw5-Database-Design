--Question 1

CREATE TABLE Sales(
    name VARCHAR(20),
    discount FLOAT,
    month INT,
    price INT
);

.mode tabs
.separator "\t"
.import mrFrumbleData.txt Sales


--Question 2

-- # is not 0
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.name = S2.name
AND S1.discount != S2.discount;

-- # is not 0
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.name = S2.name
AND S1.month != S2.month;

-- # is 0
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.name = S2.name
AND S1.price != S2.price;

-- # is not 0
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.discount = S2.discount
AND S1.name != S2.name;

-- # is not 0
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.discount = S2.discount
AND S1.month != S2.month;

-- # is not 0
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.discount = S2.discount
AND S1.price != S2.price;

-- # is not 0
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.month = S2.month
AND S1.name != S2.name;

-- # is 0
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.month = S2.month
AND S1.discount != S2.discount;

-- # is not 0
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.month = S2.month
AND S1.price != S2.price;

-- # is not 0
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.price = S2.price
AND S1.name != S2.name;

-- # is not 0
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.price = S2.price
AND S1.discount != S2.discount;

-- # is not 0
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.price = S2.price
AND S1.month != S2.month;

-- These queries check the uniqueness of function attr A -> attr B
-- If Count(*) = 0, then the function is unique, which means
-- Functional Dependencies:
-- name -> price, month -> discount

--Question 3

-- Extract {name}+, {name, month, discount} remains
CREATE TABLE S1 (
    name VARCHAR(20) REFERENCES Sales,
    price INT REFERENCES Sales
);

-- Extract {month}+, {name, month} remains
CREATE TABLE S2 (
    month INT REFERENCES Sales,
    discount FLOAT REFERENCES Sales
);

-- remaining
CREATE TABLE S3(
    name VARCHAR(20) REFERENCES Sales,
    month INT REFERENCES Sales
);


-- Question 4

INSERT INTO S1 (name, price)
SELECT name, price
FROM Sales;

INSERT INTO S2 (month, discount)
SELECT month, discount
FROM Sales;

INSERT INTO S3 (name, month)
SELECT name, month
FROM Sales;