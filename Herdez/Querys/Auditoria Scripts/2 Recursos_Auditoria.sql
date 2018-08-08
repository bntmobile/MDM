-- Drop Table #TmpPP01
Select PP.Id, PP.[N�mero de Recurso], PP.Code, CIA.[Nombre de Compa�ia Num�rica], CIA.[C�digo de Compa�ia Num�rica]
Into #TmpPP01
From MDMHERDEZ.mdm.vwMDM_ModeloProductos PP With(NoLock)
Inner Join MDMHERDEZ.mdm.vwMDM_ProductosExtendido PE With(NoLock) On PE.[Codigo de Producto_ID] = PP.ID
Inner Join MDMHERDEZ.mdm.vwMDM_CompaniaNumerica CIA With(NoLock) On CIA.ID = PE.[N�mero de Compa��a_ID]
-- Where PE.LastChgDateTime >= '2018-04-25 23:59:59.997'
Where PP.[N�mero de Recurso] in ('625071', '625072')
-- Where PP.[N�mero de Recurso] in ('535397'	,'535357'	,'475093'	,'475102'	,'515607'	,'515611'	,'515614'	,'515617'	,'515619'	,'515621'	,'515623'	,'515626'	,'515636'	,'515639'	,'515644'	,'515645'	,'535131'	,'535159'	,'535166'	,'535167'	,'535174'	,'535179'	,'535185'	,'535189'	,'535198'	,'535205'	,'535206'	,'535213'	,'535226'	,'535266'	,'535304'	,'535305'	,'535355'	,'535356'	,'535595'	,'535596'	,'535610'	,'945012'	,'945026')
-- Where PP.[N�mero de Recurso] In ('985944','985945','985978','985981','985983')
-- Where PP.[N�mero de Recurso] In ('535316','535319','535336','545120','545122','545123','625055','945166','945167','945168','945169','945170','945171','985944','985945','985978','985981','985983')

-- Where PP.[N�mero de Recurso] In ('985877','985878','985879','985880','985881','985882','985883','985884','985885','985886')
-- Where PP.[N�mero de Recurso] = '985964' -- 475127' -- 985374' -- 985857'
-- Where PP.[N�mero de Recurso] = '945141'
-- Where PP.[N�mero de Recurso] = '425062'
-- Where PP.[N�mero de Recurso] In ('475003', '475005', '475006')

-- Inner Join #Tmp01 T1 With(NoLock) On T1.StgClientesCode = CC.Code

-- Select * From MDMHERDEZ.mdm.vwMDM_CyCCadenas 

Create Index idxBBP01 On #TmpPP01 ([N�mero de Recurso])
Create Clustered Index idxBBP02 On #TmpPP01 (ID)

-- Alter Procedure dbo.Get_BO_Rutero As
Go

Drop Table #TmpEntity00
Drop Table #TmpEntity01
Drop Table #TmpEntity02
Drop Table #TmpEntity03
-- Drop Table #TmpEntity04
-- Drop Table #TmpEntity05

Go

Select Distinct
  SV.Entity_ID
, SV.Name
, Case SV.Name
  When 'vwMDM_ModeloProductos' Then PP.ID
  When 'vwMDM_ProductosExtendido' Then PE.ID
  When 'vwMDM_ProductosCostos' Then PC.ID
  When 'vwMDM_Productos_Codigo_de_Barras' Then CB.ID
  When 'vwMDM_ProductosAseguramientoCalidad' Then AC.ID
  When 'vwMDM_ProductosPlaneacion' Then PL.ID
  When 'vwMDM_ProductosCompras' Then CC.ID
  When 'vwMDM_Productos_Almacenes' Then PA.ID
  When 'vwMDM_ModeloProductosHelados' Then PH.ID
  When 'vwMDM_ProductosComentarios' Then CO.ID
  When 'vwMDM_PlandeDemanda' Then PD.ID
  When 'vwMDM_ProductosCampos_Adicionales' Then CA.ID
  When 'vwMDM_Productos_Converciones' Then UMC.ID
  When 'vwMDM_PosNutrisa' Then POS.ID
  When 'vwMDM_ProductoGrupoDePrecio' Then POSGP.ID
  When 'vwMDM_Productos_Converciones' Then UMC.ID
  End Member_ID
, PP.ID PP_Member_ID
, PP.Code PP_Code
, PP.[N�mero de Recurso] [N�mero de Recurso]
, PP.[Descripci�n del Recurso]
, PP.[Usuario Modificaci�n]
, PP.[Clave de Actualizacion_Name]
Into #TmpEntity01
-- Select T1.*
From mdmherdez.mdm.tblSubscriptionView SV
Cross Join MDMHERDEZ.mdm.vwMDM_ModeloProductos PP
Inner Join #TmpPP01 T1 on T1.ID = PP.ID
Inner Join MDMHERDEZ.mdm.vwMDM_PosNutrisa POS on POS.[C�digo de Producto_ID] = PP.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ProductoGrupoDePrecio POSGP on POSGP.[Codigo Padre_ID] = POS.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ProductosExtendido PE on PE.[Codigo de Producto_ID] = PP.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ProductosCostos PC on PC.[Codigo de Producto_ID] = PP.ID -- And PCA.Entidad = 'ALMACENES'
--Inner Join MDMHERDEZ.mdm.vwMDM_ProductosCostos PCA on PCA.[Codigo de Producto_ID] = PP.ID And PCA.Entidad = 'ALMACENES'
--Inner Join MDMHERDEZ.mdm.vwMDM_ProductosCostos PCG on PCG.[Codigo de Producto_ID] = PP.ID And PCG.Entidad = 'GRUPO'
Inner Join MDMHERDEZ.mdm.vwMDM_Productos_Codigo_de_Barras CB on CB.[Codigo de Producto_ID] = PP.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ProductosAseguramientoCalidad AC on AC.[Codigo de Producto_ID] = PP.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ProductosPlaneacion PL on PL.[Codigo de Producto_ID] = PP.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ProductosCompras CC on CC.[Codigo de Producto_ID] = PP.ID
Inner Join MDMHERDEZ.mdm.vwMDM_Productos_Almacenes PA on PA.[Codigo de Producto_ID] = PP.ID
Left  Join MDMHERDEZ.mdm.vwMDM_ModeloProductosHelados PH on PH.[Codigo de Producto_ID] = PP.ID
Left  Join MDMHERDEZ.mdm.vwMDM_ProductosComentarios CO on CO.[Codigo de Producto_ID] = PP.ID
Left  Join MDMHERDEZ.mdm.vwMDM_PlandeDemanda PD on PD.[Codigo de Producto_ID] = PP.ID
Left  Join MDMHERDEZ.mdm.vwMDM_ProductosCampos_Adicionales CA on CA.[Codigo de Producto_ID] = PP.ID
Left  Join MDMHERDEZ.mdm.vwMDM_Productos_Converciones UMC on UMC.[Codigo de Producto_ID] = PP.ID
Where SV.Name In 
('vwMDM_ModeloProductos'
,'vwMDM_ProductosExtendido'
,'vwMDM_ProductosCostos'
,'vwMDM_Productos_Codigo_de_Barras'
,'vwMDM_ProductosAseguramientoCalidad'
,'vwMDM_ProductosPlaneacion'
,'vwMDM_ProductosCompras'
,'vwMDM_Productos_Almacenes'
,'vwMDM_ModeloProductosHelados'
,'vwMDM_ProductosComentarios'
,'vwMDM_PlandeDemanda'
,'vwMDM_ProductosCampos_Adicionales'
,'vwMDM_Productos_Converciones'
,'vwMDM_PosNutrisa'
,'vwMDM_ProductoGrupoDePrecio'
,'vwMDM_Productos_Converciones'
)

Select
  T1.PP_Member_ID
, T1.PP_Code
, T1.[N�mero de Recurso]
, T1.[Descripci�n del Recurso]
, T1.Name
, T1.[Usuario Modificaci�n]
, T1.[Clave de Actualizacion_Name]
, AA.DisplayName
, T.*
Into #TmpEntity00 
-- Drop table #TmpEntity00
From MDMHERDEZ.mdm.tblTransaction T -- With(NoLock, Index(idxbbp01))
Inner Join #TmpEntity01 T1 With(NoLock) On T1.Entity_ID = T.Entity_ID And T1.Member_ID = T.Member_ID
Inner Join mdmherdez.mdm.tblAttribute AA On AA.ID = T.Attribute_ID
-- Where T.EnterDTM > DateAdd(dd, -2, GetDate())

Select TT.[N�mero de Recurso], TT.[Descripci�n del Recurso], TT.Name, TT.DisplayName, TT.OldCode, TT.NewCode, TT.EnterDTM-- , TT.
From #TmpEntity00 TT
Where name = 'vwMDM_Productos_Converciones' -- and DisplayName = 'Precio de Venta'
-- Where DisplayName like '%LINEA%'
-- Where DisplayName like '%unidad%'
-- Where name = 'vwMDM_ProductosExtendido' and DisplayName = 'Precio de Venta'
-- Where (name In ('vwMDM_ModeloProductos','vwMDM_ProductosExtendido') and DisplayName in ('Cat�goria de Impuesto', 'Categor�a de Impuestos'))
-- Where name = 'vwMDM_ProductoGrupoDePrecio' -- and DisplayName = 'Precio'
-- Where name = 'vwMDM_ProductosExtendido' and DisplayName = 'Categor�a de Impuestos'
-- Where name = 'vwMDM_ProductosExtendido' and DisplayName = 'Precio de Venta'
-- Where TT.[N�mero de Recurso] = '535159'
-- Where TT.[N�mero de Recurso] In ('985944','985945','985978','985981','985983')
-- Where TT.[N�mero de Recurso] In ('535316','535319','535336','545120','545122','545123','625055','945166','945167','945168','945169','945170','945171')
-- Order By TT.EnterDTM Desc
Order By TT.[N�mero de Recurso], TT.EnterDTM Desc

Select * From MDMHERDEZ.mdm.vmMDM_PD_CodigoDeImpuesto Where Code = '4'
Select * From MDMHERDEZ.mdm.vwMDM_Impuestos ii where ii.[Codigo de Categoria Impuesto] = 'I08'
Select * From MDMHERDEZ.mdm.vwMDM_Impuestos Where Code = '4'

-- Inner Join #TmpEntity03 T3 On T3.ID = TT.ID
-- Order By TT.EnterDTM Desc
-- Where TT.Name = 'vwMDM_ProductosCostos'
-- Where TT.Name = 'vwMDM_PosNutrisa'
-- Where TT.Name = 'vwMDM_ModeloProductos'
-- Where TT.DisplayName = 'Usuario Modificaci�n'
-- Where TT.DisplayName = 'Clave de Actualizacion'
-- And TT.DisplayName = 'Unidad de Medida Est�ndar POS'
-- And TT.DisplayName = 'Precio de Venta'
-- And TT.DisplayName = 'Costo'
-- And TT.DisplayName Like '%Usua%'
-- And TT.DisplayName = 'Costo Est�ndar'
-- Where TT.Name = 'vwMDM_Productos_Converciones'
-- Where TT.Attribute_ID = 24480
-- Where TT.DisplayName Like '%statu%' -- And TT.CC_Code = '218594' 
Order By  TT.EnterDTM Desc

-- Select * From #TmpPP01 P1 Where P1.[N�mero de Recurso] = '985983'

-- Select Distinct ',' + '''' + TT.[N�mero de Recurso] + '''' 
Select TT.[N�mero de Recurso], Max(TT.ID) ID, TT.DisplayName
Into #TmpEntity03
-- Select Distinct TT.[N�mero de Recurso]
-- Select Distinct TT.DisplayName
From #TmpEntity00 TT
Where TT.DisplayName = 'Usuario Modificaci�n'
Group By TT.[N�mero de Recurso]

Select TT.[N�mero de Recurso], Count(*)
, ',' + '''' + TT.[N�mero de Recurso] + '''' 
From #TmpEntity00 TT
-- Where TT.DisplayName = 'Usuario Modificaci�n'
Group By TT.[N�mero de Recurso]
Having Not Count(*) = 1
-- Having Count(*) = 1

Select Top 100 AA.DisplayName, T.*
From MDMHERDEZ.mdm.tblTransaction T -- With(NoLock, Index(idxbbp01))
Inner Join mdmherdez.mdm.tblAttribute AA On AA.ID = T.Attribute_ID
Where T.Member_ID = 7183
Order By T.EnterDTM Desc

Select PP.[N�mero de Recurso], T3.NewCode, Max(T3.EnterDTM) EnterDTM
Into #TmpEntity02
From #TmpEntity00 T3
Inner Join MDMHERDEZ.mdm.vwMDM_ModeloProductos PP on PP.ID = T3.PP_Member_ID
Group By PP.[N�mero de Recurso], T3.NewCode 
Order By EnterDTM Desc, PP.[N�mero de Recurso]

/*
Select Top 100 VC.*
-- Select *
From #TmpEntity00 TT
Inner Join hsvdmddb01.master.dbo.VALIDACION_CLIENTES_CAMPOXCAMPO VC On VC.IDClave_MDM = TT.[C�digo de Cliente]

Select
 Sum(Cast([Validacion_IDClave] As int)) [Validacion_IDClave]
,Sum(Cast([Validacion_C�digo de Estado Cliente Llave A_Code] As int)) [Validacion_C�digo de Estado Cliente Llave A_Code]
,Sum(Cast([Validacion_C�digo de Ciudad Llave A_Code] As int)) [Validacion_C�digo de Ciudad Llave A_Code]
,Sum(Cast([Validacion_C�digo de Cuenta Llave A_MDM] As int)) [Validacion_C�digo de Cuenta Llave A_MDM]
,Sum(Cast([Validacion_Nombre] As int)) [Validacion_Nombre]
,Sum(Cast([Validacion_Fecha Alta AS400] As int)) [Validacion_Fecha Alta AS400]
,Sum(Cast([Validacion_Registro Federal de Contribuyentes] As int)) [Validacion_Registro Federal de Contribuyentes]
,Sum(Cast([Validacion_C�digo de Cadena_Code] As int)) [Validacion_C�digo de Cadena_Code]
,Sum(Cast([Validacion_Descuento Vol Compra] As int)) [Validacion_Descuento Vol Compra]
,Sum(Cast([Validacion_[C�digo de Tipo de Negocio de Cliente_Code] As int)) [Validacion_[C�digo de Tipo de Negocio de Cliente_Code]
,Sum(Cast([Validacion_C�digo de Territorio_Code_MDM] As int)) [Validacion_C�digo de Territorio_Code_MDM]
,Sum(Cast([Validacion_[C�digo de Bodega_Code] As int)) [Validacion_[C�digo de Bodega_Code]
,Sum(Cast([Validacion_C�digo de Ruta_Code] As int)) [Validacion_C�digo de Ruta_Code]
,Sum(Cast([Validacion_V�a de Embarque] As int)) [Validacion_V�a de Embarque]
,Sum(Cast([Validacion_L�mite de Cr�dito] As int)) [Validacion_L�mite de Cr�dito]
,Sum(Cast([Validacion_C�digo de Clasificaci�n de Cliente_Code] As int)) [Validacion_C�digo de Clasificaci�n de Cliente_Code]
,Sum(Cast([Validacion_Telefono] As int)) [Validacion_Telefono]
,Sum(Cast([Validacion_Fecha de Cheque Devuelto] As int)) [Validacion_Fecha de Cheque Devuelto]
,Sum(Cast([Validacion_C�digo de Autorizador L�mite de Cr�dito_Code] As int)) [Validacion_C�digo de Autorizador L�mite de Cr�dito_Code]
,Sum(Cast([Validacion_C�digo de Tipo de Cliente_Code] As int)) [Validacion_C�digo de Tipo de Cliente_Code]
,Sum(Cast([Validacion_C�digo de Plazo_Code] As int)) [Validacion_C�digo de Plazo_Code]
,Sum(Cast([Validacion_C�digo de Gerente_Code] As int)) [Validacion_C�digo de Gerente_Code]
,Sum(Cast([Validacion_C�digo de Supervisor_Code] As int)) [Validacion_C�digo de Supervisor_Code]
,Sum(Cast([Validacion_CURP] As int)) [Validacion_CURP]
,Sum(Cast([Validacion_Grupo de Clientes] As int)) [Validacion_Grupo de Clientes]
,Sum(Cast([Validacion_C�digo de Pa�s_Code] As int)) [Validacion_C�digo de Pa�s_Code]
,Sum(Cast([Validacion_Pase Directo Manual] As int)) [Validacion_Pase Directo Manual]
,Sum(Cast([Validacion_C�digo de Status_Code] As int)) [Validacion_C�digo de Status_Code]
,Sum(Cast([Validacion_C�digo de Cliente_Code] As int)) [Validacion_C�digo de Cliente_Code]
,Sum(Cast([Validacion_Sucursal] As int)) [Validacion_Sucursal]
,Sum(Cast([Validacion_GLN Facturar A] As int)) [Validacion_GLN Facturar A]
,Sum(Cast([Validacion_GLN Embarcar A] As int)) [Validacion_GLN Embarcar A]
,Sum(Cast([Validacion_Calle_E] As int)) [Validacion_Calle_E]
,Sum(Cast([Validacion_Numero Exterior_E] As int)) [Validacion_Numero Exterior_E]
,Sum(Cast([Validacion_Numero Interior_E] As int)) [Validacion_Numero Interior_E]
,Sum(Cast([Validacion_C�digo de Colonia_E] As int)) [Validacion_C�digo de Colonia_E]
,Sum(Cast([Validacion_C�digo de Municipio_E] As int)) [Validacion_C�digo de Municipio_E]
,Sum(Cast([Validacion_C�digo de Estado CP_E] As int)) [Validacion_C�digo de Estado CP_E]
,Sum(Cast([Validacion_C�digo de C�digo Postal_E] As int)) [Validacion_C�digo de C�digo Postal_E]
,Sum(Cast([Validacion_Calle_F] As int)) [Validacion_Calle_F]
,Sum(Cast([Validacion_Numero Exterior_F] As int)) [Validacion_Numero Exterior_F]
,Sum(Cast([Validacion_Numero Interior_F] As int)) [Validacion_Numero Interior_F]
,Sum(Cast([Validacion_C�digo de C�digo Postal_F] As int)) [Validacion_C�digo de C�digo Postal_F]
,Sum(Cast([Validacion_C�digo de Colonia_F] As int)) [Validacion_C�digo de Colonia_F]
,Sum(Cast([Validacion_C�digo de Municipio_F] As int)) [Validacion_C�digo de Municipio_F]
,Sum(Cast([Validacion_C�digo de Estado CP_F] As int)) [Validacion_C�digo de Estado CP_F]
,Sum(Cast([Validacion_Latitud] As int)) [Validacion_Latitud]
,Sum(Cast([Validacion_Longitud] As int)) [Validacion_Longitud]
,Sum(Cast([Validacion_Grupo de Precio] As int)) [Validacion_Grupo de Precio]
,Sum(Cast([Validacion_Cuenta Concentradora] As int)) [Validacion_Cuenta Concentradora]
,Sum(Cast([Validacion_Factura Remisi�n] As int)) [Validacion_Factura Remisi�n]
,Sum(Cast([Validacion_D�a de Facturaci�n] As int)) [Validacion_D�a de Facturaci�n]
,Sum(Cast([Validacion_Acuse de Recibo] As int)) [Validacion_Acuse de Recibo]
From #TmpEntity04 TT
Inner Join hsvdmddb01.master.dbo.VALIDACION_CLIENTES_CAMPOXCAMPO VC On VC.IDClave_MDM = TT.[C�digo de Cliente]

Select
 Sum(Cast([Validacion_C�digo de Estado Cliente Llave A_Code] As int)) [Validacion_C�digo de Estado Cliente Llave A_Code]
,Sum(Cast([Validacion_C�digo de Ciudad Llave A_Code] As int)) [Validacion_C�digo de Ciudad Llave A_Code]
,Sum(Cast([Validacion_C�digo de Cuenta Llave A_MDM] As int)) [Validacion_C�digo de Cuenta Llave A_MDM]
,Sum(Cast([Validacion_Nombre] As int)) [Validacion_Nombre]
,Sum(Cast([Validacion_Fecha Alta AS400] As int)) [Validacion_Fecha Alta AS400]
,Sum(Cast([Validacion_Registro Federal de Contribuyentes] As int)) [Validacion_Registro Federal de Contribuyentes]
,Sum(Cast([Validacion_C�digo de Cadena_Code] As int)) [Validacion_C�digo de Cadena_Code]
,Sum(Cast([Validacion_Descuento Vol Compra] As int)) [Validacion_Descuento Vol Compra]
,Sum(Cast([Validacion_[C�digo de Tipo de Negocio de Cliente_Code] As int)) [Validacion_[C�digo de Tipo de Negocio de Cliente_Code]
,Sum(Cast([Validacion_C�digo de Territorio_Code_MDM] As int)) [Validacion_C�digo de Territorio_Code_MDM]
,Sum(Cast([Validacion_[C�digo de Bodega_Code] As int)) [Validacion_[C�digo de Bodega_Code]
,Sum(Cast([Validacion_C�digo de Ruta_Code] As int)) [Validacion_C�digo de Ruta_Code]
,Sum(Cast([Validacion_V�a de Embarque] As int)) [Validacion_V�a de Embarque]
,Sum(Cast([Validacion_L�mite de Cr�dito] As int)) [Validacion_L�mite de Cr�dito]
,Sum(Cast([Validacion_C�digo de Clasificaci�n de Cliente_Code] As int)) [Validacion_C�digo de Clasificaci�n de Cliente_Code]
,Sum(Cast([Validacion_Telefono] As int)) [Validacion_Telefono]
,Sum(Cast([Validacion_Fecha de Cheque Devuelto] As int)) [Validacion_Fecha de Cheque Devuelto]
,Sum(Cast([Validacion_C�digo de Autorizador L�mite de Cr�dito_Code] As int)) [Validacion_C�digo de Autorizador L�mite de Cr�dito_Code]
,Sum(Cast([Validacion_C�digo de Tipo de Cliente_Code] As int)) [Validacion_C�digo de Tipo de Cliente_Code]
,Sum(Cast([Validacion_C�digo de Plazo de Pago_Code] As int)) [Validacion_C�digo de Plazo de Pago_Code]
,Sum(Cast([Validacion_C�digo de Plazo_Code] As int)) [Validacion_C�digo de Plazo_Code]
,Sum(Cast([Validacion_C�digo de Gerente_Code] As int)) [Validacion_C�digo de Gerente_Code]
,Sum(Cast([Validacion_C�digo de Supervisor_Code] As int)) [Validacion_C�digo de Supervisor_Code]
,Sum(Cast([Validacion_CURP] As int)) [Validacion_CURP]
,Sum(Cast([Validacion_Grupo de Clientes] As int)) [Validacion_Grupo de Clientes]
,Sum(Cast([Validacion_C�digo de Pa�s_Code] As int)) [Validacion_C�digo de Pa�s_Code]
,Sum(Cast([Validacion_Pase Directo Manual] As int)) [Validacion_Pase Directo Manual]
,Sum(Cast([Validacion_C�digo de Status_Code] As int)) [Validacion_C�digo de Status_Code]
,Sum(Cast([Validacion_C�digo de Cliente_Code] As int)) [Validacion_C�digo de Cliente_Code]
,Sum(Cast([Validacion_Sucursal] As int)) [Validacion_Sucursal]
,Sum(Cast([Validacion_Nombre_Sucursal] As int)) [Validacion_Nombre_Sucursal]
,Sum(Cast([Validacion_GLN Facturar A] As int)) [Validacion_GLN Facturar A]
,Sum(Cast([Validacion_GLN Embarcar A] As int)) [Validacion_GLN Embarcar A]
,Sum(Cast([Validacion_Calle_E] As int)) [Validacion_Calle_E]
,Sum(Cast([Validacion_Numero Exterior_E] As int)) [Validacion_Numero Exterior_E]
,Sum(Cast([Validacion_Numero Interior_E] As int)) [Validacion_Numero Interior_E]
,Sum(Cast([Validacion_C�digo de Colonia_E] As int)) [Validacion_C�digo de Colonia_E]
,Sum(Cast([Validacion_C�digo de Municipio_E] As int)) [Validacion_C�digo de Municipio_E]
,Sum(Cast([Validacion_C�digo de Estado CP_E] As int)) [Validacion_C�digo de Estado CP_E]
,Sum(Cast([Validacion_C�digo de Pa�s_F_Code] As int)) [Validacion_C�digo de Pa�s_F_Code]
,Sum(Cast([Validacion_C�digo de C�digo Postal_E] As int)) [Validacion_C�digo de C�digo Postal_E]
,Sum(Cast([Validacion_Calle_F] As int)) [Validacion_Calle_F]
,Sum(Cast([Validacion_Numero Exterior_F] As int)) [Validacion_Numero Exterior_F]
,Sum(Cast([Validacion_Numero Interior_F] As int)) [Validacion_Numero Interior_F]
,Sum(Cast([Validacion_C�digo de C�digo Postal_F] As int)) [Validacion_C�digo de C�digo Postal_F]
,Sum(Cast([Validacion_C�digo de Colonia_F] As int)) [Validacion_C�digo de Colonia_F]
,Sum(Cast([Validacion_C�digo de Municipio_F] As int)) [Validacion_C�digo de Municipio_F]
,Sum(Cast([Validacion_C�digo de Estado CP_F_400] As int)) [Validacion_C�digo de Estado CP_F_400]
,Sum(Cast([Validacion_latitud] As int)) [Validacion_latitud]
,Sum(Cast([Validacion_Longitud] As int)) [Validacion_Longitud]
,Sum(Cast([Validacion_Grupo de Precio] As int)) [Validacion_Grupo de Precio]
,Sum(Cast([Validacion_Cuenta Concentradora] As int)) [Validacion_Cuenta Concentradora]
,Sum(Cast([Validacion_Acuse de Recibo] As int)) [Validacion_Acuse de Recibo]
,Sum(Cast([Validacion_Factura Remisi�n] As int)) [Validacion_Factura Remisi�n]
,Sum(Cast([Validacion_D�a de Facturaci�n] As int)) [Validacion_D�a de Facturaci�n]
,Sum(Cast([ValidacioN_Cuenta Pagadora] As int)) [ValidacioN_Cuenta Pagadora]
,Sum(Cast([ValidacioN_Nombre Comercial Cliente] As int)) [ValidacioN_Nombre Comercial Cliente]
,Sum(Cast([ValidacioN_Compa�ia Comercializadora] As int)) [ValidacioN_Compa�ia Comercializadora]
,Sum(Cast([ValidacioN_Compa�ia principal] As int)) [ValidacioN_Compa�ia principal]
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
Inner Join hsvdmddb01.master.dbo.VALIDACION_CLIENTES_CAMPOXCAMPO_V2 VC On VC.IDClave_MDM = TT.[C�digo de Cliente]
Where [Validacion_Acuse de Recibo] = 11

-- Where TT.[IDClave_MDM] = '0255916'

Select VC.* -- Max(Len(VC.Nombre_400))
From #TmpEntity04 TT
Inner Join hsvdmddb01.master.dbo.VALIDACION_CLIENTES_CAMPOXCAMPO_V2 VC On VC.IDClave_MDM = TT.[C�digo de Cliente]
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

Select CC.[C�digo de Cliente], CC.Code, CC.ID
From MDMHERDEZ.mdm.vwMDM_ModeloCliente CC
Where CC.Code = '254468'

-- Select * from sys.syscomments where text like '%CambioEstatusCliente2%'
*/

Select PP.[Contenido Neto], PP.[Empaque Contenido], PP.[Tipo de Envase_Name], PP.[Unidad de Medida P Descripci�n_Name], PP.[N�mero de Recurso], PP.Name
, POS.*
From MDMHERDEZ.mdm.vwMDM_ModeloProductos PP
Inner Join MDMHERDEZ.mdm.vwMDM_PosNutrisa POS on POS.[C�digo de Producto_ID] = PP.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ProductoGrupoDePrecio POSGP on POSGP.[Codigo Padre_ID] = POS.ID
Where PP.[N�mero de Recurso] = '515617'
And POSGP.[Codigo Padre_ID] = POSGP.[Codigo Hijo_ID]

