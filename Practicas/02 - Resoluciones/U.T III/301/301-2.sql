SELECT 
	table_name, table_type, engine
FROM
	information_schema.tables
WHERE
	table_schema = 'compraventa'; -- MySQL llama 'schema' a la BD.