SELECT 
    CV.IDClave_MDM
,   CV.[Registro Federal de Contribuyentes_400]
,	CV.[Registro Federal de Contribuyentes_MDM]
,	CV.[Validacion_Registro Federal de Contribuyentes] 
FROM            
HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ModeloCliente AS C				WITH (NOLOCK)											INNER JOIN
HSVDMDDB01.MDMHERDEZCI.DBO.VALIDACION_CLIENTES_CAMPOXCAMPO_V2 AS CV WITH (NOLOCK) ON CV.IDClave_MDM = C.[Código de Cliente] INNER JOIN 
HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_ModeloClienteVentas] AS CVtas	WITH (NOLOCK) ON C.code= CVtas.[Clave de  Cliente_Code]
WHERE (1 = 1) 
AND (C.[Código de Status_Code] = 16) 
AND (CV.IDClave_400 IS NOT NULL)
--AND CVtas.[Tipo Sucursal_Name]='S Propia'
-- AND IDClave_MDM='0770534'
AND IDClave_MDM='0770581'
-- AND CV.[Validacion_Registro Federal de Contribuyentes]=1

select distinct [Tipo Sucursal_Name] from HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_ModeloClienteVentas] AS CVtas
select distinct [Cliente Venta Mostrador] from HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_ModeloClienteVentas] AS CVtas


SELECT  
  C.[Código de Cliente]
, CVtas.[Tipo Sucursal_Name]
, CVtas.[Cliente Venta Mostrador]
FROM            
HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ModeloCliente AS C				WITH (NOLOCK)											INNER JOIN
HSVDMDDB01.MDMHERDEZCI.DBO.VALIDACION_CLIENTES_CAMPOXCAMPO_V2 AS CV WITH (NOLOCK) ON CV.IDClave_MDM = C.[Código de Cliente] INNER JOIN 
HSVDMDDBPPSQL.MDMHERDEZ.[mdm].[vwMDM_ModeloClienteVentas] AS CVtas	WITH (NOLOCK) ON C.code= CVtas.[Clave de  Cliente_Code]
where 1=1
--AND CVtas.[Tipo Sucursal_Name] in ('F Franquicia','N Franquicia No Operativa') 
--AND CVtas.[Cliente Venta Mostrador]=1
AND CVtas.[Tipo Sucursal_Name] in ('S Propia') 
AND CVtas.[Cliente Venta Mostrador]=0
group by 
  CVtas.[Cliente Venta Mostrador]
, C.[Código de Cliente]
, CVtas.[Tipo Sucursal_Name]



select * from HSVDMDDB01.MDMHERDEZCI.DBO.UltimasVENTAS400