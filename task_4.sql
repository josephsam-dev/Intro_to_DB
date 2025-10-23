-- task_4.sql
-- List full description of the table books without using DESCRIBE or EXPLAIN

SELECT 
    COLUMN_NAME AS 'COLUMN',
    COLUMN_TYPE AS 'TYPE',
    IS_NULLABLE AS 'NULL',
    COLUMN_DEFAULT AS 'DEFAULT',
    COLUMN_KEY AS 'KEY',
    EXTRA AS 'EXTRA'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()  -- uses the current database
  AND TABLE_NAME = 'books';
