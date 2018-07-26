



select  * from [BS_Cambios_Linea_MDS]

--select * 
--into BS_ANTES_vwMDM_ModeloProductos
--from [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos]  PP with(nolock) 
--WHERE PP.[Número de recurso] in (select  idproducto from [BS_Cambios_Linea_MDS])


--select PPE.*
--INTO BS_ANTES_vwMDM_ModeloProductos
--FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos] PP with(nolock)
--INNER JOIN [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ProductosExtendido] PPE with(nolock) On PPE.[Codigo de Producto_Code] = PP.[Code]
--WHERE PP.[Número de recurso] in (select  idproducto from [BS_Cambios_Linea_MDS])

 /*
 BS_vwMDM_ModeloProductos_bck19072018
 BS_vwMDM_ProductosExtendido_bck19072018

-- SELECT * into BS_vwMDM_ModeloProductos_bck19072018    FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ModeloProductos   -- [Code],					  [Linea_Code]
-- SELECT * into BS_vwMDM_ProductosExtendido_bck19072018 FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ProductosExtendido --[Codigo de Producto_Code], [Clave de Marca_Code],[Clave Compañía Alfanum_Code],[Número de Compañía_Code]

 */

select top 4 * from [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf
select top 4 * from [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_Extendido_1_Leaf


SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ModeloProductos    where code=16561
SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ProductosExtendido where [Codigo de Producto_Code]=16561 



-- (Code, Linea)
SELECT  RecursoCode,LineaCode									FROM [BS_Cambios_Linea_MDS]		WHERE idproducto<>'015028'
-- [Clave de Marca],  [Clave Compañía Alfanum], [Número de Compañía], [Codigo de Producto]
SELECT -- a.RecursoCode,
b.Code,a.MarcaCode,a.CompaniaAlfCode,a.CompaniaNumCode   
FROM [BS_Cambios_Linea_MDS] a
inner join [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ProductosExtendido b on a.RecursoCode=b.[Codigo de Producto_Code]		
WHERE a.idproducto='015028'


SELECT *--ImportType, BatchTag, CODE, Linea
from [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf

BSB20181907110000
BSB20181907130000

INSERT INTO [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf (ImportType, BatchTag		  , CODE	   , Linea    )
SELECT  0 ,'BSB20181907130000', RecursoCode, LineaCode FROM [BS_Cambios_Linea_MDS]		WHERE idproducto<>'015028'

SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf WHERE BatchTag='BSB20181907110000'
SELECT code, linea FROM [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf WHERE BatchTag='BSB20181907110000'
SELECT linea_code,linea_id, linea_name FROM BS_vwMDM_ModeloProductos_bck19072018 WHERE CODE=16561
select linea_code,linea_id, linea_name from [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ModeloProductos where code=16561



EXEC [HSVDMDDBPPSQL].[MDMHERDEZ].[stg].[udp_Productos_1_1_Leaf]  
@VersionName = 'VERSION_1',  
@LogFlag = 1,  
@BatchTag = 'BSB20181907110000'  

SELECT code, linea FROM [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf WHERE BatchTag='BSB20181907110000'
SELECT linea_code,linea_id, linea_name FROM BS_vwMDM_ModeloProductos_bck19072018 WHERE CODE=16561
select [Número de recurso],linea_code,linea_id, linea_name from [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ModeloProductos where code=16561



-------------------------


INSERT INTO [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf (ImportType, BatchTag		  , CODE	   , Linea    )
SELECT  0 ,'BSB20181907130000', RecursoCode, LineaCode FROM [BS_Cambios_Linea_MDS]		WHERE idproducto<>'015028'

SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf WHERE BatchTag='BSB20181907130000'
SELECT code, linea FROM [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf WHERE BatchTag='BSB20181907130000'
SELECT [Número de recurso],linea_code,linea_id, linea_name FROM BS_vwMDM_ModeloProductos_bck19072018 WHERE CODE in (select RecursoCode FROM [BS_Cambios_Linea_MDS]		WHERE idproducto<>'015028')
select [Número de recurso],linea_code,linea_id, linea_name from [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ModeloProductos where CODE in (select RecursoCode FROM [BS_Cambios_Linea_MDS]		WHERE idproducto<>'015028')
order by linea_code

EXEC [HSVDMDDBPPSQL].[MDMHERDEZ].[stg].[udp_Productos_1_1_Leaf]  
@VersionName = 'VERSION_1',  
@LogFlag = 1,  
@BatchTag = 'BSB20181907130000'  

SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf WHERE BatchTag='BSB20181907130000'
SELECT code, linea FROM [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf WHERE BatchTag='BSB20181907130000'
SELECT linea_code,linea_id, linea_name FROM BS_vwMDM_ModeloProductos_bck19072018 WHERE CODE=16561
select [Número de recurso],linea_code,linea_id, linea_name from [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ModeloProductos where  CODE in (select RecursoCode FROM [BS_Cambios_Linea_MDS]		WHERE idproducto<>'015028')
SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_1_1_Leaf WHERE BatchTag='BSB20181907130000'


select [Número de recurso],[Descripción del recurso],linea_code,linea_id, linea_name from [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ModeloProductos 
where CODE in (select RecursoCode FROM [BS_Cambios_Linea_MDS])
order by linea_code