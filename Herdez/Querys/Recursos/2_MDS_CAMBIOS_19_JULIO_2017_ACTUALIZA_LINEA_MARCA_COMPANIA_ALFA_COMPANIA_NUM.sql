
--BSB20181907140000
--BSB20181907160000
--BSB20181907170000

/*
Se almacenó las tablas en el server 00 EN LA BD MDMHERDEZCI
*/

--INSERT INTO [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_Extendido_1_Leaf 
--      (ImportType, BatchTag		   , code		,[Clave de Marca],  [Clave Compañía Alfanum], [Número de Compañía], [Codigo de Producto])
																		
--SELECT 0		,'BSB20181907170000', b.Code	,a.MarcaCode		,a.CompaniaAlfCode		,a.CompaniaNumCode ,[Codigo de Producto_Code]  
--FROM [BS_Cambios_Linea_MDS] a
--inner join [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ProductosExtendido b on a.RecursoCode=b.[Codigo de Producto_Code]		
--WHERE a.idproducto<>'015028'

EXEC [HSVDMDDBPPSQL].[MDMHERDEZ].[stg].[udp_Productos_Extendido_1_Leaf]  
@VersionName = 'VERSION_1',  
@LogFlag = 1,  
@BatchTag = 'BSB20181907170000'  

select * from [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_Extendido_1_Leaf  where BatchTag='BSB20181907170000'


select 
 [Número del Producto]
,[Descripción Larga del Producto]
,[Clave de Marca_Code]
,[Clave de Marca_Name]	
,[Clave de Marca_ID]
,[Clave Compañía Alfanum_Code]
,[Clave Compañía Alfanum_Name]
,[Clave Compañía Alfanum_ID]
,[Número de Compañía_Code]
,[Número de Compañía_Name]
,[Número de Compañía_ID]
from [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ModeloProductos P
inner join [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ProductosExtendido E on p.code=E.[Codigo de Producto_Code]
where p.CODE in (select RecursoCode FROM [BS_Cambios_Linea_MDS]		WHERE idproducto<>'015028')




select * from [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf  where BatchTag='BSB20181907110000'
select * from [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_Extendido_1_Leaf  where BatchTag='BSB20181907140000'



SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf         WITH(NOLOCK)  WHERE BatchTag like 'BSB201819%'
SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_Extendido_1_Leaf WITH(NOLOCK)  WHERE BatchTag like 'BSB201819%'



