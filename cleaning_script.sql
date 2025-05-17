-- 1. Remove duplicate rows
DELETE FROM customers
WHERE rowid NOT IN (
  SELECT MIN(rowid)
  FROM customers
  GROUP BY CustomerID, Name, Email, Phone, JoinDate
);

-- 2. Remove rows with NULL CustomerID
DELETE FROM customers
WHERE CustomerID IS NULL;

-- 3. Fix invalid email addresses
UPDATE customers
SET Email = NULL
WHERE Email NOT LIKE '%@%.%';

-- 4. Fix invalid dates
UPDATE customers
SET JoinDate = NULL
WHERE JoinDate = 'InvalidDate';

-- 5. Standardize phone numbers (remove any NULL)
DELETE FROM customers
WHERE Phone IS NULL;
