SELECT 
  AS400.CIA ID_CIA
, AS400.DescCompania DescCompania_AS400 
,MDM.CODE MDM_CODE
, MDM.DescCompania   DescCompania_MDM
, MVC.DescCompania   DescCompania_MVC
FROM (SELECT CIA ,NCIA DescCompania FROM OPENQUERY(HDZ54,'SELECT * FROM HDZGR2.HF01 WITH UR')) AS400
LEFT JOIN (SELECT CODE, [Código de Compañia Numérica] CIA, [Nombre de Compañia Numérica] DescCompania FROM  HSVDMDDBPPSQL.[MDMHERDEZ].[mdm].[vwMDM_CompaniaNumerica] WITH(NOLOCK)) MDM ON AS400.CIA=MDM.CIA
LEFT JOIN (SELECT Codigo CIA, Nombre DescCompania   FROM  HSVDMDDBPPSQL.[MVCRecursos].dbo.[CompaniasNumerica] WITH(NOLOCK)) MVC ON AS400.CIA=MVC.CIA
WHERE 1=1
AND (AS400.DescCompania<>MDM.DescCompania)
OR  (AS400.DescCompania<>MVC.DescCompania)

