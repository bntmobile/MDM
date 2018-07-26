SELECT M.[ID] as ID_Modelo
      ,M.[Name] as Nombre_Model
--      ,E.[ID]
--      ,E.[MUID]
--      ,E.[Model_ID]
      ,E.[Name] AS Entidad
--      ,E.[EntityTable]
--      ,E.[SecurityTable]
--      ,E.[HierarchyTable]
--      ,E.[HierarchyParentTable]
--      ,E.[CollectionTable]
--      ,E.[CollectionMemberTable]
--      ,E.[IsBase]
--      ,E.[IsFlat]
--      ,E.[IsSystem]
--      ,E.[EnterDTM]
--      ,E.[EnterUserID]
--      ,E.[EnterVersionID]
--      ,E.[LastChgDTM]
--      ,E.[LastChgUserID]
--      ,E.[LastChgVersionID]
--      ,E.[LastChgTS]
      ,'[stg].['+E.[StagingBase]+'_Leaf]' AS Stage
      ,'[HSVDMDDBPPSQL].[MDMHERDEZ].Stg.'+E.[StagingBase]+'_Leaf' as Staging
	  ,'[MDMHERDEZ].[mdm].'+V.Name AS Vista_Personalisada
	  ,'SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].'+V.Name AS Vista_Personalisada_SQL
	  , '[mdm].[viw_SYSTEM_'+RTRIM(CONVERT(NCHAR,M.[ID]))+'_'+RTRIM(CONVERT(NCHAR,E.[ID]))+'_CHILDATTRIBUTES]' AS VISTA_system
	  , 'SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[viw_SYSTEM_'+RTRIM(CONVERT(NCHAR,M.[ID]))+'_'+RTRIM(CONVERT(NCHAR,E.[ID]))+'_CHILDATTRIBUTES]' AS Vw_SQL
--       , 'SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[viw_SYSTEM_'+RTRIM(CONVERT(NCHAR,M.[ID]))+'_'+RTRIM(CONVERT(NCHAR,E.[ID]))+'_CHILDATTRIBUTES]'+'  -- '+E.[Name] AS SQL
-- , 'SELECT * FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].'+RTRIM(V.Name) AS SQL
  FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[tblEntity] AS E
  inner join [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[tblModel] AS M  ON E.[Model_ID] = M.[ID]
  LEFT join  [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[tblSubscriptionView] V ON V.[Model_ID] = E.[Model_ID] AND V.[Entity_ID] = E.[ID] 
    
  WHERE M.[Name] ='MDM Grupo Hérdez'
--  WHERE M.[Name] ='MDM Proveedores'
 ORDER BY 3