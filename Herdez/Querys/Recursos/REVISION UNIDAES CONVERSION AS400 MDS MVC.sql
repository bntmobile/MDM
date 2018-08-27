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
SELECT RESMST.RMRESC NumeroRecurso ,RESMST.RMDESC DescRecusrso , UMCONV.UMFR DeUnidadDeMedida,UMCONV.UMTO AUnidadDeMedida
,UMCONV.UMCONF Factor,UMCONV.UMCALC Calculo
into #AS400
FROM  OPENQUERY(HDZ54,'SELECT * FROM HDZALM.RESMST  WITH UR') RESMST
LEFT JOIN  OPENQUERY(HDZ54,'SELECT * FROM HDZALM.UMCONV WITH UR')  UMCONV
ON UMCONV.UMRESR=RESMST.RMRESC
WHERE 1=1
AND RESMST.RMRSCL='PT' 
--AND RESMST.RMRESC IN ('535394','505040','39594X')
ORDER BY 1 ASC

-- drop table #Mdm
SELECT 
  PC.Code Productos_Converciones_code_MDS 
, P.[Número de Recurso] NumeroRecurso
, P.[Descripción del Recurso] DescRecusrso
, UDM_D.[Código de Unidad de Medida] DeUnidadDeMedida
, UDM_A.[Código de Unidad de Medida] AUnidadDeMedida
, pc.Factor
, SUBSTRING (PC.Cálculo_Name,1,2)Calculo
INTO #MDM
 FROM  HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_ModeloProductos] P
INNER JOIN HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_Productos_Converciones] PC ON P.Code=PC.[Codigo de Producto_Code]
inner join HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_UnidadesDeMedida] UDM_D on PC.[De Unidad de Medida_Code]=UDM_D.Code
inner join HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_UnidadesDeMedida] UDM_A on PC.[A Unidad de Medida_Code]=UDM_A.Code
where P.[Clase_Name] Like 'PT%'


--DROP TABLE #MVC
SELECT 
  PC.CODE ProductosConversion_Code_MVC
, P.NumeroDeRecurso NumeroRecurso
,P.DescripcionDelRecurso  DescRecusrso
, UDM_D.Codigo DeUnidadDeMedida
, UDM_A.Codigo AUnidadDeMedida
, PC.Factor
, CC.Codigo Calculo
INTO #MVC
FROM HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos] P
LEFT JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosConversion] PC on p.MvcId=pc.CodigoDeProductoId  
LEFT JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].UnidadesDeMedida UDM_D on pc.DeUnidadDeMedidaId=UDM_D.MvcId
LEFT JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].UnidadesDeMedida UDM_A on pc.AUnidadDeMedidaId=UDM_A.MvcId
LEFT JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].[CalculosdeConversiones] CC on CC.mvcid=pc.calculoid
LEFT JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Clases] C on P.claseid=C.mvcid
where C.codigo='PT'



*/


DROP TABLE #AS400
DROP TABLE #MDM
DROP TABLE #MVC
DROP TABLE #ALL

SELECT DISTINCT  RESMST.RMRESC NumeroRecurso ,RESMST.RMDESC DescRecusrso , UMCONV.UMFR DeUnidadDeMedida,UMCONV.UMTO AUnidadDeMedida
,UMCONV.UMCONF Factor,UMCONV.UMCALC Calculo
into #AS400
FROM  OPENQUERY(HDZ54,'SELECT * FROM HDZALM.RESMST  WITH UR') RESMST
LEFT JOIN  OPENQUERY(HDZ54,'SELECT * FROM HDZALM.UMCONV WITH UR')  UMCONV
ON UMCONV.UMRESR=RESMST.RMRESC
WHERE 1=1
AND RESMST.RMRSCL='PT' 
--AND RESMST.RMRESC IN ('535394','505040','39594X')
ORDER BY 1 ASC


SELECT 
  PC.Code Productos_Converciones_code_MDS 
, P.[Número de Recurso] NumeroRecurso
, P.[Descripción del Recurso] DescRecusrso
, UDM_D.[Código de Unidad de Medida] DeUnidadDeMedida
, UDM_A.[Código de Unidad de Medida] AUnidadDeMedida
, pc.Factor
, SUBSTRING (PC.Cálculo_Name,1,2)Calculo
INTO #MDM
 FROM  HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_ModeloProductos] P
INNER JOIN HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_Productos_Converciones] PC ON P.Code=PC.[Codigo de Producto_Code]
inner join HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_UnidadesDeMedida] UDM_D on PC.[De Unidad de Medida_Code]=UDM_D.Code
inner join HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_UnidadesDeMedida] UDM_A on PC.[A Unidad de Medida_Code]=UDM_A.Code
where P.[Clase_Name] Like 'PT%'


SELECT DISTINCT
  PC.CODE ProductosConversion_Code_MVC
, P.NumeroDeRecurso NumeroRecurso
,P.DescripcionDelRecurso  DescRecusrso
, UDM_D.Codigo DeUnidadDeMedida
, UDM_A.Codigo AUnidadDeMedida
, PC.Factor
, CC.Codigo Calculo
INTO #MVC
FROM HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos] P
LEFT JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosConversion] PC on p.MvcId=pc.CodigoDeProductoId  
LEFT JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].UnidadesDeMedida UDM_D on pc.DeUnidadDeMedidaId=UDM_D.MvcId
LEFT JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].UnidadesDeMedida UDM_A on pc.AUnidadDeMedidaId=UDM_A.MvcId
LEFT JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].[CalculosdeConversiones] CC on CC.mvcid=pc.calculoid
LEFT JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Clases] C on P.claseid=C.mvcid
where C.codigo='PT'


--SELECT TOP 1 * FROM #AS400
--SELECT TOP 1 * FROM #MDM
--SELECT TOP 1 * FROM #MVC

--SELECT count(1) FROM #AS400 -- 41587 41579
--SELECT count(1) FROM #MDM   -- 41551 41551
--SELECT count(1) FROM #MVC   -- 41759 41759




--41587
--SELECT CAST(A.NumeroRecurso AS VARCHAR(10))+CAST(A.DeUnidadDeMedida AS VARCHAR(2))+CAST(A.AUnidadDeMedida AS VARCHAR(2))+CAST(A.Calculo AS VARCHAR(1)) ID
--   ,A.NumeroRecurso,A.DescRecusrso,A.DeUnidadDeMedida	,A.AUnidadDeMedida,A.Factor,A.Calculo
--  ,M.DeUnidadDeMedida DeUnidadDeMedida_MDM 	,M.AUnidadDeMedida AUnidadDeMedida_MDM,	M.Factor Factor_MDM,M.Calculo Calculo_MDM
--  ,MV.DeUnidadDeMedida DeUnidadDeMedida_MVC	,MV.AUnidadDeMedida AUnidadDeMedida_MVC,	MV.Factor Factor_MVC,MV.Calculo Calculo_MVC
--  INTO #ALL
--FROM #AS400 A
--LEFT JOIN #MDM M ON (A.NumeroRecurso=M.NumeroRecurso and A.DeUnidadDeMedida=M.DeUnidadDeMedida AND A.AUnidadDeMedida=M.AUnidadDeMedida AND A.Calculo=M.Calculo)
--LEFT JOIN #MVC MV ON (A.NumeroRecurso=MV.NumeroRecurso and A.DeUnidadDeMedida=MV.DeUnidadDeMedida AND A.AUnidadDeMedida=MV.AUnidadDeMedida AND A.Calculo=MV.Calculo)
--ORDER BY 1 DESC


-- SELECT A.* 
-- FROM #ALL A 
-- INNER JOIN
--(SELECT 
--ID, COUNT(1)CUENTA
-- FROM #ALL WHERE ID IS NOT NULL
-- GROUP BY ID
-- HAVING COUNT(1)>1)X ON A.ID=X.ID
-- ORDER BY 1



 

 SELECT A1.ID,A1.NumeroRecurso,SUBSTRING(A1.ID,7,2) DE,SUBSTRING(A1.ID,9,2) A,SUBSTRING(A1.ID,11,1)CALCULO
 ,A1.CUENTA CUENTA_AS400,M1.CUENTA CUENTA_MDM,MV1.CUENTA CUENTA_MVC
  FROM 
 (
 select    A.NumeroRecurso , A.NumeroRecurso+A.DeUnidadDeMedida+A.AUnidadDeMedida+ A.Calculo ID
 ,count(A.NumeroRecurso+A.DeUnidadDeMedida+A.AUnidadDeMedida+ A.Calculo) cuenta
 from #AS400 A 
  group by    A.NumeroRecurso , A.NumeroRecurso+A.DeUnidadDeMedida+A.AUnidadDeMedida+ A.Calculo
  )A1
  LEFT JOIN 
  (select    A.NumeroRecurso , A.NumeroRecurso+A.DeUnidadDeMedida+A.AUnidadDeMedida+ A.Calculo ID
 ,count(A.NumeroRecurso+A.DeUnidadDeMedida+A.AUnidadDeMedida+ A.Calculo) cuenta
 from #MDM A
  group by    A.NumeroRecurso , A.NumeroRecurso+A.DeUnidadDeMedida+A.AUnidadDeMedida+ A.Calculo
  )M1 ON A1.ID=M1.ID
  LEFT JOIN 
  (
  select    A.NumeroRecurso , A.NumeroRecurso+A.DeUnidadDeMedida+A.AUnidadDeMedida+ A.Calculo ID
 ,count(A.NumeroRecurso+A.DeUnidadDeMedida+A.AUnidadDeMedida+ A.Calculo) cuenta
 from #MVC  a
  group by    A.NumeroRecurso , A.NumeroRecurso+A.DeUnidadDeMedida+A.AUnidadDeMedida+ A.Calculo
  )MV1 ON A1.ID = MV1.ID
   WHERE  A1.CUENTA>1 OR M1.CUENTA>1 OR MV1.CUENTA>1