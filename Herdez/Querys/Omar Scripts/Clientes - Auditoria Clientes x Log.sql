/*
-- Drop Table #Tmp01
Select Distinct TSC.Code StgClientesCode
Into #Tmp01
From MDMHERDEZ.stg.Clientes_1_2_Leaf TSC
Where BatchTag = 'CambioEstatusCliente2'
And TSC.ID > 99129 And Not TSC.Batch_ID Is Null
And TSC.[Código de Status] = '16'

-- Drop Table #TmpCC01
Select CC.Id, CC.[Código de Cliente], CC.Code
Into #TmpCC01
From MDMHERDEZ.mdm.vwMDM_ModeloCliente CC With(NoLock)
Inner Join MDMHERDEZCI.dbo.[RFC Validados 14_03_2018] RFC With(NoLock) On RFC.RFC = CC.[Registro Federal de Contribuyentes] 
And RFC.RFC_Status In ('RFC No valido', '"RFC No valido"')
*/

-- Drop Table #TmpCC01
Select CC.Id, CC.[Código de Cliente], CC.Code
Into #TmpCC01
From MDMHERDEZ.mdm.vwMDM_ModeloCliente CC With(NoLock)
-- Inner Join ##Tmp01 T1 On T1.ID = CC.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ModeloClienteCréditoyCobranza CyC With(NoLock) On CyC.[Clave de  Cliente_ID] = CC.ID
Inner Join MDMHERDEZ.mdm.vwMDM_CyCCadenas CAD With(NoLock) On CAD.ID = CyC.[Código de Cadena_ID] -- And CAD.[Código de Cadena] = 'N34'
-- Inner Join #Tmp01 T1 With(NoLock) On T1.StgClientesCode = CC.Code
Where CC.[Código de Cliente] In ('8033120') -- 8033119') -- 0208991') -- 0770513') -- 0770510')-- K110001') -- 0252644')
-- Where CC.[Código de Cliente] In ('0201217'	,'0274823'	,'0263574'	,'0160071'	,'0252415'	,'0252338'	,'0252285'	,'0248954'	,'0248952'	,'0215257'	,'0215108'	,'0252243'	,'0252337'	,'0248914'	,'0252290'	,'0252517'	,'0249050'	,'0252447'	,'0252398'	,'0252525'	,'0252295'	,'0215131'	,'0249395'	,'0252379'	,'0252342'	,'0252529'	,'0252384'	,'0252275'	,'0252324'	,'0248726'	,'0252244'	,'0252359'	,'0252312'	,'0252284'	,'0252564'	,'0267553'	,'0268038'	,'0269600'	,'0272700'	,'0273695'	,'0274820'	,'0275703'	,'0278625'	,'0279107'	,'0286100')

-- Select * From MDMHERDEZ.mdm.vwMDM_CyCCadenas 

Create Index idxBBP01 On #TmpCC01 ([Código de Cliente])
Create Clustered Index idxBBP02 On #TmpCC01 (ID)

-- Alter Procedure dbo.Get_BO_Rutero As

Go

Drop Table #TmpEntity00
Drop Table #TmpEntity01
Drop Table #TmpEntity02
Drop Table #TmpEntity03
Drop Table #TmpEntity04
Drop Table #TmpEntity05

Go

Select
  SV.Entity_ID
, SV.Name
, Case SV.Name
  When 'vwMDM_ModeloCliente' Then CC.ID
  When 'vwMDM_ModeloClienteCréditoyCobranza' Then CyC.ID
  When 'vwMDM_ModeloClienteVentas' Then CV.ID
  When 'vwMDM_ModeloClienteLogistica' Then CL.ID
  When 'vwMDM_ModeloClienteDirecciones' Then CD.ID
--  When 'vwMDM_RutaCliente' Then RC.ID
  End Member_ID
, CC.ID CC_Member_ID
, CC.Code CC_Code
, CC.[Código de Cliente] [Código de Cliente]
Into #TmpEntity01
From mdmherdez.mdm.tblSubscriptionView SV
Cross Join MDMHERDEZ.mdm.vwMDM_ModeloCliente CC
Inner Join #TmpCC01 T1 on T1.ID = CC.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ModeloClienteCréditoyCobranza CyC on CyC.[Clave de  Cliente_ID] = CC.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ModeloClienteDirecciones CD on CD.[Clave de  Cliente_ID] = CC.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ModeloClienteVentas CV on CV.[Clave de  Cliente_ID] = CC.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ModeloClienteLogistica CL on CL.[Clave de  Cliente_ID] = CC.ID
-- Inner Join MDMHERDEZ.mdm.vwMDM_RutaCliente RC on RC.[Código de Cliente_ID] = CC.ID
Where SV.Name In ('vwMDM_ModeloCliente','vwMDM_ModeloClienteCréditoyCobranza','vwMDM_ModeloClienteVentas','vwMDM_ModeloClienteLogistica','vwMDM_ModeloClienteDirecciones','vwMDM_RutaCliente')
-- Where SV.Name In ('vwMDM_ModeloCliente')

Select
  T1.CC_Member_ID
, T1.CC_Code
, T1.[Código de Cliente]
, AA.DisplayName
, T.*
Into #TmpEntity00
From MDMHERDEZ.mdm.tblTransaction T -- With(NoLock, Index(idxbbp01))
Inner Join #TmpEntity01 T1 With(NoLock) On T1.Entity_ID = T.Entity_ID And T1.Member_ID = T.Member_ID
Inner Join mdmherdez.mdm.tblAttribute AA On AA.ID = T.Attribute_ID

/*
Select CC.[Código de Cliente], AA.DisplayName, T3.NewCode, Max(T3.EnterDTM) EnterDTM
Into #TmpEntity05
-- Select *
From #TmpEntity00 T3
Inner Join MDMHERDEZ.mdm.vwMDM_ModeloCliente CC on CC.ID = T3.CC_Member_ID
Inner Join mdmherdez.mdm.tblAttribute AA On AA.ID = T3.Attribute_ID -- And AA.ID = 24481 -- And T3.NewCode = 'BT01'
Group By CC.[Código de Cliente], AA.DisplayName, T3.NewCode 
Order By EnterDTM Desc, CC.[Código de Cliente]

-- Drop Table ##TmpEntity05FUM
Select CC.[Código de Cliente], Max(T3.EnterDTM) EnterDTM
Into ##TmpEntity05FUM
-- Select *
From #TmpEntity00 T3
Inner Join MDMHERDEZ.mdm.vwMDM_ModeloCliente CC on CC.ID = T3.CC_Member_ID
Inner Join mdmherdez.mdm.tblAttribute AA On AA.ID = T3.Attribute_ID -- And AA.ID = 24481 -- And T3.NewCode = 'BT01'
Group By CC.[Código de Cliente]-- , AA.DisplayName, T3.NewCode 
Order By EnterDTM Desc, CC.[Código de Cliente]

Create Index idxBBP01 On ##TmpEntity05FUM ([Código de Cliente])
*/

Select * From #TmpEntity00 TT
where TT.DisplayName = 'Código CP SAT'
-- where TT.DisplayName = 'Usuario Ultima Modificación'
-- And TT.Entity_ID = '984'
-- where TT.DisplayName = 'Tipo Sucursal'
-- where TT.DisplayName = 'NAME'
-- where TT.DisplayName = 'Calle'
-- Where TT.DisplayName = 'Código de Status'
-- Where TT.Attribute_ID = 36824 -- 24554 -- 24480
-- Where TT.DisplayName Like '%statu%' -- And TT.CC_Code = '218594' 
Order By TT.EnterDTM Desc

/*

Select * From MVCMDMDB.dbo.Clientes Where CodigoCliente = '8033119'

Select * From MDMHERDEZ.mdm.vwMDM_CódigosStatus


Select TSC.* From MDMHERDEZ.stg.Clientes_1_2_Leaf TSC Where TSC.Code = '218594'
Select TSC.* From MDMHERDEZ.stg.Clientes_1_2_Leaf TSC Where TSC.BatchTag = 'CambioEstatusCliente2' And TSC.ID > 99129 And Not TSC.Batch_ID Is Null And TSC.[Código de Status] = '16'
Select TSC.* From MDMHERDEZ.stg.Clientes_1_2_Leaf TSC Where TSC.BatchTag = 'JMGUPDMAS20180226150'
Select TSC.* From MDMHERDEZ.stg.Clientes_1_2_Leaf TSC Where TSC.BatchTag = 'JMGUPDMAS20180104235'
Select Max(TSC.ID) ID From MDMHERDEZ.stg.Clientes_1_2_Leaf TSC Where TSC.BatchTag = 'JMGUPDMAS20180104235'

Select Top 100 VC.*
-- Select *
From #TmpEntity00 TT
Inner Join hsvdmddb01.master.dbo.VALIDACION_CLIENTES_CAMPOXCAMPO VC On VC.IDClave_MDM = TT.[Código de Cliente]

Select
 Sum(Cast([Validacion_IDClave] As int)) [Validacion_IDClave]
,Sum(Cast([Validacion_Código de Estado Cliente Llave A_Code] As int)) [Validacion_Código de Estado Cliente Llave A_Code]
,Sum(Cast([Validacion_Código de Ciudad Llave A_Code] As int)) [Validacion_Código de Ciudad Llave A_Code]
,Sum(Cast([Validacion_Código de Cuenta Llave A_MDM] As int)) [Validacion_Código de Cuenta Llave A_MDM]
,Sum(Cast([Validacion_Nombre] As int)) [Validacion_Nombre]
,Sum(Cast([Validacion_Fecha Alta AS400] As int)) [Validacion_Fecha Alta AS400]
,Sum(Cast([Validacion_Registro Federal de Contribuyentes] As int)) [Validacion_Registro Federal de Contribuyentes]
,Sum(Cast([Validacion_Código de Cadena_Code] As int)) [Validacion_Código de Cadena_Code]
,Sum(Cast([Validacion_Descuento Vol Compra] As int)) [Validacion_Descuento Vol Compra]
,Sum(Cast([Validacion_[Código de Tipo de Negocio de Cliente_Code] As int)) [Validacion_[Código de Tipo de Negocio de Cliente_Code]
,Sum(Cast([Validacion_Código de Territorio_Code_MDM] As int)) [Validacion_Código de Territorio_Code_MDM]
,Sum(Cast([Validacion_[Código de Bodega_Code] As int)) [Validacion_[Código de Bodega_Code]
,Sum(Cast([Validacion_Código de Ruta_Code] As int)) [Validacion_Código de Ruta_Code]
,Sum(Cast([Validacion_Vía de Embarque] As int)) [Validacion_Vía de Embarque]
,Sum(Cast([Validacion_Límite de Crédito] As int)) [Validacion_Límite de Crédito]
,Sum(Cast([Validacion_Código de Clasificación de Cliente_Code] As int)) [Validacion_Código de Clasificación de Cliente_Code]
,Sum(Cast([Validacion_Telefono] As int)) [Validacion_Telefono]
,Sum(Cast([Validacion_Fecha de Cheque Devuelto] As int)) [Validacion_Fecha de Cheque Devuelto]
,Sum(Cast([Validacion_Código de Autorizador Límite de Crédito_Code] As int)) [Validacion_Código de Autorizador Límite de Crédito_Code]
,Sum(Cast([Validacion_Código de Tipo de Cliente_Code] As int)) [Validacion_Código de Tipo de Cliente_Code]
,Sum(Cast([Validacion_Código de Plazo_Code] As int)) [Validacion_Código de Plazo_Code]
,Sum(Cast([Validacion_Código de Gerente_Code] As int)) [Validacion_Código de Gerente_Code]
,Sum(Cast([Validacion_Código de Supervisor_Code] As int)) [Validacion_Código de Supervisor_Code]
,Sum(Cast([Validacion_CURP] As int)) [Validacion_CURP]
,Sum(Cast([Validacion_Grupo de Clientes] As int)) [Validacion_Grupo de Clientes]
,Sum(Cast([Validacion_Código de País_Code] As int)) [Validacion_Código de País_Code]
,Sum(Cast([Validacion_Pase Directo Manual] As int)) [Validacion_Pase Directo Manual]
,Sum(Cast([Validacion_Código de Status_Code] As int)) [Validacion_Código de Status_Code]
,Sum(Cast([Validacion_Código de Cliente_Code] As int)) [Validacion_Código de Cliente_Code]
,Sum(Cast([Validacion_Sucursal] As int)) [Validacion_Sucursal]
,Sum(Cast([Validacion_GLN Facturar A] As int)) [Validacion_GLN Facturar A]
,Sum(Cast([Validacion_GLN Embarcar A] As int)) [Validacion_GLN Embarcar A]
,Sum(Cast([Validacion_Calle_E] As int)) [Validacion_Calle_E]
,Sum(Cast([Validacion_Numero Exterior_E] As int)) [Validacion_Numero Exterior_E]
,Sum(Cast([Validacion_Numero Interior_E] As int)) [Validacion_Numero Interior_E]
,Sum(Cast([Validacion_Código de Colonia_E] As int)) [Validacion_Código de Colonia_E]
,Sum(Cast([Validacion_Código de Municipio_E] As int)) [Validacion_Código de Municipio_E]
,Sum(Cast([Validacion_Código de Estado CP_E] As int)) [Validacion_Código de Estado CP_E]
,Sum(Cast([Validacion_Código de Código Postal_E] As int)) [Validacion_Código de Código Postal_E]
,Sum(Cast([Validacion_Calle_F] As int)) [Validacion_Calle_F]
,Sum(Cast([Validacion_Numero Exterior_F] As int)) [Validacion_Numero Exterior_F]
,Sum(Cast([Validacion_Numero Interior_F] As int)) [Validacion_Numero Interior_F]
,Sum(Cast([Validacion_Código de Código Postal_F] As int)) [Validacion_Código de Código Postal_F]
,Sum(Cast([Validacion_Código de Colonia_F] As int)) [Validacion_Código de Colonia_F]
,Sum(Cast([Validacion_Código de Municipio_F] As int)) [Validacion_Código de Municipio_F]
,Sum(Cast([Validacion_Código de Estado CP_F] As int)) [Validacion_Código de Estado CP_F]
,Sum(Cast([Validacion_Latitud] As int)) [Validacion_Latitud]
,Sum(Cast([Validacion_Longitud] As int)) [Validacion_Longitud]
,Sum(Cast([Validacion_Grupo de Precio] As int)) [Validacion_Grupo de Precio]
,Sum(Cast([Validacion_Cuenta Concentradora] As int)) [Validacion_Cuenta Concentradora]
,Sum(Cast([Validacion_Factura Remisión] As int)) [Validacion_Factura Remisión]
,Sum(Cast([Validacion_Día de Facturación] As int)) [Validacion_Día de Facturación]
,Sum(Cast([Validacion_Acuse de Recibo] As int)) [Validacion_Acuse de Recibo]
From #TmpEntity04 TT
Inner Join hsvdmddb01.master.dbo.VALIDACION_CLIENTES_CAMPOXCAMPO VC On VC.IDClave_MDM = TT.[Código de Cliente]

Select
 Sum(Cast([Validacion_Código de Estado Cliente Llave A_Code] As int)) [Validacion_Código de Estado Cliente Llave A_Code]
,Sum(Cast([Validacion_Código de Ciudad Llave A_Code] As int)) [Validacion_Código de Ciudad Llave A_Code]
,Sum(Cast([Validacion_Código de Cuenta Llave A_MDM] As int)) [Validacion_Código de Cuenta Llave A_MDM]
,Sum(Cast([Validacion_Nombre] As int)) [Validacion_Nombre]
,Sum(Cast([Validacion_Fecha Alta AS400] As int)) [Validacion_Fecha Alta AS400]
,Sum(Cast([Validacion_Registro Federal de Contribuyentes] As int)) [Validacion_Registro Federal de Contribuyentes]
,Sum(Cast([Validacion_Código de Cadena_Code] As int)) [Validacion_Código de Cadena_Code]
,Sum(Cast([Validacion_Descuento Vol Compra] As int)) [Validacion_Descuento Vol Compra]
,Sum(Cast([Validacion_[Código de Tipo de Negocio de Cliente_Code] As int)) [Validacion_[Código de Tipo de Negocio de Cliente_Code]
,Sum(Cast([Validacion_Código de Territorio_Code_MDM] As int)) [Validacion_Código de Territorio_Code_MDM]
,Sum(Cast([Validacion_[Código de Bodega_Code] As int)) [Validacion_[Código de Bodega_Code]
,Sum(Cast([Validacion_Código de Ruta_Code] As int)) [Validacion_Código de Ruta_Code]
,Sum(Cast([Validacion_Vía de Embarque] As int)) [Validacion_Vía de Embarque]
,Sum(Cast([Validacion_Límite de Crédito] As int)) [Validacion_Límite de Crédito]
,Sum(Cast([Validacion_Código de Clasificación de Cliente_Code] As int)) [Validacion_Código de Clasificación de Cliente_Code]
,Sum(Cast([Validacion_Telefono] As int)) [Validacion_Telefono]
,Sum(Cast([Validacion_Fecha de Cheque Devuelto] As int)) [Validacion_Fecha de Cheque Devuelto]
,Sum(Cast([Validacion_Código de Autorizador Límite de Crédito_Code] As int)) [Validacion_Código de Autorizador Límite de Crédito_Code]
,Sum(Cast([Validacion_Código de Tipo de Cliente_Code] As int)) [Validacion_Código de Tipo de Cliente_Code]
,Sum(Cast([Validacion_Código de Plazo de Pago_Code] As int)) [Validacion_Código de Plazo de Pago_Code]
,Sum(Cast([Validacion_Código de Plazo_Code] As int)) [Validacion_Código de Plazo_Code]
,Sum(Cast([Validacion_Código de Gerente_Code] As int)) [Validacion_Código de Gerente_Code]
,Sum(Cast([Validacion_Código de Supervisor_Code] As int)) [Validacion_Código de Supervisor_Code]
,Sum(Cast([Validacion_CURP] As int)) [Validacion_CURP]
,Sum(Cast([Validacion_Grupo de Clientes] As int)) [Validacion_Grupo de Clientes]
,Sum(Cast([Validacion_Código de País_Code] As int)) [Validacion_Código de País_Code]
,Sum(Cast([Validacion_Pase Directo Manual] As int)) [Validacion_Pase Directo Manual]
,Sum(Cast([Validacion_Código de Status_Code] As int)) [Validacion_Código de Status_Code]
,Sum(Cast([Validacion_Código de Cliente_Code] As int)) [Validacion_Código de Cliente_Code]
,Sum(Cast([Validacion_Sucursal] As int)) [Validacion_Sucursal]
,Sum(Cast([Validacion_Nombre_Sucursal] As int)) [Validacion_Nombre_Sucursal]
,Sum(Cast([Validacion_GLN Facturar A] As int)) [Validacion_GLN Facturar A]
,Sum(Cast([Validacion_GLN Embarcar A] As int)) [Validacion_GLN Embarcar A]
,Sum(Cast([Validacion_Calle_E] As int)) [Validacion_Calle_E]
,Sum(Cast([Validacion_Numero Exterior_E] As int)) [Validacion_Numero Exterior_E]
,Sum(Cast([Validacion_Numero Interior_E] As int)) [Validacion_Numero Interior_E]
,Sum(Cast([Validacion_Código de Colonia_E] As int)) [Validacion_Código de Colonia_E]
,Sum(Cast([Validacion_Código de Municipio_E] As int)) [Validacion_Código de Municipio_E]
,Sum(Cast([Validacion_Código de Estado CP_E] As int)) [Validacion_Código de Estado CP_E]
,Sum(Cast([Validacion_Código de País_F_Code] As int)) [Validacion_Código de País_F_Code]
,Sum(Cast([Validacion_Código de Código Postal_E] As int)) [Validacion_Código de Código Postal_E]
,Sum(Cast([Validacion_Calle_F] As int)) [Validacion_Calle_F]
,Sum(Cast([Validacion_Numero Exterior_F] As int)) [Validacion_Numero Exterior_F]
,Sum(Cast([Validacion_Numero Interior_F] As int)) [Validacion_Numero Interior_F]
,Sum(Cast([Validacion_Código de Código Postal_F] As int)) [Validacion_Código de Código Postal_F]
,Sum(Cast([Validacion_Código de Colonia_F] As int)) [Validacion_Código de Colonia_F]
,Sum(Cast([Validacion_Código de Municipio_F] As int)) [Validacion_Código de Municipio_F]
,Sum(Cast([Validacion_Código de Estado CP_F_400] As int)) [Validacion_Código de Estado CP_F_400]
,Sum(Cast([Validacion_latitud] As int)) [Validacion_latitud]
,Sum(Cast([Validacion_Longitud] As int)) [Validacion_Longitud]
,Sum(Cast([Validacion_Grupo de Precio] As int)) [Validacion_Grupo de Precio]
,Sum(Cast([Validacion_Cuenta Concentradora] As int)) [Validacion_Cuenta Concentradora]
,Sum(Cast([Validacion_Acuse de Recibo] As int)) [Validacion_Acuse de Recibo]
,Sum(Cast([Validacion_Factura Remisión] As int)) [Validacion_Factura Remisión]
,Sum(Cast([Validacion_Día de Facturación] As int)) [Validacion_Día de Facturación]
,Sum(Cast([ValidacioN_Cuenta Pagadora] As int)) [ValidacioN_Cuenta Pagadora]
,Sum(Cast([ValidacioN_Nombre Comercial Cliente] As int)) [ValidacioN_Nombre Comercial Cliente]
,Sum(Cast([ValidacioN_Compañia Comercializadora] As int)) [ValidacioN_Compañia Comercializadora]
,Sum(Cast([ValidacioN_Compañia principal] As int)) [ValidacioN_Compañia principal]
,Sum(Cast([ValidacioN_Pase Directo Automatico] As int)) [ValidacioN_Pase Directo Automatico]
,Sum(Cast([Validacion_Analista] As int)) [Validacion_Analista]
,Sum(Cast([Validacion_Tipos de Movimiento] As int)) [Validacion_Tipos de Movimiento]
,Sum(Cast([Validacion_Banco] As int)) [Validacion_Banco]
,Sum(Cast([Validacion_Plaza] As int)) [Validacion_Plaza]
,Sum(Cast([Validacion_Segmento CxC] As int)) [Validacion_Segmento CxC]
,Sum(Cast([Validacion_Grupo de Precio POS] As int)) [Validacion_Grupo de Precio POS]
,Sum(Cast([Validacion_Tienda] As int)) [Validacion_Tienda]
,Sum(Cast([Validacion_Inventario en Tienda] As int)) [Validacion_Inventario en Tienda]
,Sum(Cast([Validacion_Direccion_Entrega_CONCAT] As int)) [Validacion_Direccion_Entrega_CONCAT]
,Sum(Cast([Validacion_Direccion_Facturacion_CONCAT] As int)) [Validacion_Direccion_Facturacion_CONCAT]
From #TmpEntity05 TT
Inner Join hsvdmddb01.master.dbo.VALIDACION_CLIENTES_CAMPOXCAMPO_V2 VC On VC.IDClave_MDM = TT.[Código de Cliente]
Where [Validacion_Acuse de Recibo] = 11

-- Where TT.[IDClave_MDM] = '0255916'

Select VC.* -- Max(Len(VC.Nombre_400))
From #TmpEntity04 TT
Inner Join hsvdmddb01.master.dbo.VALIDACION_CLIENTES_CAMPOXCAMPO_V2 VC On VC.IDClave_MDM = TT.[Código de Cliente]
Where Validacion_Nombre = '1'
And Not VC.Nombre_400 = Left(VC.Nombre_MDM, 40)

-- 'FARMACIAS SAN FRANCISCO DE ASIS SA DE CV'
-- 'FARMACIA SAN FRANCISCO DE ASIS SA DE CV'

Select Top 100 *
From MDMHERDEZ.stg.Clientes_1_2_Leaf
Where BatchTag = 'CambioEstatusCliente2'
Order By Batch_ID Desc

Select Top 100 *
From MDMHERDEZ.stg.Clientes_1_2_Leaf
Where Code = '254468'
= 'CambioEstatusCliente2'
Order By Batch_ID Desc

Select CC.[Código de Cliente], CC.Code, CC.ID
From MDMHERDEZ.mdm.vwMDM_ModeloCliente CC
Where CC.[Código de Ciudad  Llave A_Code] IN ('1906','1912')
Where CC.Code = '254468'

-- Select * from sys.syscomments where text like '%CambioEstatusCliente2%'

Select *
From MDMHERDEZ.mdm.vwMDM_BI_Tipo_Sucursal_Nutrisa

*/
