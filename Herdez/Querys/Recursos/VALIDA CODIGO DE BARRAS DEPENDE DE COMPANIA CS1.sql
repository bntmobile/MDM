

-- CODIGO DE BARRAS DONDE DEPENDEN DE COMPANIA CS1
SELECT 
      PE.[Número del Producto]
	  ,PP.[Descripción del Recurso]
      ,PE.[Clave de Marca_Name] Marca
      ,PE.[EAN 13]
      ,SUBSTRING(PE.[Compañía GS1_Name],1,5) TIENE_CIAGS1
      ,SUBSTRING(PE.[EAN 13],4,5) as DEBE_CIAGS1
  FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ProductosExtendido] PE
  LEFT JOIN [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos] PP
   ON PP.CODE = PE.[Codigo de Producto_CODE]
  WHERE LEN([EAN 13]) >12 AND [EAN 13] LIKE '750%' 
  AND (SUBSTRING([Compañía GS1_Name],1,5) <> SUBSTRING(CONVERT(CHAR,CONVERT(BIGINT,[EAN 13])),4,5) )
  AND ([Número de Compañía_Code] <> 72 OR LEFT(PP.[Linea_Name],3) IN('100','101'))
  ORDER BY SUBSTRING(PE.[Compañía GS1_Name],1,5)


