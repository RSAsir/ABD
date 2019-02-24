SELECT
	column_name, COLUMN_TYPE
FROM
	information_schema.columns
WHERE
	table_schema = 'compraventa';