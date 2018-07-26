select 
 [BUILDING BLOCK_Code]
,[BUILDING BLOCK_Name]
,[BUILDING BLOCK_ID]
, [Recurso Base_Code]
, [Recurso Base_Name]
, [Recurso Base_ID]
, [Nueva Iniciativa]
, [Nueva Iniciativa Inicio]	
, [Nueva Iniciativa Fin]
FROM HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PlandeDemanda 


select 
    [Producto]
,	[Building block]
,	[Producto Base]
,	[Innovación]
 from  HSVDMDDBPPSQL.MDMHERDEZ.mdm. vwMDM_ProductosDemantra

