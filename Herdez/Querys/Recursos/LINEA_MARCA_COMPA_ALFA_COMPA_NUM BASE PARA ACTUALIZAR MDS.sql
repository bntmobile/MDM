
select A.*,L.*,PP.code recurso_code,PP.[Descripción del Recurso],d.*
FROM HSVDMDDB00.[MDMHERDEZCI].dbo.BS_DIF_MDM_AS400 A with(nolock)
LEFT JOIN 
(			SELECT  L.[CLAVE DE LÍNEA] as id_linea  ,L.[DESCRIPCIÓN DE LA LÍNEA]  as desc_linea ,L.CODE AS code_linea	
			FROM HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Linea L WITH(NOLOCK)
			where L.[Status 1]=1
			GROUP BY L.[CLAVE DE LÍNEA],L.[DESCRIPCIÓN DE LA LÍNEA] ,L.CODE				 
) L  ON A.ValorAS400=L.id_linea
INNER JOIN  [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos] PP with(nolock) ON PP.[Número de recurso]=A.IDProducto
left join  
/*
SE CREA SUBQUERY PARA TENER LA BASE DE JERARQUIA DE PRODUCTOS  CON TODOS SUS ATRIBUTOS
LA IDEA ES QUE  EN BASE A LA LINEA DE UN RECURSO  SABER COLOCAR CUÁL DEBERÍA SER SU MARCA, COMPANIA ALFANUM, COMPANIA NUMERICA
*/
(
SELECT DISTINCT -- P.[Número de Recurso],
  CMPNIA_ALF.Code as compania_alf_code, CMPNIA_ALF.[Código de Compañia Alfabetica] ,CMPNIA_ALF.[Nombre de Compañia Alfabetica]
, CMPNIA_NUM.[Code] as compania_num_code,CMPNIA_NUM.[Código de Compañia Numérica],CMPNIA_NUM.[Nombre de Compañia Numérica]
, M.Code as marca_code,M.[Código de Clave de Marca],M.[Nombre de Clave de Marca]
, LN.Code linea_code ,LN.[Clave de Línea],LN.[Descripción de la Línea]
-- into #tmp_datos
FROM  			    HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Productos AS P 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ProductosExtendido AS PEXT ON PEXT.[Codigo de Producto_ID] = P.ID 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Linea LN on LN.ID=P.Linea_ID
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ClaveDeMarca M on M.ID=LN.Marca_ID
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_CompaniaAlfabetica CMPNIA_ALF ON CMPNIA_ALF.ID=PEXT.[Clave Compañía Alfanum_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PD_CompaniasNumerica CMPNIA_NUM ON CMPNIA_NUM.ID= PEXT.[Número de Compañía_ID]
where 1=1
AND  LN.[Status 1]=1 
AND P.[Número de Recurso]<>'965007' -- SE QUITA ESTE PRODUCTO PORQUÉ EL PRODUCTO TENÍA
) d on  L.id_linea=d.[Clave de Línea]
WHERE 1=1
AND  A.DxTipoIssue='Linea'
order by 1



