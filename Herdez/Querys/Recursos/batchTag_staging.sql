DECLARE @BATCH_TAG NVARCHAR(20)
SET @BATCH_TAG='BS'
SET @BATCH_TAG= @BATCH_TAG +replace(replace(replace(convert(varchar(20), getdate(),20),'-',''),' ',''),':','')
print @BATCH_TAG

-- INSERT INTO [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_Converciones_1_Leaf (ImportType,BatchTag, Code)
SELECT   4,@BATCH_TAG, conv.Code 
from [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos] PP with(nolock)
INNER JOIN [MDMHERDEZ].[mdm].[vwMDM_Productos_Converciones] CONV with(nolock) ON PP.CODE=CONV.[Codigo de Producto_Code]
INNER JOIN (
				SELECT PP.[Número de Recurso],CONV.[De Unidad de Medida_Name],CONV.[A Unidad de Medida_Name] ,COUNT(1) CUENTA
				FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos] PP with(nolock)
				INNER JOIN [MDMHERDEZ].[mdm].[vwMDM_Productos_Converciones] CONV with(nolock) ON PP.CODE=CONV.[Codigo de Producto_Code]
				WHERE PP.Clase_Name='PT PRODUCTO TERMINADO'
				GROUP BY  PP.[Número de Recurso],CONV.[De Unidad de Medida_Name],CONV.[A Unidad de Medida_Name]
				HAVING COUNT(1)>1
			) tmp ON pp.[Número de Recurso]=tmp.[Número de Recurso] 
AND CONV.[De Unidad de Medida_Name]=tmp.[De Unidad de Medida_Name] 
AND conv.[A Unidad de Medida_Name]=tmp.[A Unidad de Medida_Name]
ORDER BY CONV.[Codigo de Producto_Code]





select top 10 * from [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_Productos_Converciones]
select  * from [HSVDMDDBPPSQL].[MDMHERDEZ].Stg.Productos_Converciones_1_Leaf



/*
SELECT M.[ID] as ID_Modelo
      ,M.[Name] as Nombre_Model
      ,E.[Name] AS Entidad
      ,'[stg].['+E.[StagingBase]+'_Leaf]' AS Stage
      ,'[HSVDMDDBPPSQL].[MDMHERDEZ].Stg.'+E.[StagingBase]+'_Leaf' as Staging
	  ,'[MDMHERDEZ].[mdm].'+V.Name AS Vista_Personalisada
	  ,'SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].'+V.Name AS Vista_Personalisada_SQL
	  , '[mdm].[viw_SYSTEM_'+RTRIM(CONVERT(NCHAR,M.[ID]))+'_'+RTRIM(CONVERT(NCHAR,E.[ID]))+'_CHILDATTRIBUTES]' AS VISTA_system
	  , 'SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[viw_SYSTEM_'+RTRIM(CONVERT(NCHAR,M.[ID]))+'_'+RTRIM(CONVERT(NCHAR,E.[ID]))+'_CHILDATTRIBUTES]' AS Vw_SQL
  FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[tblEntity] AS E
  inner join [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[tblModel] AS M  ON E.[Model_ID] = M.[ID]
  LEFT join  [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[tblSubscriptionView] V ON V.[Model_ID] = E.[Model_ID] AND V.[Entity_ID] = E.[ID] 
 WHERE M.[Name] ='MDM Grupo Hérdez'
 ORDER BY 3
 */
