
SELECT  CV.* 
FROM   HSVDMDDB01.MDMHERDEZCI.DBO.VALIDACION_CLIENTES_CAMPOXCAMPO_V2  CV WITH(NOLOCK)
INNER JOIN       HSVDMDDBPPSQL.[MDMHERDEZ].[mdm].[vwMDM_ModeloCliente] C WITH(NOLOCK) ON C.[C�digo de Cliente] = CV.IDCLAVE_MDM
WHERE  C.[C�digo de Status_Code] = 17




SELECT  top 10 CV.* 
FROM   HSVDMDDB01.MDMHERDEZCI.DBO.VALIDACION_CLIENTES_CAMPOXCAMPO_V2  CV WITH(NOLOCK)
INNER JOIN       HSVDMDDBPPSQL.[MDMHERDEZ].[mdm].[vwMDM_ModeloCliente] C WITH(NOLOCK) ON C.[C�digo de Cliente] = CV.IDCLAVE_MDM
WHERE  C.[C�digo de Status_Code] = 17


