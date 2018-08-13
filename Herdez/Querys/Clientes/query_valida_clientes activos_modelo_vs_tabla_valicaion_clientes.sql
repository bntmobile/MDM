SELECT  
CASE   WHEN C.[C�digo de Status_Code]=16 then 'ACTIVO > 16'
WHEN C.[C�digo de Status_Code]=17 then 'INACTIVO > 17'
END AS 'MDM_vwMDM_ModeloCliente.[C�digo de Status_Code]'
, CASE WHEN CV.[C�digo de Status_Code_MDM]=0 then 'ACTIVO > 0'
ELSE   'INACTIVO'
END  'VALIDACION_CLIENTES_CAMPOXCAMPO_V2.[C�digo de Status_Code_MDM]'
, count(C.[C�digo de Cliente]) CONTEO
FROM            
HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ModeloCliente AS C WITH (NOLOCK) 
INNER JOIN
HSVDMDDB01.MDMHERDEZCI.DBO.VALIDACION_CLIENTES_CAMPOXCAMPO_V2 AS CV WITH (NOLOCK) ON CV.IDClave_MDM = C.[C�digo de Cliente]
WHERE        (1 = 1) 
AND (CV.[C�digo de Status_Code_MDM]=0  AND CV.IDClave_400 IS NOT NULL)
GROUP BY C.[C�digo de Status_Code], CV.[C�digo de Status_Code_MDM]