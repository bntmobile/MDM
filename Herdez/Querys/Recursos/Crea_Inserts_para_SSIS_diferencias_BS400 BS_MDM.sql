SELECT COLUMN_NAME,' INSERT INTO BS_DIF_MDM_AS400 (IDProducto, ValorAS400, ValorMDM,DxTipoIssue) SELECT A.IDProducto, A.['+COLUMN_NAME+'] AS AS400,M.['+COLUMN_NAME+'] AS MDM ,'''+COLUMN_NAME +''' AS TipoIssue FROM BS_AS400 A LEFT JOIN BS_MDM M ON A.IDProducto=M.IDProducto WHERE A.['+COLUMN_NAME+']<>M.['+COLUMN_NAME+'] '
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='BS_AS400'
AND (COLUMN_NAME NOT LIKE '%[_]A' AND COLUMN_NAME NOT LIKE '%[_]G' )
AND COLUMN_NAME NOT IN (
'CB DUN14',
'CB EAN13',
'CB DUN14T',
'EAN13',
'DUN14',
'DUN14T'
)

SELECT COLUMN_NAME,'INSERT INTO BS_DIF_MDM_AS400 (IDProducto, ValorAS400, ValorMDM,DxTipoIssue) SELECT A.IDProducto, A.['+COLUMN_NAME+'] AS AS400,M.['+COLUMN_NAME+'] AS MDM ,'''+COLUMN_NAME +''' AS TipoIssue FROM BS_AS400 A LEFT JOIN BS_MDM M ON A.IDProducto=M.IDProducto WHERE RIGHT(''000000000000000''+ISNULL(A.['+COLUMN_NAME+'] ,''0''),15)<> RIGHT(''000000000000000''+ISNULL(M.['+COLUMN_NAME+'] ,''0''),15) '
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='BS_AS400'
AND (COLUMN_NAME NOT LIKE '%[_]A' AND COLUMN_NAME NOT LIKE '%[_]G' )
AND COLUMN_NAME  IN (
'CB DUN14',
'CB EAN13',
'CB DUN14T',
'EAN13',
'DUN14',
'DUN14T'
)

