drop table #CONV_MVC
drop table #CONV_MDS


SELECT 
--  PC.ID
 PC.Code ProductosConversion_Code
, P.code NumeroDeRecurso_Code
, P.[Número de Recurso] NumeroDeRecurso
, P.[Descripción del Recurso]DescripcionDelRecurso
, UDM_D.[Código de Unidad de Medida] DeUnidadDeMedida
, UDM_A.[Código de Unidad de Medida] AUnidadDeMedida
, PC.Factor
INTO #CONV_MDS
FROM  HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_ModeloProductos] P
INNER JOIN HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_Productos_Converciones] PC ON P.Code=PC.[Codigo de Producto_Code]
inner join HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_UnidadesDeMedida] UDM_D on PC.[De Unidad de Medida_Code]=UDM_D.Code
inner join HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_UnidadesDeMedida] UDM_A on PC.[A Unidad de Medida_Code]=UDM_A.Code



SELECT 
--PC.MvcId as Id
PC.CODE ProductosConversion_Code
,P.CODE NumeroDeRecurso_Code
,P.NumeroDeRecurso,P.DescripcionDelRecurso 
, UDM_D.Codigo DeUnidadDeMedida
,UDM_A.Codigo AUnidadDeMedida
,PC.Factor
INTO #CONV_MVC
FROM HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos] P
INNER JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosConversion] PC on p.MvcId=pc.CodigoDeProductoId  
INNER JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].UnidadesDeMedida UDM_D on pc.DeUnidadDeMedidaId=UDM_D.MvcId
INNER JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].UnidadesDeMedida UDM_A on pc.AUnidadDeMedidaId=UDM_A.MvcId


-- 120
SELECT MDS.*,MVC.* 
FROM #CONV_MDS  MDS 
FULL OUTER JOIN   #CONV_MVC MVC ON MDS.ProductosConversion_Code=MVC.ProductosConversion_Code
WHERE 1=1
AND  MDS.NumeroDeRecurso<>MVC.NumeroDeRecurso
--AND MDS.DeUnidadDeMedida= MVC.DeUnidadDeMedida
--AND MDS.AUnidadDeMedida= MVC.AUnidadDeMedida
--AND MDS.Factor=MVC.Factor
AND mds.ProductosConversion_Code in (36969, 36970, 36971,36972)






SELECT * 
FROM #CONV_MDS  MDS 
FULL OUTER JOIN   #CONV_MVC MVC ON MDS.ProductosConversion_Code=MVC.Id
WHERE 1=1
AND  MDS.NumeroDeRecurso<>MVC.NumeroDeRecurso
--AND MDS.DeUnidadDeMedida= MVC.DeUnidadDeMedida
--AND MDS.AUnidadDeMedida= MVC.AUnidadDeMedida
--AND MDS.Factor=MVC.Factor
