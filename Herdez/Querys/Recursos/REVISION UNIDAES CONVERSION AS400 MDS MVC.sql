/*
-- EJEMPLO A MOSTRAR
-- CON LO QUE SE  PUEDE VER ES QUE MDS SOBRE ESCRIBE EN BASE AL CODE A MVC
-- SE OBSERVA QUE LOS ATRIBUTOS DE CONVERSORES DE MOLES, SE PASARON AL RECURSO SANDWICH SENCILLO DE PAVO

SELECT PC.Code Productos_Converciones_code_MDS ,P.[Número de Recurso],P.[Descripción del Recurso],UDM_D.[Código de Unidad de Medida] DeUnidadDeMedida,UDM_A.[Código de Unidad de Medida] AUnidadDeMedida,pc.Factor
FROM  HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_ModeloProductos] P
INNER JOIN HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_Productos_Converciones] PC ON P.Code=PC.[Codigo de Producto_Code]
inner join HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_UnidadesDeMedida] UDM_D on PC.[De Unidad de Medida_Code]=UDM_D.Code
inner join HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_UnidadesDeMedida] UDM_A on PC.[A Unidad de Medida_Code]=UDM_A.Code
WHERE PC.Code IN (36969,36970,36971,36972)

SELECT PC.CODE ProductosConversion_Code_MVC,P.NumeroDeRecurso,P.DescripcionDelRecurso , UDM_D.Codigo DeUnidadDeMedida,UDM_A.Codigo AUnidadDeMedida,PC.Factor
FROM HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos] P
INNER JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosConversion] PC on p.MvcId=pc.CodigoDeProductoId  
INNER JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].UnidadesDeMedida UDM_D on pc.DeUnidadDeMedidaId=UDM_D.MvcId
INNER JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].UnidadesDeMedida UDM_A on pc.AUnidadDeMedidaId=UDM_A.MvcId
WHERE pC.CODE IN (36969,36970,36971,36972)






/*
AS400
*/
SELECT RESMST.RMRESC,RESMST.RMDESC ,RESMST.RMRSCL as Clase, UMCONV.UMFR,UMCONV.UMTO,UMCONV.UMCONF,UMCONV.UMCALC
FROM  OPENQUERY(HDZ54,'SELECT * FROM HDZALM.RESMST  WITH UR') RESMST
LEFT JOIN  OPENQUERY(HDZ54,'SELECT * FROM HDZALM.UMCONV WITH UR')  UMCONV
ON UMCONV.UMRESR=RESMST.RMRESC
WHERE 1=1
AND RESMST.RMRSCL='PT' 
AND RESMST.RMRESC IN ('535394','505040','39594X')
ORDER BY 1 ASC


SELECT PC.Code Productos_Converciones_code_MDS ,P.[Número de Recurso],P.[Descripción del Recurso],UDM_D.[Código de Unidad de Medida] DeUnidadDeMedida,UDM_A.[Código de Unidad de Medida] AUnidadDeMedida,pc.Factor
FROM  HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_ModeloProductos] P
INNER JOIN HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_Productos_Converciones] PC ON P.Code=PC.[Codigo de Producto_Code]
inner join HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_UnidadesDeMedida] UDM_D on PC.[De Unidad de Medida_Code]=UDM_D.Code
inner join HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_UnidadesDeMedida] UDM_A on PC.[A Unidad de Medida_Code]=UDM_A.Code
WHERE PC.Code IN  (54998,54999)

SELECT PC.CODE ProductosConversion_Code_MVC,P.NumeroDeRecurso,P.DescripcionDelRecurso , UDM_D.Codigo DeUnidadDeMedida,UDM_A.Codigo AUnidadDeMedida,PC.Factor
FROM HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos] P
INNER JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosConversion] PC on p.MvcId=pc.CodigoDeProductoId  
INNER JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].UnidadesDeMedida UDM_D on pc.DeUnidadDeMedidaId=UDM_D.MvcId
INNER JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].UnidadesDeMedida UDM_A on pc.AUnidadDeMedidaId=UDM_A.MvcId
WHERE PC.CODE IN  (54998,54999)

*/



SELECT [Descripción del Recurso],* FROM HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_ModeloProductos] P WHERE CODE=5601 UNION 
SELECT [Descripción del Recurso],* FROM HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_ModeloProductos] P WHERE CODE=1894
SELECT * FROM  HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_Productos_Converciones] WHERE [Codigo de Producto_Code] IN (5601,1894)


--SELECT DescripcionDelRecurso,* FROM HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos]  P WHERE CODE=5601 UNION 
--SELECT DescripcionDelRecurso,* FROM HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos]  P WHERE CODE=1894

SELECT P.NumeroDeRecurso,p.DescripcionDelRecurso ,PC.* 
FROM       HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos]            P
INNER JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosConversion] PC on p.MvcId=pc.CodigoDeProductoId  WHERE P.Code IN (5601,1894)





--VALORES EN MDS CODE
SELECT P.NumeroDeRecurso,P.DescripcionDelRecurso,PC.*   FROM HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos] P
INNER JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosConversion] PC on p.MvcId=pc.CodigoDeProductoId  
WHERE pC.CODE IN (36969,36970,36971,36972)

SELECT * FROM  HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_Productos_Converciones] WHERE Code IN (54998,54999)
SELECT * FROM  HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_Productos_Converciones] WHERE [Codigo de Producto_Code] IN (17327)









