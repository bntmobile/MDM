
--BSB20181907140000
--BSB20181907160000
--BSB20181907170000

/*
Se almacen� las tablas en el server 00 EN LA BD MDMHERDEZCI
*/

--INSERT INTO [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_Extendido_1_Leaf 
--      (ImportType, BatchTag		   , code		,[Clave de Marca],  [Clave Compa��a Alfanum], [N�mero de Compa��a], [Codigo de Producto])
																		
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
 [N�mero del Producto]
,[Descripci�n Larga del Producto]
,[Clave de Marca_Code]
,[Clave de Marca_Name]	
,[Clave de Marca_ID]
,[Clave Compa��a Alfanum_Code]
,[Clave Compa��a Alfanum_Name]
,[Clave Compa��a Alfanum_ID]
,[N�mero de Compa��a_Code]
,[N�mero de Compa��a_Name]
,[N�mero de Compa��a_ID]
from [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ModeloProductos P
inner join [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ProductosExtendido E on p.code=E.[Codigo de Producto_Code]
where p.CODE in (select RecursoCode FROM [BS_Cambios_Linea_MDS]		WHERE idproducto<>'015028')




select * from [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf  where BatchTag='BSB20181907110000'
select * from [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_Extendido_1_Leaf  where BatchTag='BSB20181907140000'



SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf         WITH(NOLOCK)  WHERE BatchTag like 'BSB201819%'
SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_Extendido_1_Leaf WITH(NOLOCK)  WHERE BatchTag like 'BSB201819%'



