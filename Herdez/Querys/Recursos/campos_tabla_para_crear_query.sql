
DECLARE @QUERY NVARCHAR(MAX)

with data as (
SELECT 
 TABLE_CATALOG	
 ,TABLE_SCHEMA
,TABLE_NAME
, COLUMN_NAME  
,ORDINAL_POSITION

FROM INFORMATION_SCHEMA.COLUMNS
where 1=1 
--AND TABLE_CATALOG='sethdzqa'  
AND  TABLE_NAME in ('vwMDM_ProductosExtendido')
and (COLUMN_NAME not like '%_ID' and  COLUMN_NAME not like '%_Name')
and COLUMN_NAME not  in ('ID','MUID','VersionName','VersionNumber','VersionFlag','ChangeTrackingMask','EnterVersionNumber','LastChgVersionNumber','ValidationStatus','EnterDateTime','LastChgDateTime')
)

SELECT @QUERY ='SELECT '+
      REPLACE( ( SELECT '['+COLUMN_NAME+']' + ',' 
           FROM data p2
          WHERE p2.table_name = p1.table_name
          ORDER BY ORDINAL_POSITION,COLUMN_NAME
            FOR XML PATH('') )+'FROM ' + TABLE_CATALOG +'.'+TABLE_SCHEMA+'.'+p1.table_name,',FROM',' FROM') 
FROM data p1
      GROUP BY table_name,TABLE_CATALOG	,TABLE_SCHEMA 

PRINT @QUERY

EXEC sp_executesql @QUERY


