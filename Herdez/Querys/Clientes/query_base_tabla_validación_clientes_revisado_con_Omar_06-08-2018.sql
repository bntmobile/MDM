-- sin distinct 63186
-- con distinct  y sin campo identity 62879
-- diferencia select 63186- 62879= 307
--  SE QUITO IDENTITY, Y Diferencias se quitaron 3 campos relacionados con  Pagadora_400
-- duplicidad en campo [Cuenta Pagadora_400]Código de País_Code_F_MDM, [Cuenta Pagadora_400] , Direccion Entrega_C20LU1_C20LU2, banco_400, Tipos de Movimiento_400




drop table #ValidacionClientes
SELECT        CV.MDMCOde_Cliente, CV.[Codigo de Actualizacion_MDM], CV.IDClave_400, CV.IDClave_MDM, CV.Validacion_IDClave, CV.[Código de Estado Cliente Llave A_Code_400], CV.[Código de Estado Cliente Llave A_Code_MDM], 
                         CV.[Validacion_Código de Estado Cliente Llave A_Code], CV.[Código de Ciudad Llave A_Code_400], CV.[Código de Ciudad Llave A_Code_MDM], CV.[Validacion_Código de Ciudad Llave A_Code], 
                         CV.[Código de Cuenta Llave A_400], CV.[Código de Cuenta Llave A_MDM], CV.[Validacion_Código de Cuenta Llave A_MDM], CV.Nombre_400, CV.Nombre_MDM, CV.Validacion_Nombre, CV.RazonSocial_400, CV.RazonSocial, 
                         CV.Validacion_RazonSocial, CV.[Fecha Alta AS400_400], CV.[Fecha Alta AS400_MDM], CV.[Validacion_Fecha Alta AS400], CV.[Registro Federal de Contribuyentes_400], CV.[Registro Federal de Contribuyentes_MDM], 
                         CV.[Validacion_Registro Federal de Contribuyentes], CV.[Código de Cadena_Code_400_C10CAD], CV.[Código de Cadena_Code_400_VCAD25], CV.[Código de Cadena_Code_MDM], CV.[Validacion_Código de Cadena_Code], 
                         CV.[Descuento Vol Compra_400], CV.[Descuento Vol Compra_MDM], CV.[Validacion_Descuento Vol Compra], CV.[Código de Tipo de Negocio de Cliente_Code_400], CV.[Código de Tipo de Negocio de Cliente_Code_MDM], 
                         CV.[Validacion_[Código de Tipo de Negocio de Cliente_Code], CV.[Código de Territorio_Code_400], CV.[Código de Territorio_Code_MDM], CV.[Validacion_Código de Territorio_Code_MDM], CV.[Código de Bodega_Code_400], 
                         CV.[Código de Bodega_Code_MDM], CV.[Validacion_[Código de Bodega_Code], CV.[Código de Ruta_Code_400], CV.[Código de Ruta_Code_MDM], CV.[Validacion_Código de Ruta_Code], CV.[Vía de Embarque_400], 
                         CV.[Vía de Embarque_MDM], CV.[Validacion_Vía de Embarque], CV.[Límite de Crédito_400], CV.[Límite de Crédito_MDM], CV.[Validacion_Límite de Crédito], CV.[Código de Clasificación de Cliente_Code_400], 
                         CV.[Código de Clasificación de Cliente_Code_MDM], CV.[Validacion_Código de Clasificación de Cliente_Code], CV.Telefono_400, CV.Telefono_MDM, CV.Validacion_Telefono, CV.[Fecha de Cheque Devuelto_400], 
                         CV.[Fecha de Cheque Devuelto_MDM], CV.[Validacion_Fecha de Cheque Devuelto], CV.[Código de Autorizador Límite de Crédito_Code_400], CV.[Código de Autorizador Límite de Crédito_Code_MDM], 
                         CV.[Validacion_Código de Autorizador Límite de Crédito_Code], CV.[Código de Tipo de Cliente_Code_400], CV.[Código de Tipo de Cliente_Code_MDM], CV.[Validacion_Código de Tipo de Cliente_Code], 
                         CV.[Código de Plazo de Pago_Code_400], CV.[Código de Plazo de Pago_Code_MDM], CV.[Validacion_Código de Plazo de Pago_Code], CV.[Código de Plazo_Code_400], CV.[Código de Plazo_Code_MDM], 
                         CV.[Validacion_Código de Plazo_Code], CV.[Código de Gerente_Code_400], CV.[Código de Gerente_Code_MDM], CV.[Validacion_Código de Gerente_Code], CV.[Código de Supervisor_Code_400], 
                         CV.[Código de Supervisor_Code_MDM], CV.[Validacion_Código de Supervisor_Code], CV.CURP_400, CV.CURP_MDM, CV.Validacion_CURP, CV.[Grupo de Clientes_400], CV.[Grupo de Clientes_MDM], 
                         CV.[Validacion_Grupo de Clientes], CV.[Código de País_E_400_PAISEMBARCAR], CV.[Código de País_E_400_FLPAIS], CV.[Nombre de País_Code_E_MDM], CV.[Validacion_Código de País_Code], CV.[Pase Directo Manual_400], 
                         CV.[Pase Directo Manual_MDM], CV.[Validacion_Pase Directo Manual], CV.[Código de Status_Code_400], CV.[Código de Status_Code_MDM], CV.[Validacion_Código de Status_Code], CV.[Código de Cliente_Code_400], 
                         CV.[Código de Cliente_Code_MDM], CV.[Validacion_Código de Cliente_Code], CV.Sucursal_400, CV.Sucursal_MDM, CV.Validacion_Sucursal, CV.Nombre_Sucursal_400, CV.Nombre_Sucursal_MDM, 
                         CV.Validacion_Nombre_Sucursal, CV.[Cliente Factura A], CV.[Dirección única], CV.Code_Direccion_Entrega, CV.Code_Direccion_Facturar, CV.[GLN Facturar A_400], CV.[GLN Facturar A_MDM], CV.[Validacion_GLN Facturar A], 
                         CV.[GLN Embarcar A_400], CV.[GLN EMBARCAR A_MDM], CV.[Validacion_GLN Embarcar A], CV.Calle_E_400_FLCALL, CV.Calle_E_400_CALLEEMBARCAR, CV.Calle_E_MDM, CV.Validacion_Calle_E, 
                         CV.[Numero Exterior_E_400_NUMEROEXTEMBARCAR], CV.[Numero Exterior_E_400_FLNUEX], CV.[Numero Exterior_E_MDM], CV.[Validacion_Numero Exterior_E], CV.[Numero Interior_E_400_NUMEROINTEMBARCAR], 
                         CV.[Numero Interior_E_400_FLNUIN], CV.[Numero Interior_E_MDM], CV.[Validacion_Numero Interior_E], CV.[Código de Colonia_E_400_COLONIAEMBARCAR], CV.[Código de Colonia_E_400_FLCOLO], 
                         CV.[Código de Colonia_E_MDM], CV.[Validacion_Código de Colonia_E], CV.[Código de Municipio_E_400_MUNICIPIOEMBARCAR], CV.[Código de Municipio_E_400_FLMUNI], CV.[Código de Municipio_E_MDM], 
                         CV.[Validacion_Código de Municipio_E], CV.[Código de Estado CP_E_400_ESTADOEMBARCAR], CV.[Código de Estado CP_E_400_FLDEST], CV.[Código de Estado CP_E_MDM], CV.[Validacion_Código de Estado CP_E], 
                         CV.[Código de País_F_400_C10EXT], CV.[Código de País_F_400_PAISFACTURAR], CV.[Código de País_F_400_FLPAIF], CV.[Nombre de País_Code_F_MDM], CV.[Código de País_Code_F_MDM], 
                         CV.[Validacion_Código de País_F_Code], CV.[Código de Código Postal_E_400_CODIGOPOSTALEMBARCAR], CV.[Código de Código Postal_E_400_FLCOPO], CV.[Código de Código Postal_E_MDM], 
                         CV.[Validacion_Código de Código Postal_E], CV.Calle_F_400_CALLEFACTURAR, CV.Calle_F_400_FLCALF, CV.Calle_F_MDM, CV.Validacion_Calle_F, CV.[Numero Exterior_F_400_NUMEROEXTFACTURAR], 
                         CV.[Numero Exterior_F_400_FLNUEF], CV.[Numero Exterior_F_MDM], CV.[Validacion_Numero Exterior_F], CV.[Numero Interior_F_400_NUMEROINTFACTURAR], CV.[Numero Interior_F_400_FLNUIN], CV.[Numero Interior_F_MDM], 
                         CV.[Validacion_Numero Interior_F], CV.[Código de Código Postal_F_400_FLCOPF], CV.[Código de Código Postal_F_400_CODIGOPOSTALFACTURAR], CV.[Código de Código Postal_F_400_C10COD], 
                         CV.[Código de Código Postal_F_MDM], CV.[Validacion_Código de Código Postal_F], CV.[Código de Colonia_F_400_C10COL], CV.[Código de Colonia_F_400_COLNIAFACTURAR], CV.[Código de Colonia_F_400_FLCOLF], 
                         CV.[Código de Colonia_F_MDM], CV.[Validacion_Código de Colonia_F], CV.[Código de Municipio_F_400_C10POB], CV.[Código de Municipio_F_400_MUNICIPIOFACTURAR], CV.[Código de Municipio_F_400_FLMUNF], 
                         CV.[Código de Municipio_F_MDM], CV.[Validacion_Código de Municipio_F], CV.[Código de Estado CP_F_400_FLEDOF], CV.[Código de Estado CP_F_400_ESTADOFACTURAR], CV.[Código de Estado CP_F_MDM], 
                         CV.[Validacion_Código de Estado CP_F_400], CV.Latitud_400, CV.Latitud_MDM, CV.Validacion_latitud, CV.Longitud_400, CV.Longitud_MDM, CV.Validacion_Longitud, CV.[Grupo de Precio_400], CV.[Grupo de Precio_MDM], 
                         CV.[Validacion_Grupo de Precio], CV.[Cuenta Concentradora_400], CV.[Cuenta Concentradora_MDM], CV.[Validacion_Cuenta Concentradora], CV.[Acuse de Recibo_400], CV.[Acuse de Recibo_MDM], 
                         CV.[Validacion_Acuse de Recibo], CV.[Factura Remisión_400], CV.[Factura Remisión_MDM], CV.[Validacion_Factura Remisión], CV.[Día de Facturación_400], CV.[Día de Facturación_MDM], CV.[Validacion_Día de Facturación], 
                         CV.[Cuenta Pagadora_400], CV.[Cuenta Pagadora_MDM], CV.[ValidacioN_Cuenta Pagadora], CV.[Nombre Comercial Cliente_400], CV.[Nombre Comercial Cliente_MDM], CV.[ValidacioN_Nombre Comercial Cliente], 
                         CV.[Compañía Comercializadora_400], CV.[Compañia Comercializadora_MDM], CV.[ValidacioN_Compañia Comercializadora], CV.[Código de Compañia Principal_Code_400], CV.[Código de Compañia Principal_Code_MDM], 
                         CV.[ValidacioN_Compañia principal], CV.[Pase Directo Automático_400], CV.[Pase Directo Automático_MDM], CV.[ValidacioN_Pase Directo Automatico], CV.Analista_400, CV.Analista_MDM, CV.Validacion_Analista, 
                         CV.[Tipos de Movimiento_400], CV.[Tipos de Movimiento_MDM], CV.[Validacion_Tipos de Movimiento], CV.banco_400, CV.banco_MDM, CV.Validacion_Banco, CV.plaza_400, CV.Plaza_MDM, CV.Validacion_Plaza, 
                         CV.[Segmento Logisitca_400], CV.[Segmento Logisitca_MDM], CV.[Validacion Segmento Logisitca], CV.[Tipo Sucursal_400], CV.[Tipo Sucursal_MDM], CV.[Validacion_Tipo Sucursal], CV.Tienda_400, CV.Tienda_MDM, 
                         CV.Validacion_Tienda, CV.[Inventario en Tienda_400], CV.[Inventario en Tienda_MDM], CV.[Validacion_Inventario en Tienda], CV.Direccion_Entrega_MDM_CONCAT, CV.[Direccion Entrega_C20LU1_C20LU2], 
                         CV.Validacion_Direccion_Entrega_CONCAT, CV.Direccion_Facturar_MDM_CONCAT, CV.[Direccion Facturar_C1ODIR], CV.Validacion_Direccion_Facturacion_CONCAT, CV.[Frecuencia Facturacion_400], 
                         CV.[Frecuencia Facturacion_MDM], CV.[Validacion_Frecuencia Facturacion]
INTO              [#ValidacionClientes]
FROM            HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ModeloCliente AS C WITH (NOLOCK) INNER JOIN
                         MDMHERDEZCI.DBO.VALIDACION_CLIENTES_CAMPOXCAMPO_V2 AS CV WITH (NOLOCK) ON CV.IDClave_MDM = C.[Código de Cliente]
WHERE        (1 = 1) AND (C.[Código de Status_Code] = 16) AND (CV.IDClave_400 IS NOT NULL)

select count(CV.IDClave_400)
FROM            HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ModeloCliente AS C WITH (NOLOCK) INNER JOIN
                         MDMHERDEZCI.DBO.VALIDACION_CLIENTES_CAMPOXCAMPO_V2 AS CV WITH (NOLOCK) ON CV.IDClave_MDM = C.[Código de Cliente]
WHERE        (1 = 1) AND (C.[Código de Status_Code] = 16) AND (CV.IDClave_400 IS NOT NULL)

-- 62826

select count(CV.IDClave_400)
FROM            HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ModeloCliente AS C WITH (NOLOCK) INNER JOIN
                         MDMHERDEZCI.DBO.VALIDACION_CLIENTES_CAMPOXCAMPO_V2 AS CV WITH (NOLOCK) ON CV.IDClave_MDM = C.[Código de Cliente]
WHERE        (1 = 1) AND (CV.[Código de Status_Code_MDM]=0) AND (CV.IDClave_400 IS NOT NULL)
-- 62855

select IDClave_MDM, count(1) 
from #ValidacionClientes
group by IDClave_MDM
having count(1)>1


--1797
-- 1653 comparacion entre 2 campos [Código de Cadena_Code_400_C10CAD]=[Código de Cadena_Code_MDM]
select  count(1)
from  #ValidacionClientes 
where [Validacion_Código de Cadena_Code]=1
and [Código de Cadena_Code_400_C10CAD]=[Código de Cadena_Code_MDM]

--  144
select IDClave_MDM, [Código de Cadena_Code_400_C10CAD],[Código de Cadena_Code_MDM]
from  #ValidacionClientes 
where [Validacion_Código de Cadena_Code]=1
and [Código de Cadena_Code_400_C10CAD]<>[Código de Cadena_Code_MDM]
ORDER BY [Código de Cadena_Code_400_C10CAD]

select 
 C.[Código de Cliente]
,[Código de Cadena_Code]	
,[Código de Cadena_Name]	
,[Código de Cadena_ID]
from  HSVDMDDBPPSQL.[MDMHERDEZ].[mdm].[vwMDM_ModeloCliente] C WITH(NOLOCK)
inner join HSVDMDDBPPSQL.[MDMHERDEZ].[mdm].[vwMDM_ModeloClienteCréditoyCobranza] CC WITH(NOLOCK)
ON C.code =CC.[Clave de  Cliente_Code]
WHERE C.[Código de Cliente]='0286235'


select distinct [Código de Cadena_Name] 
from HSVDMDDBPPSQL.[MDMHERDEZ].[mdm].[vwMDM_ModeloClienteCréditoyCobranza] CC WITH(NOLOCK)
where [Código de Cadena_Name] like '*%'


SELECT DISTINCT [Código de Compañia Principal_Code_MDM]
from  #ValidacionClientes 




select IDClave_400, COUNT(1)
from HSVDMDDB01.MDMHERDEZCI.DBO.VALIDACION_CLIENTES_CAMPOXCAMPO_V2 AS CV WITH (NOLOCK)
where IDClave_400 is not null
group by IDClave_400
having count(1)>1

