-- sin distinct 63186
-- con distinct  y sin campo identity 62879
-- diferencia select 63186- 62879= 307
--  SE QUITO IDENTITY, Y Diferencias se quitaron 3 campos relacionados con  Pagadora_400
-- duplicidad en campo [Cuenta Pagadora_400]C�digo de Pa�s_Code_F_MDM, [Cuenta Pagadora_400] , Direccion Entrega_C20LU1_C20LU2, banco_400, Tipos de Movimiento_400




drop table #ValidacionClientes
SELECT        CV.MDMCOde_Cliente, CV.[Codigo de Actualizacion_MDM], CV.IDClave_400, CV.IDClave_MDM, CV.Validacion_IDClave, CV.[C�digo de Estado Cliente Llave A_Code_400], CV.[C�digo de Estado Cliente Llave A_Code_MDM], 
                         CV.[Validacion_C�digo de Estado Cliente Llave A_Code], CV.[C�digo de Ciudad Llave A_Code_400], CV.[C�digo de Ciudad Llave A_Code_MDM], CV.[Validacion_C�digo de Ciudad Llave A_Code], 
                         CV.[C�digo de Cuenta Llave A_400], CV.[C�digo de Cuenta Llave A_MDM], CV.[Validacion_C�digo de Cuenta Llave A_MDM], CV.Nombre_400, CV.Nombre_MDM, CV.Validacion_Nombre, CV.RazonSocial_400, CV.RazonSocial, 
                         CV.Validacion_RazonSocial, CV.[Fecha Alta AS400_400], CV.[Fecha Alta AS400_MDM], CV.[Validacion_Fecha Alta AS400], CV.[Registro Federal de Contribuyentes_400], CV.[Registro Federal de Contribuyentes_MDM], 
                         CV.[Validacion_Registro Federal de Contribuyentes], CV.[C�digo de Cadena_Code_400_C10CAD], CV.[C�digo de Cadena_Code_400_VCAD25], CV.[C�digo de Cadena_Code_MDM], CV.[Validacion_C�digo de Cadena_Code], 
                         CV.[Descuento Vol Compra_400], CV.[Descuento Vol Compra_MDM], CV.[Validacion_Descuento Vol Compra], CV.[C�digo de Tipo de Negocio de Cliente_Code_400], CV.[C�digo de Tipo de Negocio de Cliente_Code_MDM], 
                         CV.[Validacion_[C�digo de Tipo de Negocio de Cliente_Code], CV.[C�digo de Territorio_Code_400], CV.[C�digo de Territorio_Code_MDM], CV.[Validacion_C�digo de Territorio_Code_MDM], CV.[C�digo de Bodega_Code_400], 
                         CV.[C�digo de Bodega_Code_MDM], CV.[Validacion_[C�digo de Bodega_Code], CV.[C�digo de Ruta_Code_400], CV.[C�digo de Ruta_Code_MDM], CV.[Validacion_C�digo de Ruta_Code], CV.[V�a de Embarque_400], 
                         CV.[V�a de Embarque_MDM], CV.[Validacion_V�a de Embarque], CV.[L�mite de Cr�dito_400], CV.[L�mite de Cr�dito_MDM], CV.[Validacion_L�mite de Cr�dito], CV.[C�digo de Clasificaci�n de Cliente_Code_400], 
                         CV.[C�digo de Clasificaci�n de Cliente_Code_MDM], CV.[Validacion_C�digo de Clasificaci�n de Cliente_Code], CV.Telefono_400, CV.Telefono_MDM, CV.Validacion_Telefono, CV.[Fecha de Cheque Devuelto_400], 
                         CV.[Fecha de Cheque Devuelto_MDM], CV.[Validacion_Fecha de Cheque Devuelto], CV.[C�digo de Autorizador L�mite de Cr�dito_Code_400], CV.[C�digo de Autorizador L�mite de Cr�dito_Code_MDM], 
                         CV.[Validacion_C�digo de Autorizador L�mite de Cr�dito_Code], CV.[C�digo de Tipo de Cliente_Code_400], CV.[C�digo de Tipo de Cliente_Code_MDM], CV.[Validacion_C�digo de Tipo de Cliente_Code], 
                         CV.[C�digo de Plazo de Pago_Code_400], CV.[C�digo de Plazo de Pago_Code_MDM], CV.[Validacion_C�digo de Plazo de Pago_Code], CV.[C�digo de Plazo_Code_400], CV.[C�digo de Plazo_Code_MDM], 
                         CV.[Validacion_C�digo de Plazo_Code], CV.[C�digo de Gerente_Code_400], CV.[C�digo de Gerente_Code_MDM], CV.[Validacion_C�digo de Gerente_Code], CV.[C�digo de Supervisor_Code_400], 
                         CV.[C�digo de Supervisor_Code_MDM], CV.[Validacion_C�digo de Supervisor_Code], CV.CURP_400, CV.CURP_MDM, CV.Validacion_CURP, CV.[Grupo de Clientes_400], CV.[Grupo de Clientes_MDM], 
                         CV.[Validacion_Grupo de Clientes], CV.[C�digo de Pa�s_E_400_PAISEMBARCAR], CV.[C�digo de Pa�s_E_400_FLPAIS], CV.[Nombre de Pa�s_Code_E_MDM], CV.[Validacion_C�digo de Pa�s_Code], CV.[Pase Directo Manual_400], 
                         CV.[Pase Directo Manual_MDM], CV.[Validacion_Pase Directo Manual], CV.[C�digo de Status_Code_400], CV.[C�digo de Status_Code_MDM], CV.[Validacion_C�digo de Status_Code], CV.[C�digo de Cliente_Code_400], 
                         CV.[C�digo de Cliente_Code_MDM], CV.[Validacion_C�digo de Cliente_Code], CV.Sucursal_400, CV.Sucursal_MDM, CV.Validacion_Sucursal, CV.Nombre_Sucursal_400, CV.Nombre_Sucursal_MDM, 
                         CV.Validacion_Nombre_Sucursal, CV.[Cliente Factura A], CV.[Direcci�n �nica], CV.Code_Direccion_Entrega, CV.Code_Direccion_Facturar, CV.[GLN Facturar A_400], CV.[GLN Facturar A_MDM], CV.[Validacion_GLN Facturar A], 
                         CV.[GLN Embarcar A_400], CV.[GLN EMBARCAR A_MDM], CV.[Validacion_GLN Embarcar A], CV.Calle_E_400_FLCALL, CV.Calle_E_400_CALLEEMBARCAR, CV.Calle_E_MDM, CV.Validacion_Calle_E, 
                         CV.[Numero Exterior_E_400_NUMEROEXTEMBARCAR], CV.[Numero Exterior_E_400_FLNUEX], CV.[Numero Exterior_E_MDM], CV.[Validacion_Numero Exterior_E], CV.[Numero Interior_E_400_NUMEROINTEMBARCAR], 
                         CV.[Numero Interior_E_400_FLNUIN], CV.[Numero Interior_E_MDM], CV.[Validacion_Numero Interior_E], CV.[C�digo de Colonia_E_400_COLONIAEMBARCAR], CV.[C�digo de Colonia_E_400_FLCOLO], 
                         CV.[C�digo de Colonia_E_MDM], CV.[Validacion_C�digo de Colonia_E], CV.[C�digo de Municipio_E_400_MUNICIPIOEMBARCAR], CV.[C�digo de Municipio_E_400_FLMUNI], CV.[C�digo de Municipio_E_MDM], 
                         CV.[Validacion_C�digo de Municipio_E], CV.[C�digo de Estado CP_E_400_ESTADOEMBARCAR], CV.[C�digo de Estado CP_E_400_FLDEST], CV.[C�digo de Estado CP_E_MDM], CV.[Validacion_C�digo de Estado CP_E], 
                         CV.[C�digo de Pa�s_F_400_C10EXT], CV.[C�digo de Pa�s_F_400_PAISFACTURAR], CV.[C�digo de Pa�s_F_400_FLPAIF], CV.[Nombre de Pa�s_Code_F_MDM], CV.[C�digo de Pa�s_Code_F_MDM], 
                         CV.[Validacion_C�digo de Pa�s_F_Code], CV.[C�digo de C�digo Postal_E_400_CODIGOPOSTALEMBARCAR], CV.[C�digo de C�digo Postal_E_400_FLCOPO], CV.[C�digo de C�digo Postal_E_MDM], 
                         CV.[Validacion_C�digo de C�digo Postal_E], CV.Calle_F_400_CALLEFACTURAR, CV.Calle_F_400_FLCALF, CV.Calle_F_MDM, CV.Validacion_Calle_F, CV.[Numero Exterior_F_400_NUMEROEXTFACTURAR], 
                         CV.[Numero Exterior_F_400_FLNUEF], CV.[Numero Exterior_F_MDM], CV.[Validacion_Numero Exterior_F], CV.[Numero Interior_F_400_NUMEROINTFACTURAR], CV.[Numero Interior_F_400_FLNUIN], CV.[Numero Interior_F_MDM], 
                         CV.[Validacion_Numero Interior_F], CV.[C�digo de C�digo Postal_F_400_FLCOPF], CV.[C�digo de C�digo Postal_F_400_CODIGOPOSTALFACTURAR], CV.[C�digo de C�digo Postal_F_400_C10COD], 
                         CV.[C�digo de C�digo Postal_F_MDM], CV.[Validacion_C�digo de C�digo Postal_F], CV.[C�digo de Colonia_F_400_C10COL], CV.[C�digo de Colonia_F_400_COLNIAFACTURAR], CV.[C�digo de Colonia_F_400_FLCOLF], 
                         CV.[C�digo de Colonia_F_MDM], CV.[Validacion_C�digo de Colonia_F], CV.[C�digo de Municipio_F_400_C10POB], CV.[C�digo de Municipio_F_400_MUNICIPIOFACTURAR], CV.[C�digo de Municipio_F_400_FLMUNF], 
                         CV.[C�digo de Municipio_F_MDM], CV.[Validacion_C�digo de Municipio_F], CV.[C�digo de Estado CP_F_400_FLEDOF], CV.[C�digo de Estado CP_F_400_ESTADOFACTURAR], CV.[C�digo de Estado CP_F_MDM], 
                         CV.[Validacion_C�digo de Estado CP_F_400], CV.Latitud_400, CV.Latitud_MDM, CV.Validacion_latitud, CV.Longitud_400, CV.Longitud_MDM, CV.Validacion_Longitud, CV.[Grupo de Precio_400], CV.[Grupo de Precio_MDM], 
                         CV.[Validacion_Grupo de Precio], CV.[Cuenta Concentradora_400], CV.[Cuenta Concentradora_MDM], CV.[Validacion_Cuenta Concentradora], CV.[Acuse de Recibo_400], CV.[Acuse de Recibo_MDM], 
                         CV.[Validacion_Acuse de Recibo], CV.[Factura Remisi�n_400], CV.[Factura Remisi�n_MDM], CV.[Validacion_Factura Remisi�n], CV.[D�a de Facturaci�n_400], CV.[D�a de Facturaci�n_MDM], CV.[Validacion_D�a de Facturaci�n], 
                         CV.[Cuenta Pagadora_400], CV.[Cuenta Pagadora_MDM], CV.[ValidacioN_Cuenta Pagadora], CV.[Nombre Comercial Cliente_400], CV.[Nombre Comercial Cliente_MDM], CV.[ValidacioN_Nombre Comercial Cliente], 
                         CV.[Compa��a Comercializadora_400], CV.[Compa�ia Comercializadora_MDM], CV.[ValidacioN_Compa�ia Comercializadora], CV.[C�digo de Compa�ia Principal_Code_400], CV.[C�digo de Compa�ia Principal_Code_MDM], 
                         CV.[ValidacioN_Compa�ia principal], CV.[Pase Directo Autom�tico_400], CV.[Pase Directo Autom�tico_MDM], CV.[ValidacioN_Pase Directo Automatico], CV.Analista_400, CV.Analista_MDM, CV.Validacion_Analista, 
                         CV.[Tipos de Movimiento_400], CV.[Tipos de Movimiento_MDM], CV.[Validacion_Tipos de Movimiento], CV.banco_400, CV.banco_MDM, CV.Validacion_Banco, CV.plaza_400, CV.Plaza_MDM, CV.Validacion_Plaza, 
                         CV.[Segmento Logisitca_400], CV.[Segmento Logisitca_MDM], CV.[Validacion Segmento Logisitca], CV.[Tipo Sucursal_400], CV.[Tipo Sucursal_MDM], CV.[Validacion_Tipo Sucursal], CV.Tienda_400, CV.Tienda_MDM, 
                         CV.Validacion_Tienda, CV.[Inventario en Tienda_400], CV.[Inventario en Tienda_MDM], CV.[Validacion_Inventario en Tienda], CV.Direccion_Entrega_MDM_CONCAT, CV.[Direccion Entrega_C20LU1_C20LU2], 
                         CV.Validacion_Direccion_Entrega_CONCAT, CV.Direccion_Facturar_MDM_CONCAT, CV.[Direccion Facturar_C1ODIR], CV.Validacion_Direccion_Facturacion_CONCAT, CV.[Frecuencia Facturacion_400], 
                         CV.[Frecuencia Facturacion_MDM], CV.[Validacion_Frecuencia Facturacion]
INTO              [#ValidacionClientes]
FROM            HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ModeloCliente AS C WITH (NOLOCK) INNER JOIN
                         MDMHERDEZCI.DBO.VALIDACION_CLIENTES_CAMPOXCAMPO_V2 AS CV WITH (NOLOCK) ON CV.IDClave_MDM = C.[C�digo de Cliente]
WHERE        (1 = 1) AND (C.[C�digo de Status_Code] = 16) AND (CV.IDClave_400 IS NOT NULL)

select count(CV.IDClave_400)
FROM            HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ModeloCliente AS C WITH (NOLOCK) INNER JOIN
                         MDMHERDEZCI.DBO.VALIDACION_CLIENTES_CAMPOXCAMPO_V2 AS CV WITH (NOLOCK) ON CV.IDClave_MDM = C.[C�digo de Cliente]
WHERE        (1 = 1) AND (C.[C�digo de Status_Code] = 16) AND (CV.IDClave_400 IS NOT NULL)

-- 62826

select count(CV.IDClave_400)
FROM            HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ModeloCliente AS C WITH (NOLOCK) INNER JOIN
                         MDMHERDEZCI.DBO.VALIDACION_CLIENTES_CAMPOXCAMPO_V2 AS CV WITH (NOLOCK) ON CV.IDClave_MDM = C.[C�digo de Cliente]
WHERE        (1 = 1) AND (CV.[C�digo de Status_Code_MDM]=0) AND (CV.IDClave_400 IS NOT NULL)
-- 62855

select IDClave_MDM, count(1) 
from #ValidacionClientes
group by IDClave_MDM
having count(1)>1


--1797
-- 1653 comparacion entre 2 campos [C�digo de Cadena_Code_400_C10CAD]=[C�digo de Cadena_Code_MDM]
select  count(1)
from  #ValidacionClientes 
where [Validacion_C�digo de Cadena_Code]=1
and [C�digo de Cadena_Code_400_C10CAD]=[C�digo de Cadena_Code_MDM]

--  144
select IDClave_MDM, [C�digo de Cadena_Code_400_C10CAD],[C�digo de Cadena_Code_MDM]
from  #ValidacionClientes 
where [Validacion_C�digo de Cadena_Code]=1
and [C�digo de Cadena_Code_400_C10CAD]<>[C�digo de Cadena_Code_MDM]
ORDER BY [C�digo de Cadena_Code_400_C10CAD]

select 
 C.[C�digo de Cliente]
,[C�digo de Cadena_Code]	
,[C�digo de Cadena_Name]	
,[C�digo de Cadena_ID]
from  HSVDMDDBPPSQL.[MDMHERDEZ].[mdm].[vwMDM_ModeloCliente] C WITH(NOLOCK)
inner join HSVDMDDBPPSQL.[MDMHERDEZ].[mdm].[vwMDM_ModeloClienteCr�ditoyCobranza] CC WITH(NOLOCK)
ON C.code =CC.[Clave de  Cliente_Code]
WHERE C.[C�digo de Cliente]='0286235'


select distinct [C�digo de Cadena_Name] 
from HSVDMDDBPPSQL.[MDMHERDEZ].[mdm].[vwMDM_ModeloClienteCr�ditoyCobranza] CC WITH(NOLOCK)
where [C�digo de Cadena_Name] like '*%'


SELECT DISTINCT [C�digo de Compa�ia Principal_Code_MDM]
from  #ValidacionClientes 




select IDClave_400, COUNT(1)
from HSVDMDDB01.MDMHERDEZCI.DBO.VALIDACION_CLIENTES_CAMPOXCAMPO_V2 AS CV WITH (NOLOCK)
where IDClave_400 is not null
group by IDClave_400
having count(1)>1

