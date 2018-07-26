SELECT 
  mvc.NumeroDeRecurso NumeroDeRecurso_MVC 
, mvc.UnidadMedidaPosNutrisa UnidadMedidaPosNutrisa_MVC
, mds.UnidadMedidaPosNutrisa UnidadMedidaPosNutrisa_MDS
FROM 

(	select P.NumeroDeRecurso,udm.Nombre as UnidadMedidaPosNutrisa, P.DescripcionDelRecurso
	from  [MVCRecursos].[dbo].[Productos] P
	INNER JOIN [MVCRecursos].[dbo].[ProductosPosNutrisa] POSNu on p.MvcId=POSNu.ProductoId
	inner join MVCRecursos.dbo.UnidadesDeMedida udm on POSNu.UnidadDeMedidaEstandarPosId=udm.MvcId
) mvc
INNER JOIN 
(		SELECT 
		  PP.[Número de Recurso] as NumeroDeRecurso
		, ISNULL(substring(Posnu.[Unidad de Medida Estándar POS_Name],4,10),'') UnidadMedidaPosNutrisa
		FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos] PP with(nolock)
		LEFT JOIN  [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_Productos_Almacenes] ALM on PP.CODE=ALM.[Codigo de Producto_Code]
		inner join HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PosNutrisa POSNu on PP.CODE= POSNu.[Código de Producto_Code]
) mds on mvc.NumeroDeRecurso=mds.NumeroDeRecurso
WHERE  1=1
AND mvc.UnidadMedidaPosNutrisa<>mds.UnidadMedidaPosNutrisa
ORDER BY 1 ASC



SELECT mvc.NumeroDeRecurso NumeroDeRecurso_MVC ,mds.NumeroDeRecurso NumeroDeRecurso_MDS
FROM 

(   SELECT P.NumeroDeRecurso
	FROM  [MVCRecursos].[dbo].[Productos] P INNER JOIN  [MVCRecursos].[dbo].Clases C ON P.ClaseId=C.MvcId where C.Codigo='PT'
) mvc
LEFT JOIN 
(       SELECT 
		  PP.[Número de Recurso] as NumeroDeRecurso
		FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos] PP with(nolock) WHERE Clase_Name='PT PRODUCTO TERMINADO'
) mds on mvc.NumeroDeRecurso=mds.NumeroDeRecurso
WHERE  1=1
AND mds.NumeroDeRecurso IS NULL
ORDER BY 1 ASC


SELECT 
  P.NumeroDeRecurso
, P.DescripcionDelRecurso
, udmD.Nombre dUnidadDeMedida
, udmA.Nombre aUnidadDeMedida
, PCONV.Factor
, CConv.Nombre as Calculo
FROM    [MVCRecursos].[dbo].[Productos] P 
INNER JOIN  [MVCRecursos].[dbo].[ProductosConversion] PCONV on P.MvcId=PCONV.CodigoDeProductoId
INNER JOIN  [MVCRecursos].[dbo].Clases C ON P.ClaseId=C.MvcId 
inner join MVCRecursos.dbo.UnidadesDeMedida udmA ON PCONV.AUnidadDeMedidaId=udmA.MvcId
inner join MVCRecursos.dbo.UnidadesDeMedida udmD ON PCONV.DeUnidadDeMedidaId=udmD.MvcId
inner join MVCRecursos.dbo.[CalculosdeConversiones] CConv on PCONV.CalculoId=CConv.MvcId
where C.Codigo='PT'
ORDER BY 1 ASC





SELECT 
  P.NumeroDeRecurso
, udmD.Nombre dUnidadDeMedida
, udmA.Nombre aUnidadDeMedida
, count(1)
FROM    [MVCRecursos].[dbo].[Productos] P 
INNER JOIN  [MVCRecursos].[dbo].[ProductosConversion] PCONV on P.MvcId=PCONV.CodigoDeProductoId
INNER JOIN  [MVCRecursos].[dbo].Clases C ON P.ClaseId=C.MvcId 
INNER JOIN MVCRecursos.dbo.UnidadesDeMedida udmA ON PCONV.AUnidadDeMedidaId=udmA.MvcId
INNER JOIN MVCRecursos.dbo.UnidadesDeMedida udmD ON PCONV.DeUnidadDeMedidaId=udmD.MvcId
INNER JOIN MVCRecursos.dbo.[CalculosdeConversiones] CConv on PCONV.CalculoId=CConv.MvcId
WHERE 1=1
AND C.Codigo='PT'
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
FROM    [MVCRecursos].[dbo].[Productos] P 
INNER JOIN  [MVCRecursos].[dbo].[ProductosConversion] PCONV on P.MvcId=PCONV.CodigoDeProductoId
INNER JOIN  [MVCRecursos].[dbo].Clases C ON P.ClaseId=C.MvcId 
INNER JOIN MVCRecursos.dbo.UnidadesDeMedida udmA ON PCONV.AUnidadDeMedidaId=udmA.MvcId
INNER JOIN MVCRecursos.dbo.UnidadesDeMedida udmD ON PCONV.DeUnidadDeMedidaId=udmD.MvcId
INNER JOIN MVCRecursos.dbo.[CalculosdeConversiones] CConv on PCONV.CalculoId=CConv.MvcId
WHERE 1=1
AND C.Codigo='PT'
--and P.NumeroDeRecurso in (

--'535336', '535395' 
--)
GROUP BY 
 P.NumeroDeRecurso
, udmD.Nombre 
, udmA.Nombre




---------------------------

SELECT P.NumeroDeRecurso,udm.Nombre as UnidadMedidaPosNutrisa, P.DescripcionDelRecurso
FROM  [MVCRecursos].[dbo].[Productos] P
INNER JOIN [MVCRecursos].[dbo].[ProductosPosNutrisa] POSNu on p.MvcId=POSNu.ProductoId
INNER JOIN MVCRecursos.dbo.UnidadesDeMedida udm on POSNu.UnidadDeMedidaEstandarPosId=udm.MvcId



select P.NumeroDeRecurso,L.DescripcionCorta  
FROM  [MVCRecursos].[dbo].[Productos] P with(nolock)
left join [MVCRecursos].[dbo].Lineas L with(nolock) on P.LineaId=L.MvcId
where p.NumeroDeRecurso in 
(
'015930',
'025018',
'025025',
'025100',
'025117',
'025209',
'025216',
'025308',
'025910',
'025920',
'025930',
'035022',
'035114',
'045012',
'045029',
'045036',
'055088',
'055090',
'055110',
'055206',
'055217',
'065700',
'075060',
'075075',
'075082',
'085010',
'085020',
'085102',
'135600',
'145103',
'145109',
'145210',
'145220',
'145230',
'145240',
'145350',
'145363',
'145400',
'145410',
'145420',
'145430',
'145440',
'315540',
'315550',
'315600',
'315640',
'315650',
'315660',
'315670',
'315680',
'315690',
'315700',
'315710',
'315720',
'315740',
'315750',
'315760',
'315770',
'315800',
'315820',
'315830',
'455010',
'455020',
'455050',
'455070',
'455080',
'455090',
'455100',
'665001',
'665002',
'665070',
'665080',
'665090',
'665170',
'665180',
'665190',
'665200',
'665210',
'665220',
'665230',
'665240',
'665250',
'745034',
'745560',
'745570',
'745710',
'745722',
'755001',
'755002',
'755003',
'755004',
'755005',
'755006',
'755007',
'755008',
'755009',
'755010',
'755011',
'755012',
'755013',
'755014',
'755015',
'755016',
'755017',
'755018',
'755019',
'755020',
'755021',
'755022',
'755023',
'755024',
'755025',
'755026',
'755027',
'755028',
'785001',
'785002',
'785003',
'785004',
'785005',
'785006',
'785007',
'785008',
'785009',
'785026',
'785027',
'785028',
'785029',
'785031',
'785033',
'785034',
'785035',
'785076',
'785077',
'785078',
'785080',
'785082',
'785083',
'785084',
'785085',
'785086',
'785087',
'785089',
'785090',
'785091',
'785092',
'785151',
'785152',
'785153',
'785155',
'785156',
'785158',
'785159',
'785160',
'785161',
'785162',
'785226',
'785229',
'785230',
'785231',
'785232',
'785233',
'785236',
'785237',
'785239',
'785301',
'785303',
'785304',
'785305',
'785306',
'785308',
'785310',
'785311',
'785312',
'785313',
'785376',
'785377',
'785378',
'785379',
'785383',
'785384',
'785451',
'785452',
'785453',
'785456',
'785457',
'785466',
'785527',
'785528',
'785529',
'785532',
'785533',
'785536',
'785537',
'785539',
'785601',
'785602',
'795010',
'795020',
'795030',
'795040',
'795050',
'795110',
'795120',
'795900',
'795910',
'805110',
'805200',
'865001',
'865002',
'865003',
'865005',
'865006',
'865010',
'865020',
'865030',
'865040',
'865060',
'865070',
'865080',
'865090',
'865100',
'865110',
'865120',
'865130',
'865140',
'865150',
'865160',
'865210',
'865220',
'865230',
'865240',
'865250',
'865260',
'865280',
'865290',
'865300',
'865310',
'865320',
'865330',
'865340',
'865350',
'865360',
'865370',
'865900',
'865980',
'865990',
'925090',
'975102'
)

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



select * from [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos]


--SELECT 
--					 L.[CLAVE DE LÍNEA] as id_linea 
--					,L.[DESCRIPCIÓN DE LA LÍNEA]  as desc_linea
--					,L.CODE AS code_linea	
--			FROM HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Linea L WITH(NOLOCK)
			
--			GROUP BY L.[CLAVE DE LÍNEA]
--					,L.[DESCRIPCIÓN DE LA LÍNEA]  
--					,L.CODE 
--					ORDER BY 1 DESC