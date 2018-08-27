
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





