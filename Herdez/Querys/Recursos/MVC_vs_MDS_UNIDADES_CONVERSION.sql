SELECT 
  mvc.NumeroDeRecurso NumeroDeRecurso_MVC 
, mvc.UnidadMedidaPosNutrisa UnidadMedidaPosNutrisa_MVC
, mds.UnidadMedidaPosNutrisa UnidadMedidaPosNutrisa_MDS
FROM 

(	select P.NumeroDeRecurso,udm.Nombre as UnidadMedidaPosNutrisa, P.DescripcionDelRecurso
	from		HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos] P
	INNER JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosPosNutrisa] POSNu on p.MvcId=POSNu.ProductoId
	inner join HSVDMDDBPPSQL.MVCRecursos.dbo.UnidadesDeMedida udm on POSNu.UnidadDeMedidaEstandarPosId=udm.MvcId
) mvc
INNER JOIN 
(		SELECT 
		  PP.[Número de Recurso] as NumeroDeRecurso
		, ISNULL(substring(Posnu.[Unidad de Medida Estándar POS_Name],4,10),'') UnidadMedidaPosNutrisa
		FROM	[HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos] PP with(nolock)
		LEFT JOIN  [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_Productos_Almacenes] ALM on PP.CODE=ALM.[Codigo de Producto_Code]
		inner join HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PosNutrisa POSNu on PP.CODE= POSNu.[Código de Producto_Code]
) mds on mvc.NumeroDeRecurso=mds.NumeroDeRecurso
WHERE  1=1
AND mvc.UnidadMedidaPosNutrisa<>mds.UnidadMedidaPosNutrisa
ORDER BY 1 ASC





SELECT 
  P.NumeroDeRecurso
, P.DescripcionDelRecurso
, udmD.Nombre dUnidadDeMedida
, udmA.Nombre aUnidadDeMedida
, PCONV.Factor
, CConv.Nombre as Calculo
FROM		HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos] P 
INNER JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosConversion] PCONV on P.MvcId=PCONV.CodigoDeProductoId
INNER JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].Clases C ON P.ClaseId=C.MvcId 
inner join	HSVDMDDBPPSQL.MVCRecursos.dbo.UnidadesDeMedida udmA ON PCONV.AUnidadDeMedidaId=udmA.MvcId
inner join	HSVDMDDBPPSQL.MVCRecursos.dbo.UnidadesDeMedida udmD ON PCONV.DeUnidadDeMedidaId=udmD.MvcId
inner join	HSVDMDDBPPSQL.MVCRecursos.dbo.[CalculosdeConversiones] CConv on PCONV.CalculoId=CConv.MvcId
where C.Codigo='PT'
ORDER BY 1 ASC





SELECT 
  P.NumeroDeRecurso
, udmD.Nombre dUnidadDeMedida
, udmA.Nombre aUnidadDeMedida
, count(1)
FROM		HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos] P 
INNER JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosConversion] PCONV on P.MvcId=PCONV.CodigoDeProductoId
INNER JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].Clases C ON P.ClaseId=C.MvcId 
INNER JOIN	HSVDMDDBPPSQL.MVCRecursos.dbo.UnidadesDeMedida udmA ON PCONV.AUnidadDeMedidaId=udmA.MvcId
INNER JOIN	HSVDMDDBPPSQL.MVCRecursos.dbo.UnidadesDeMedida udmD ON PCONV.DeUnidadDeMedidaId=udmD.MvcId
INNER JOIN	HSVDMDDBPPSQL.MVCRecursos.dbo.[CalculosdeConversiones] CConv on PCONV.CalculoId=CConv.MvcId
WHERE 1=1
AND C.Codigo='PT'
--and P.NumeroDeRecurso in ('545101')
GROUP BY 
 P.NumeroDeRecurso
, udmD.Nombre 
, udmA.Nombre 
HAVING COUNT(1)>1



SELECT 
  P.NumeroDeRecurso
, udmD.Nombre dUnidadDeMedida
, udmA.Nombre aUnidadDeMedida
, count(1)
FROM    HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos] P 
INNER JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosConversion] PCONV on P.MvcId=PCONV.CodigoDeProductoId
INNER JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].Clases C ON P.ClaseId=C.MvcId 
INNER JOIN HSVDMDDBPPSQL.MVCRecursos.dbo.UnidadesDeMedida udmA ON PCONV.AUnidadDeMedidaId=udmA.MvcId
INNER JOIN HSVDMDDBPPSQL.MVCRecursos.dbo.UnidadesDeMedida udmD ON PCONV.DeUnidadDeMedidaId=udmD.MvcId
INNER JOIN HSVDMDDBPPSQL.MVCRecursos.dbo.[CalculosdeConversiones] CConv on PCONV.CalculoId=CConv.MvcId
WHERE 1=1
AND C.Codigo='PT'
GROUP BY 
 P.NumeroDeRecurso
, udmD.Nombre 
, udmA.Nombre




---------------------------

SELECT P.NumeroDeRecurso,udm.Nombre as UnidadMedidaPosNutrisa, P.DescripcionDelRecurso
FROM  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos] P
INNER JOIN HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosPosNutrisa] POSNu on p.MvcId=POSNu.ProductoId
INNER JOIN HSVDMDDBPPSQL.MVCRecursos.dbo.UnidadesDeMedida udm on POSNu.UnidadDeMedidaEstandarPosId=udm.MvcId




--268


-- MARCA
-- COMPANIA NUM
-- COMPANIA ALFA


select A.*,L.*
,PP.code recurso_code
,pp.[Descripción del Recurso]
FROM HSVDMDDB00.[MDMHERDEZCI].dbo.BS_DIF_MDM_AS400 A with(nolock)
LEFT JOIN 
(			
			SELECT 
					 L.[CLAVE DE LÍNEA] as id_linea 
					,L.[DESCRIPCIÓN DE LA LÍNEA]  as desc_linea
					,L.CODE AS code_linea	
			FROM HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Linea L WITH(NOLOCK)
			where L.[Status 1]=1
			GROUP BY L.[CLAVE DE LÍNEA]
					,L.[DESCRIPCIÓN DE LA LÍNEA]  
					,L.CODE 
					 
) L  ON A.ValorAS400=L.id_linea
INNER JOIN  [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos] PP with(nolock) ON PP.[Número de recurso]=A.IDProducto
WHERE 1=1
AND  A.DxTipoIssue='Linea'
order by 1


