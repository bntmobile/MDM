use MDMHERDEZCI
SELECT 'Trunca tabla Destino' AS COLUMN_ANME,'TRUNCATE TABLE [MDMHERDEZCI].[dbo].BS_DIF_MDM_AS400_MVC'
UNION ALL
SELECT COLUMN_NAME,'INSERT INTO  [MDMHERDEZCI].[dbo].BS_DIF_MDM_AS400_MVC (IDProducto, ValorAS400, ValorMDM,ValorMVC,DxTipoIssue, KbDiferencia,EnviadoA400,CargaMasiva,StatusName) 
SELECT A.IDProducto, A.['+COLUMN_NAME+'] AS AS400,M.['+COLUMN_NAME+'] AS MDM , MV.['+COLUMN_NAME+'] AS MVC, '''  +COLUMN_NAME +''' AS TipoIssue 
,'+ 
CASE  
	WHEN COLUMN_NAME ='Linea' THEN  'CASE  WHEN A.['+COLUMN_NAME+']<>M.['+COLUMN_NAME+'] OR A.['+COLUMN_NAME+']<> CAST (MV.['+COLUMN_NAME+'] AS INT) THEN 1 ELSE 0 END' 
	WHEN COLUMN_NAME ='Vida �til' THEN  'CASE  WHEN A.['+COLUMN_NAME+']<>M.['+COLUMN_NAME+'] OR A.['+COLUMN_NAME+']<> CASE WHEN MV.['+COLUMN_NAME+']=1   THEN ''Y'' ELSE ''N'' END THEN 1 ELSE 0 END' 
ELSE ' CASE  WHEN A.['+COLUMN_NAME+']<>M.['+COLUMN_NAME+'] OR A.['+COLUMN_NAME+']<> MV.['+COLUMN_NAME+']  THEN 1 ELSE 0 END'  
END
+' ,M.[Enviado a 400],	M.[Carga Masiva],	M.[Status_Name] FROM [MDMHERDEZCI].[dbo].BS_AS400 A LEFT JOIN [MDMHERDEZCI].[dbo].BS_MDM M ON A.IDProducto=M.IDProducto LEFT JOIN [MDMHERDEZCI].[dbo].BS_MVC MV on A.IDProducto=MV.idproducto '
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='BS_AS400'
AND (COLUMN_NAME NOT LIKE '%[_]A' AND COLUMN_NAME NOT LIKE '%[_]G' )
AND COLUMN_NAME NOT IN ('CB DUN14','CB EAN13','CB DUN14T','EAN13','DUN14','DUN14T')
UNION ALL
SELECT COLUMN_NAME,'INSERT INTO  [MDMHERDEZCI].[dbo].BS_DIF_MDM_AS400_MVC (IDProducto, ValorAS400, ValorMDM,ValorMVC,DxTipoIssue, KbDiferencia,EnviadoA400,CargaMasiva,StatusName) 
SELECT A.IDProducto, A.['+COLUMN_NAME+'] AS AS400,RIGHT(''000000000000000''+ISNULL(M.['+COLUMN_NAME+'] ,''0''),15) AS MDM ,RIGHT(''000000000000000''+ISNULL(MV.['+COLUMN_NAME+'] ,''0''),15) AS MVC, '''  +COLUMN_NAME +''' AS TipoIssue 
,'+ 'CASE WHEN RIGHT(''000000000000000''+ISNULL(A.['+COLUMN_NAME+'] ,''0''),15)<> RIGHT(''000000000000000''+ISNULL(M.['+COLUMN_NAME+'] ,''0''),15) OR   RIGHT(''000000000000000''+ISNULL(A.['+COLUMN_NAME+'] ,''0''),15)<> RIGHT(''000000000000000''+ISNULL(MV.['+COLUMN_NAME+'] ,''0''),15) THEN 1 ELSE 0 END'
+' ,M.[Enviado a 400],	M.[Carga Masiva],	M.[Status_Name] FROM [MDMHERDEZCI].[dbo].BS_AS400 A LEFT JOIN [MDMHERDEZCI].[dbo].BS_MDM M ON A.IDProducto=M.IDProducto LEFT JOIN [MDMHERDEZCI].[dbo].BS_MVC MV on A.IDProducto=MV.idproducto '
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='BS_AS400'
AND (COLUMN_NAME NOT LIKE '%[_]A' AND COLUMN_NAME NOT LIKE '%[_]G' )
AND COLUMN_NAME  IN ('CB DUN14','CB EAN13','CB DUN14T','EAN13','DUN14','DUN14T')

