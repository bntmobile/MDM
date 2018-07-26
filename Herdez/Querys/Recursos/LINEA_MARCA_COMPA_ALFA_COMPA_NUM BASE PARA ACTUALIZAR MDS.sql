
select A.*,L.*,PP.code recurso_code,PP.[Descripci�n del Recurso],d.*
FROM HSVDMDDB00.[MDMHERDEZCI].dbo.BS_DIF_MDM_AS400 A with(nolock)
LEFT JOIN 
(			SELECT  L.[CLAVE DE L�NEA] as id_linea  ,L.[DESCRIPCI�N DE LA L�NEA]  as desc_linea ,L.CODE AS code_linea	
			FROM HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Linea L WITH(NOLOCK)
			where L.[Status 1]=1
			GROUP BY L.[CLAVE DE L�NEA],L.[DESCRIPCI�N DE LA L�NEA] ,L.CODE				 
) L  ON A.ValorAS400=L.id_linea
INNER JOIN  [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos] PP with(nolock) ON PP.[N�mero de recurso]=A.IDProducto
left join  
/*
SE CREA SUBQUERY PARA TENER LA BASE DE JERARQUIA DE PRODUCTOS  CON TODOS SUS ATRIBUTOS
LA IDEA ES QUE  EN BASE A LA LINEA DE UN RECURSO  SABER COLOCAR CU�L DEBER�A SER SU MARCA, COMPANIA ALFANUM, COMPANIA NUMERICA
*/
(
SELECT DISTINCT -- P.[N�mero de Recurso],
  CMPNIA_ALF.Code as compania_alf_code, CMPNIA_ALF.[C�digo de Compa�ia Alfabetica] ,CMPNIA_ALF.[Nombre de Compa�ia Alfabetica]
, CMPNIA_NUM.[Code] as compania_num_code,CMPNIA_NUM.[C�digo de Compa�ia Num�rica],CMPNIA_NUM.[Nombre de Compa�ia Num�rica]
, M.Code as marca_code,M.[C�digo de Clave de Marca],M.[Nombre de Clave de Marca]
, LN.Code linea_code ,LN.[Clave de L�nea],LN.[Descripci�n de la L�nea]
-- into #tmp_datos
FROM  			    HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Productos AS P 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ProductosExtendido AS PEXT ON PEXT.[Codigo de Producto_ID] = P.ID 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Linea LN on LN.ID=P.Linea_ID
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ClaveDeMarca M on M.ID=LN.Marca_ID
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_CompaniaAlfabetica CMPNIA_ALF ON CMPNIA_ALF.ID=PEXT.[Clave Compa��a Alfanum_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PD_CompaniasNumerica CMPNIA_NUM ON CMPNIA_NUM.ID= PEXT.[N�mero de Compa��a_ID]
where 1=1
AND  LN.[Status 1]=1 
AND P.[N�mero de Recurso]<>'965007' -- SE QUITA ESTE PRODUCTO PORQU� EL PRODUCTO TEN�A
) d on  L.id_linea=d.[Clave de L�nea]
WHERE 1=1
AND  A.DxTipoIssue='Linea'
order by 1



