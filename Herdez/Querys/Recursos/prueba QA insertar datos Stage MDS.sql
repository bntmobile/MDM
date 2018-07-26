--SELECT M.[ID] as ID_Modelo
--      ,M.[Name] as Nombre_Model
--      ,E.[Name] AS Entidad
--      ,'[stg].['+E.[StagingBase]+'_Leaf]' AS Stage
--      ,'[HSVDMDDBPPSQL].[MDMHERDEZ].Stg.'+E.[StagingBase]+'_Leaf' as Staging
--	  ,'[MDMHERDEZ].[mdm].'+V.Name AS Vista_Personalisada
--	  ,'SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].'+V.Name AS Vista_Personalisada_SQL
--	  , '[mdm].[viw_SYSTEM_'+RTRIM(CONVERT(NCHAR,M.[ID]))+'_'+RTRIM(CONVERT(NCHAR,E.[ID]))+'_CHILDATTRIBUTES]' AS VISTA_system
--	  , 'SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[viw_SYSTEM_'+RTRIM(CONVERT(NCHAR,M.[ID]))+'_'+RTRIM(CONVERT(NCHAR,E.[ID]))+'_CHILDATTRIBUTES]' AS Vw_SQL
--  FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[tblEntity] AS E
--  inner join [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[tblModel] AS M  ON E.[Model_ID] = M.[ID]
--  LEFT join  [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[tblSubscriptionView] V ON V.[Model_ID] = E.[Model_ID] AND V.[Entity_ID] = E.[ID] 
-- WHERE M.[Name] ='MDM Grupo Hérdez' AND E.[Name] LIKE '%Extendi%'
-- ORDER BY 3




IF OBJECT_ID('tempdb..#tmpBSB') IS NOT NULL
begin 
   DROP TABLE #tmpBSB
end
go

IF OBJECT_ID('tempdb..#tmpWork') IS NOT NULL
begin 
   DROP TABLE #tmpWork
end

go



DECLARE @QUERY NVARCHAR(MAX)
DECLARE @BATCHTAG NVARCHAR(40)

SET @BATCHTAG='BSB'+REPLACE(REPLACE(REPLACE(CONVERT(VARCHAR(20),GETDATE(),120),'-',''),':',''),' ','');
PRINT @BATCHTAG;
WITH data AS 
(
SELECT   TABLE_CATALOG	, TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, REPLACE(COLUMN_NAME, '_Code','') Alias, ORDINAL_POSITION
FROM INFORMATION_SCHEMA.COLUMNS
WHERE 1=1 
AND  TABLE_NAME in ('vwMDM_ProductosExtendido')
AND (COLUMN_NAME NOT LIKE '%_ID' and  COLUMN_NAME not like '%_Name')
AND  COLUMN_NAME NOT  IN ('ID','MUID','VersionName','VersionNumber','VersionFlag','ChangeTrackingMask','EnterVersionNumber','LastChgVersionNumber','ValidationStatus','EnterDateTime','LastChgDateTime')
)


           SELECT @QUERY ='SELECT 0 ImportType,'''+ @BATCHTAG+''' BatchTag,'+REPLACE( ( SELECT '['+COLUMN_NAME+'] as ['+ ALIAS + '],' 
           FROM data p2
           WHERE p2.table_name = p1.table_name
           ORDER BY ORDINAL_POSITION,COLUMN_NAME
           FOR XML PATH('') )+'FROM ' + TABLE_CATALOG +'.'+TABLE_SCHEMA+'.'+p1.table_name,',FROM',' INTO #tmpBSB FROM') 
		   FROM data p1
		   GROUP BY table_name,TABLE_CATALOG,TABLE_SCHEMA 

PRINT @QUERY


--EXEC sp_executesql @QUERY

SELECT 0 ImportType
,'BSB20180705120842' BatchTag
,PE.[Name] as [Name]
,PE.[Code] as [Code]
,PE.[Descripción Larga del Producto] as [Descripción Larga del Producto]
,PE.[Número del Producto] as [Número del Producto]
,PE.[Número Ficha Técnica] as [Número Ficha Técnica]
,PE.[Unidad Empaque] as [Unidad Empaque]
,PE.[Tipo Empaque Primario_Code] as [Tipo Empaque Primario]
,PE.[Clave de Marca_Code] as [Clave de Marca]
,PE.[Clave Compañía Alfanum_Code] as [Clave Compañía Alfanum]
,PE.[Compañía GS1_Code] as [Compañía GS1]
,PE.[Consecutivo] as [Consecutivo]
,PE.[Código de Barras GS1 8] as [Código de Barras GS1 8]
,PE.[Consecutivo EAN 13] as [Consecutivo EAN 13]
,PE.[Consecutivo DUN14] as [Consecutivo DUN14]
,PE.[Consecutivo DUN14T] as [Consecutivo DUN14T]
,PE.[Cambio EAN 13] as [Cambio EAN 13]
,PE.[Cambio DUN14] as [Cambio DUN14]
,PE.[Cambio DUN14T] as [Cambio DUN14T]
,PE.[Número de Compañía_Code] as [Número de Compañía]
,PE.[Compañía AMECE] as [Compañía AMECE]
,PE.[Precio de Venta] as [Precio de Venta]
,PE.[Codigo de Producto_Code] as [Codigo de Producto]
,PE.[EAN 13] as [EAN 13]
,PE.[DUN14] as [DUN14]
,PE.[DUN14T] as [DUN14T]
,PE.[ID de Origen] as [ID de Origen]
,PE.[Categoría de Impuestos_Code] as [Categoría de Impuestos]
,PE.[Clave de Actualizacion_Code] as [Clave de Actualizacion]
,PE.[En proceso] as [En proceso]
,PE.[Validado] as [Validado]
,PE.[Completado] as [Completado]
,PE.[Guardar] as [Guardar]
,PE.[Marca P Descripción_Code] as [Marca P Descripción]
,PE.[Comentarios_Code] as [Comentarios]
,PE.[Usuario Creación] as [Usuario Creación]
,PE.[Fecha Creación] as [Fecha Creación]
,PE.[Usuario Modificación] as [Usuario Modificación]
,PE.[Fecha Modificación] as [Fecha Modificación]
,PE.[Componentes de la OF Pack] as [Componentes de la OF Pack]
,PE.[Tipo de Almacenaje_Code] as [Tipo de Almacenaje] 
INTO #tmpBSB 
FROM MDMHERDEZ_NUTRISA.mdm.vwMDM_ProductosExtendido PE
LEFT JOIN [MDMHERDEZ_NUTRISA].[mdm].[vwMDM_ModeloProductos] PP ON PP.CODE = PE.[Codigo de Producto_CODE]
WHERE 1=1
AND LEN(PE.[EAN 13]) >12 
AND PE.[EAN 13] LIKE '750%' 
AND (SUBSTRING(PE.[Compañía GS1_Name],1,5) <> SUBSTRING(CONVERT(CHAR,CONVERT(BIGINT,PE.[EAN 13])),4,5) )
AND (PE.[Número de Compañía_Code] <> 72 OR LEFT(PP.[Linea_Name],3) IN('100','101'))


/*
	ACTUALIZACIÓN
select  code,[Código de Compañia GS1]
into #compania
from MDMHERDEZ_NUTRISA.[mdm].[vwMDM_PD_CompaniasGS1]

select *  from MDMHERDEZ_NUTRISA.[mdm].[vwMDM_PD_CompaniasGS1]

select a.* ,SUBSTRING(a.[EAN 13],4,5) 
from #tmpBSB a
inner join  #compania c on a.[Compañía GS1]=c.code

SUBSTRING(a.[EAN 13],4,5)


SELECT * INTO #tmpWork  FROM #tmpBSB
select * from #tmpWork

--update #tmpWork
--set [Descripción Larga del Producto]='BSB_MAYONESA LIMONES'

*/

--select * from  #compania

select a.* ,SUBSTRING(a.[EAN 13],4,5) ,c.code,c.[Código de Compañia GS1]
from #tmpBSB a
inner join  #compania c on SUBSTRING(a.[EAN 13],4,5)=c.[Código de Compañia GS1]

select * from #compania where [Código de Compañia GS1]=10031
select *  from MDMHERDEZ_NUTRISA.[mdm].[vwMDM_PD_CompaniasGS1] where [Código de Compañia GS1]=10031

INSERT INTO MDMHERDEZ_NUTRISA.Stg.Productos_Extendido_1_Leaf   (ImportType,BatchTag,Name,Code,[Descripción Larga del Producto],	[Número del Producto],	[Número Ficha Técnica],[Unidad Empaque],[Tipo Empaque Primario],[Clave de Marca],	[Clave Compañía Alfanum],	[Compañía GS1],	[Consecutivo],	[Código de Barras GS1 8],	[Consecutivo EAN 13],	[Consecutivo DUN14],	[Consecutivo DUN14T],	[Cambio EAN 13],	[Cambio DUN14],	[Cambio DUN14T],	[Número de Compañía],	[Compañía AMECE],	[Precio de Venta],	[Codigo de Producto],	[EAN 13],	[DUN14],	[DUN14T],	[ID de Origen],[Categoría de Impuestos],	[Clave de Actualizacion],	[En proceso],	[Validado],	[Completado],	[Guardar],	[Marca P Descripción],	[Comentarios],[Usuario Creación],	[Fecha Creación],	[Usuario Modificación],	[Fecha Modificación],	[Componentes de la OF Pack],	[Tipo de Almacenaje])
SELECT 
																ImportType,BatchTag,Name,Code,[Descripción Larga del Producto],	[Número del Producto],	[Número Ficha Técnica],[Unidad Empaque],[Tipo Empaque Primario],[Clave de Marca],	[Clave Compañía Alfanum],	[Compañía GS1],	[Consecutivo],	[Código de Barras GS1 8],	[Consecutivo EAN 13],	[Consecutivo DUN14],	[Consecutivo DUN14T],	[Cambio EAN 13],	[Cambio DUN14],	[Cambio DUN14T],	[Número de Compañía],	[Compañía AMECE],	[Precio de Venta],	[Codigo de Producto],	[EAN 13],	[DUN14],	[DUN14T],	[ID de Origen],[Categoría de Impuestos],	[Clave de Actualizacion],	[En proceso],	[Validado],	[Completado],	[Guardar],	[Marca P Descripción],	[Comentarios],[Usuario Creación],	[Fecha Creación],	[Usuario Modificación],	[Fecha Modificación],	[Componentes de la OF Pack],	[Tipo de Almacenaje]
FROM #tmpWork



--INSERT INTO MDMHERDEZ_NUTRISA.Stg.Productos_Extendido_1_Leaf   (ImportType,BatchTag,Name,Code,[Descripción Larga del Producto],	[Número del Producto],	[Número Ficha Técnica],[Unidad Empaque],[Tipo Empaque Primario],[Clave de Marca],	[Clave Compañía Alfanum],	[Compañía GS1],	[Consecutivo],	[Código de Barras GS1 8],	[Consecutivo EAN 13],	[Consecutivo DUN14],	[Consecutivo DUN14T],	[Cambio EAN 13],	[Cambio DUN14],	[Cambio DUN14T],	[Número de Compañía],	[Compañía AMECE],	[Precio de Venta],	[Codigo de Producto],	[EAN 13],	[DUN14],	[DUN14T],	[ID de Origen],[Categoría de Impuestos],	[Clave de Actualizacion],	[En proceso],	[Validado],	[Completado],	[Guardar],	[Marca P Descripción],	[Comentarios],[Usuario Creación],	[Fecha Creación],	[Usuario Modificación],	[Fecha Modificación],	[Componentes de la OF Pack],	[Tipo de Almacenaje])
--SELECT 
--																ImportType,BatchTag,Name,Code,[Descripción Larga del Producto],	[Número del Producto],	[Número Ficha Técnica],[Unidad Empaque],[Tipo Empaque Primario],[Clave de Marca],	[Clave Compañía Alfanum],	[Compañía GS1],	[Consecutivo],	[Código de Barras GS1 8],	[Consecutivo EAN 13],	[Consecutivo DUN14],	[Consecutivo DUN14T],	[Cambio EAN 13],	[Cambio DUN14],	[Cambio DUN14T],	[Número de Compañía],	[Compañía AMECE],	[Precio de Venta],	[Codigo de Producto],	[EAN 13],	[DUN14],	[DUN14T],	[ID de Origen],[Categoría de Impuestos],	[Clave de Actualizacion],	[En proceso],	[Validado],	[Completado],	[Guardar],	[Marca P Descripción],	[Comentarios],[Usuario Creación],	[Fecha Creación],	[Usuario Modificación],	[Fecha Modificación],	[Componentes de la OF Pack],	[Tipo de Almacenaje]
--FROM #tmpBSB

SELECT * FROM MDMHERDEZ_NUTRISA.Stg.Productos_Extendido_1_Leaf WHERE BatchTag='BSB20180705112152'

EXEC stg.udp_Productos_Extendido_1_Leaf
@VersionName = 'VERSION_1',  
@LogFlag = 1,  
@BatchTag = 'BSB20180705112152' 

--DELETE from MDMHERDEZ_NUTRISA.Stg.Productos_Extendido_1_Leaf where BatchTag='BSB20180705112152'

SELECT *  FROM MDMHERDEZ_NUTRISA.mdm.vwMDM_ProductosExtendido WHERE code=7081

SELECT *  FROM MDMHERDEZ_NUTRISA.mdm.vwMDM_ProductosExtendido WHERE [Compañía GS1_ID] IS NULL



SELECT LEN(PE.[EAN 13]), COUNT(1)  
FROM [MDMHERDEZ_NUTRISA].[mdm].[vwMDM_ProductosExtendido] PE
LEFT JOIN [MDMHERDEZ_NUTRISA].[mdm].[vwMDM_ModeloProductos] PP 
        														ON PP.CODE = PE.[Codigo de Producto_CODE]
WHERE 1=1
AND LEN(PE.[EAN 13]) >12 
AND PE.[EAN 13] LIKE '750%' 
AND (SUBSTRING(PE.[Compañía GS1_Name],1,5) <> SUBSTRING(CONVERT(CHAR,CONVERT(BIGINT,PE.[EAN 13])),4,5) )
AND (PE.[Número de Compañía_Code] <> 72 OR LEFT(PP.[Linea_Name],3) IN('100','101'))
GROUP BY LEN(PE.[EAN 13])

 



 
SELECT 
      PE.[Número del Producto]
	  ,PP.[Descripción del Recurso]
      ,PE.[Clave de Marca_Name] Marca
      ,PE.[EAN 13]
      ,SUBSTRING(PE.[Compañía GS1_Name],1,5) TIENE_CIAGS1
      ,SUBSTRING(PE.[EAN 13],4,5) as DEBE_CIAGS1
	  ,SUBSTRING(PE.[Compañía GS1_Name],1,5)
	  ,SUBSTRING(CONVERT(CHAR,CONVERT(BIGINT,PE.[EAN 13])),4,5)
FROM [MDMHERDEZ_NUTRISA].[mdm].[vwMDM_ProductosExtendido] PE
LEFT JOIN [MDMHERDEZ_NUTRISA].[mdm].[vwMDM_ModeloProductos] PP ON PP.CODE = PE.[Codigo de Producto_CODE]
WHERE 1=1
AND LEN(PE.[EAN 13]) >12 
AND PE.[EAN 13] LIKE '750%' 
AND (SUBSTRING(PE.[Compañía GS1_Name],1,5) <> SUBSTRING(CONVERT(CHAR,CONVERT(BIGINT,PE.[EAN 13])),4,5) )
AND (PE.[Número de Compañía_Code] <> 72 OR LEFT(PP.[Linea_Name],3) IN('100','101'))



---------------------

select * from  #recursos

select t1.Code ,t1.[Número del Producto],t1.[Compañía GS1] ,t2.CompaniaCS1Code
from #tmpBSB t1 
inner  join #recursos t2 on t2.idrecurso=t1.[Número del Producto]



INSERT INTO MDMHERDEZ_NUTRISA.Stg.Productos_Extendido_1_Leaf   (ImportType,BatchTag,Code,[Compañía GS1])
select 
0 ImportType
, 'BSB20180705160527' BatchTag
,t1.Code  as [Code]
, t2.CompaniaCS1Code as [Compañía GS1]
from #tmpBSB t1 
inner  join #recursos t2 on t2.idrecurso=t1.[Número del Producto]


select * from  MDMHERDEZ_NUTRISA.Stg.Productos_Extendido_1_Leaf 
where batchtag='BSB20180705160526'

EXEC stg.udp_Productos_Extendido_1_Leaf
@VersionName = 'VERSION_1',  
@LogFlag = 1,  
@BatchTag = 'BSB20180705160527' 

select * from MDMHERDEZ_NUTRISA.Stg.Productos_Extendido_1_Leaf 
where BatchTag='BSB20180705160527' 


select t1.code, t1.[Número del Producto],t1.[Compañía GS1] as [CompañíaGS1_Anterior],pe.[Compañía GS1_Code] as[CompañíaGS1_Actual],pe.[Compañía GS1_Name] ,cc.name
from #tmpBSB t1  
inner join  MDMHERDEZ_NUTRISA.mdm.vwMDM_ProductosExtendido pe on t1.code=pe.code
inner join MDMHERDEZ_NUTRISA.[mdm].[vwMDM_PD_CompaniasGS1] cc on cc.code=pe.[Compañía GS1_Code]
where 1=1
and t1.[Compañía GS1] <>pe.[Compañía GS1_Code]




select t1.Code ,t1.[Número del Producto],t1.[Compañía GS1] ,t2.CompaniaCS1Code
from #tmpBSB t1 
inner  join #recursos t2 on t2.idrecurso=t1.[Número del Producto]

where  t1.code=755

select name from MDMHERDEZ_NUTRISA.[mdm].[vwMDM_PD_CompaniasGS1] 
where code in (
32,
38,
45,
51)




select * from MDMHERDEZ_NUTRISA.[mdm].vwMDM_ClaveDeMarca




select * from openquery(HDZ54,'SELECT * FROM HDZALM.RESTMST')
015028