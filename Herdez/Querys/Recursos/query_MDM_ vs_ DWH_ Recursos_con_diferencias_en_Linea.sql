USE MDMHERDEZCI
GO
WITH allProducts 
AS 
(
SELECT    
P.ID
, P.[N�mero de Recurso]
, P.[Descripci�n H�rdez]
, TDP.[C�digo de Tipo de Producto],  TDP.[Nombre de Tipo de Producto]
, O.[C�digo de Origen] 
, O.[Nombre de Origen]
, M.[C�digo de Marca Armado Clave ME], M.[Nombre de Marca Armado Clave ME]
, C.[Codigo de Clase],C.Descripci�n as 'Nombre de Clase'
, P.[Peso Bruto]  	
, TE.[C�digo de Tipo de Envase],TE.[Nombre de Tipo de Envase]
, SC.[Clave de Subclase],SC.[Descripci�n Subclase]
, P.[Peso Neto]
, UDM_P.[C�digo de Unidad de Medida] AS 'Codigo de Unidad de Medida Peso'    ,UDM_P.[Nombre de Unidad de Medida] AS 'Nombre de Unidad de Medida Peso'
, UDM_E.[C�digo de Unidad de Medida] AS 'Codigo de Unidad de Medida Estandar', UDM_E.[Nombre de Unidad de Medida] AS 'Nombre de Unidad de Medida Estandar'
, P.[Piezas P Unidad de Venta]
, UDM_M.[C�digo de Unidad de Medida], UDM_M.[Nombre de Unidad de Medida]
, C_ABC.[C�digo de ABC],C_ABC.[Nombre de ABC]
, P.[Empaque Contenido]
, P.[Control de Lote]
, MRCD.[C�digo de Mercado], MRCD.[Nombre de Mercado]   
, P.[Consumo en Lote]
, TPO.[C�digo de Tipo], TPO.[Nombre de Tipo]
, LN.[Clave de L�nea],ln.[Descripci�n de la L�nea]
, P.[Indicador insuficiencia]
, P.[C�digo Saldo Recurso]
, P.[Consumo Te�rico]
, P.[Clase Producto Producci�n]  	
, P.[Recurso Potente]
, P.[Factor de Potencia]
, P.[Fecha Efectividad Inicial]
, P.[Fecha Efectividad Final]
, P.[Factor Merma]
, P.[Justo a Tiempo]
, P.[Peligro BOL]
, P.[L�nea Prod Producci�n]
, I.[Codigo de Categoria Impuesto] as 'Codigo Categor�a de Impuesto',I.[Descripcion del Impuesto] 'Descrpci�n Categoria de Impuesto'
, ST.[C�digo de Status],ST.[Nombre de Status]
, P.Consecutivo
, P.Descripci�n
, SHMT.[C�digo de Sabor], SHMT.[Nombre de Sabor]
, PA_CLV.[C�digo de Planta Armado Clave ME] AS 'C�digo de Planta Armado' , PA_CLV.[Nombre de Planta Armado Clave ME] AS 'Nombre de Planta Armado Clave'				
, P.[Descripci�n del Recurso]
, P.[Contenido Neto]
, PA.[Cantidad Estiba x Hilera]
, PA.[Cantidad Estiba x Unidad]
, PA.[Cantidad de Camas x Tarima]
, PA.[Altura de Estiba]
, PA.[D�as Antig�edad 1]
, PA.[Caja Altura]  	
, PA.[Caja Ancho]
, PA.[Caja Profundidad]
, PA.[Tarima Altura]
, PA.[Tarima Ancho]
, PA.[Tarima Profundidad]
, PA.[Recurso en Planta]
, PA.[Rotaci�n Inventario]
, PA.[Ventana de Env�o Directo]
, PC.[C�digo Nivel Costeo Fijo]
, TACSTO.[C�digo de Tipo Acum Costo],TACSTO.[Nombre de Tipo Acum Costo]
, PC.[Costo Est�ndar]
, PC.[Fecha �ltima Acumulaci�n]
, PC.[C�digo Nivel Costeo]
, CUS.[C�digo de Costo Unitario Seleccionado],CUS.[Nombre de Costo Unitario Seleccionado]
, PC.[Costo �ltima Acumulaci�n]
, PC.[Uso Valor Neto Realiz]
, CNACSTO.[C�digo de Clase Nivel Acum Costo],CNACSTO.[Nombre de Clase Nivel Acum Costo]
, PC.[Nuevo Costeo]
, CACSTO.[C�digo de M�todo Costeo Acum Costo],CACSTO.[Nombre de M�todo Costeo Acum Costo]
, PC.Entidad
, PC.[Tipo MP Prim p Costo]  	
, PC.[Nmb MP Prim p Costo]
, UDM_CMPRS.[C�digo de Unidad de Medida] as 'C�digo de Unidad de Medida Compras',UDM_CMPRS.[Nombre de Unidad de Medida] as 'Nombre de Unidad de Medida Compras'
, PCOMPRAS.[C�d Aprob Proveedor Y N]
, PCOMPRAS.[C�digo Imponible]
, CAT_CMPRS.[C�digo de Categor�a de Compras], CAT_CMPRS.[Nombre de Categor�a de Compras]
, SUBCAT_CMPRS.[C�digo de Subcategor�a de Compras],SUBCAT_CMPRS.[Nombre de Subcategor�a de Compras]
, CAT_NEG.[C�digo de Categor�a de Negociaci�n],CAT_NEG.[Nombre de Categor�a de Negociaci�n]
, PEXT.[Descripci�n Larga del Producto]
, PEXT.[N�mero del Producto]
, PEXT.[N�mero Ficha T�cnica]
, PEXT.[Unidad Empaque]
, T_ENV.[C�digo de Tipo de Envase]AS 'C�digo de Tipo de Envase Primario',T_ENV.[Nombre de Tipo de Envase] 'Nombre de Tipo de Envase Primario'
, CLV_MRCA.[C�digo de Clave de Marca],CLV_MRCA.[Nombre de Clave de Marca]
, CMPNIA_ALF.[C�digo de Compa�ia Alfabetica],CMPNIA_ALF.[Nombre de Compa�ia Alfabetica]
, CMPNIA_GS1.[C�digo de Compa�ia GS1],CMPNIA_GS1.[Nombre de Compa�ia GS1]
, PEXT.[C�digo de Barras GS1 8]
, PEXT.[Consecutivo EAN 13]
, PEXT.[Consecutivo DUN14]
, PEXT.[Consecutivo DUN14T]
, PEXT.[Cambio EAN 13]
, PEXT.[Cambio DUN14]
, PEXT.[Cambio DUN14T]
, CMPNIA_NUM.[C�digo de Compa�ia Num�rica],CMPNIA_NUM.[Nombre de Compa�ia Num�rica]
, PEXT.[Compa��a AMECE]
, PEXT.[Precio de Venta]
, PEXT.[EAN 13] AS EAN13
, PEXT.DUN14
, PEXT.DUN14T
, PEXT.[ID de Origen]
, IMPSTS.[Codigo de Categoria Impuesto],IMPSTS.[Nombre de Impuestos]
, COMEN.[C�digo de Comentarios CB],COMEN.[Nombre de Comentarios CB]
, PEXT.[Componentes de la OF Pack]
, TDALMAC.[C�digo de Tipo de Almacenaje],TDALMAC.[Nombre de Tipo de Almacenaje]
, PDO.[C�digo de Politica de Orden],PDO.[Nombre de Politica de Orden]
, CDO.[C�digo de Origen]as 'C�digo de Origen M P',CDO.[Nombre de Origen] AS 'Nombre de Origen M P'
, PPLAN.[N�mero de Planificador]
, PPLAN.[Cantidad Orden Prog Fijo]
, PPLAN.[Indicador Nueva Planif]
, PPLAN.[Ctn Orden Progr Min]
, PPLAN.[Inventario de Seguridad]
, COD_PMP.[C�digo de PMP],COD_PMP.[Nombre de PMP]
, PPLAN.[Ctn Orden Progr M�x]
, TMP_PLAN.[C�digo de Tipo MP Planificaci�n],TMP_PLAN.[Nombre de Tipo MP Planificaci�n]
, PPLAN.[Nombre MP Planif Prima]
, PPLAN.[Ctn Orden Progr Mul]
, PPLAN.[C�d Nivel Planif Fijo]
, PPLAN.[C�d Nivel Planificaci�n]
, PPLAN.[C�digo Plazo Corto]
, PPLAN.[C�digo Plazo Largo]
, PPLAN.[Calc de Nvo Tiempo Espera]
, PPLAN.[C�digo Plazo Intermedio]
, PPLAN.[C�digo de Identificaci�n]
, PPLAN.[D�as de Abastecimiento]
, FH.[C�digo de Formato Helados],FH.[Nombre de Formato Helados]
, C_H.[C�digo de CAT Helados],C_H.[Nombre de CAT Helados]
, C_P_H.[C�digo de Presentaci�n Helados],C_P_H.[Nombre de Presentaci�n Helados]
, PH.DSD
, PCDB.[Peso Neto EAN 13]
, PCDB.[Peso Bruto EAN 13]
, UDM_EAN13_PESO.[C�digo de Unidad de Medida] AS 'C�digo de Unidad de Medida Peso EAN13',UDM_EAN13_PESO.[Nombre de Unidad de Medida] as 'Nombre de Unidad de Medida Peso EAN13'
, UDM_EAN13_STD.[C�digo de Unidad de Medida] 'C�digo de Unidad de Medida Estandar EAN13',UDM_EAN13_STD.[Nombre de Unidad de Medida]  as 'Nombre de Unidad de Medida Estandar EAN13'
, UDM_EAN13_DIM.[C�digo de Unidad de Medida] AS 'C�digo de Unidad de Medida Dimension EAN13', UDM_EAN13_DIM.[Nombre de Unidad de Medida] as 'Nombre de Unidad de Medida Dimension EAN13'
, PCDB.[EAN 13] Codigo_de_Barras
, PCDB.[Vol�men Exterior EAN 13]
, PCDB.[Dimensi�n Interior Alto EAN 13]
, PCDB.[Dimensi�n Ext Alto EAN 13]
, PCDB.[Dimensi�n Interior Ancho EAN 13]
, PCDB.[Dimensi�n Ext Ancho EAN 13]
, PCDB.[Dimensi�n Interior Profundo EAN 13]
, PCDB.[Dimensi�n Ext Profundo EAN 13]
, UDM_DUN14_PESO.[C�digo de Unidad de Medida] AS 'C�digo de Unidad de Medida Peso DUN14',UDM_DUN14_PESO.[Nombre de Unidad de Medida] as 'Nombre de Unidad de Medida Peso DUN14'
, UDM_DUN14_STD.[C�digo de Unidad de Medida] 'C�digo de Unidad de Medida Estandar DUN14',UDM_DUN14_STD.[Nombre de Unidad de Medida]  as 'Nombre de Unidad de Medida Estandar DUN14'
, UDM_DUN14_DIM.[C�digo de Unidad de Medida] AS 'C�digo de Unidad de Medida Dimension DUN14', UDM_DUN14_DIM.[Nombre de Unidad de Medida] as 'Nombre de Unidad de Medida Dimension DUN14'
, PCDB.[Peso Neto DUN14]
, PCDB.[Peso Bruto DUN14]
, PCDB.[Vol�men Exterior DUN14]
, PCDB.[Dimensi�n Interior Alto DUN14]
, PCDB.[Dimensi�n Ext Alto DUN14]
, PCDB.[Dimensi�n Interior Ancho DUN14]
, PCDB.[Dimensi�n Ext Ancho DUN14]
, PCDB.[Dimensi�n Interior Profundo DUN14]
, PCDB.[Dimensi�n Ext Profundo DUN14]
, UDM_DUN14T_PESO.[C�digo de Unidad de Medida] AS 'C�digo de Unidad de Medida Peso DUN14T',UDM_DUN14T_PESO.[Nombre de Unidad de Medida] as 'Nombre de Unidad de Medida Peso DUN14T'
, UDM_DUN14T_STD.[C�digo de Unidad de Medida] 'C�digo de Unidad de Medida Estandar DUN14T',UDM_DUN14T_STD.[Nombre de Unidad de Medida]  as 'Nombre de Unidad de Medida Estandar DUN14T'
, UDM_DUN14T_DIM.[C�digo de Unidad de Medida] AS 'C�digo de Unidad de Medida Dimension DUN14T', UDM_DUN14T_DIM.[Nombre de Unidad de Medida] as 'Nombre de Unidad de Medida Dimension DUN14T'
, PCDB.[Peso Neto DUN14T]						
, PCDB.[Peso Bruto DUN14T]
, PCDB.[Vol�men Exterior DUN14T]						
, PCDB.[Dimensi�n Interior Alto DUN14T]
, PCDB.[Dimensi�n Ext Alto DUN14T]
, PCDB.[Dimensi�n Interior Ancho DUN14T]
, PCDB.[Dimensi�n Ext Ancho DUN14T]
, PCDB.[Dimensi�n Interior Profundo DUN14T]						
, PCDB.[Dimensi�n Ext Profundo DUN14T]
, PDLD.[Tipo Producto Demantra] 
, POSN.[Clave Tipo_Name]

FROM  			    HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Productos AS P 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Productos_Almacenes AS PA ON PA.[Codigo de Producto_ID] = P.ID 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vWMDM_Productos_Costos AS PC ON PC.[Codigo de Producto_ID] = P.ID AND PC.Entidad = 'ALMACENES' 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ProductosAseguramientoCalidad AS PAC ON PAC.[Codigo de Producto_ID] = P.ID 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ProductosCampos_Adicionales AS PCA ON PCA.[Codigo de Producto_ID] = P.ID 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ProductosCompras AS PCOMPRAS ON PCOMPRAS.[Codigo de Producto_ID] = P.ID 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ProductosExtendido AS PEXT ON PEXT.[Codigo de Producto_ID] = P.ID 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ProductosPlaneacion AS PPLAN ON PPLAN.[Codigo de Producto_ID] = P.ID 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ModeloProductosHelados AS PH ON PH.[Codigo de Producto_ID] = P.ID 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Productos_Codigo_de_Barras AS PCDB ON PCDB.[Codigo de Producto_ID] = P.ID 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PlandeDemanda AS PDLD ON PDLD.[Codigo de Producto_ID] = P.ID 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Sabor_Helados AS SHMT ON PH.Sabor_ID = SHMT.ID 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Origen O on  O.ID=P.Origen_ID
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_TipoDeProducto  TDP ON TDP.ID=P.[Tipo de Producto_ID] 
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_MarcaPDescripci�n M on M.ID=P.[Marca P Descripci�n_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Clase C on C.ID=P.Clase_ID
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vmMDM_PD_Tipo_De_Envase TE ON TE.ID=P.[Tipo de Envase_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_SubClase SC ON SC.ID=P.[Sub Clase_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_P ON UDM_P.ID=P.[Unidad de Medida de Peso_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_E ON UDM_E.ID=P.[Unidad de Medida Est�ndar_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_M ON UDM_M.ID=P.[Unidad de Medida P Descripci�n_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_C�digoABC  AS C_ABC ON C_ABC.ID=P.[C�digo ABC_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PD_Mercado AS MRCD ON MRCD.ID=P.Mercado_ID
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Tipo AS TPO ON TPO.ID=P.Tipo_ID
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Linea LN on LN.ID=p.Linea_ID
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Impuestos  I on I.ID=P.[Cat�goria de Impuesto_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Miscelaneos1 ST  on ST.ID=P.Status_ID
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PlantaArmadoClaveMe PA_CLV on PA_CLV.ID=P.[Planta Armado Clave_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Tipo_Acum_Costo TACSTO				   ON TACSTO.ID      = PC.[C�digo Tipo Acum Costo_ID] 
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Costo_Unitario_Seleccionado CUS ON CUS.ID=PC.[Costo Unitario Seleccionado_ID] AND PC.Entidad='ALMACENES'
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Clase_Nivel_Acum_Costo CNACSTO ON CNACSTO.ID=PC.[C�d Clase Nivel Acum Cost_ID] AND PC.Entidad='ALMACENES'
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Metodo_Costeo_Acum_Costo CACSTO ON CACSTO.ID=PC.[M�t Costeo Acum Costo_ID] AND PC.Entidad='ALMACENES'
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_CMPRS ON UDM_CMPRS.ID = PCOMPRAS.[UM Compras_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.viw_SYSTEM_21_1280_CHILDATTRIBUTES CAT_CMPRS on CAT_CMPRS.ID= PCOMPRAS.[Categor�a de Compras_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.viw_SYSTEM_21_1338_CHILDATTRIBUTES SUBCAT_CMPRS ON SUBCAT_CMPRS.ID=PCOMPRAS.[Subcategor�a de Compras_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_CategoriaDeNegociacion CAT_NEG  on CAT_NEG.ID=PCOMPRAS.[Categor�a de Negociaci�n_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_TipoDeEnvase T_ENV ON T_ENV.ID=PEXT.[Tipo Empaque Primario_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ClaveDeMarca CLV_MRCA ON CLV_MRCA.ID = PEXT.[Clave de Marca_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_CompaniaAlfabetica CMPNIA_ALF ON CMPNIA_ALF.ID=PEXT.[Clave Compa��a Alfanum_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PD_CompaniasGS1 CMPNIA_GS1 on CMPNIA_GS1.ID = PEXT.[Compa��a GS1_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PD_CompaniasNumerica CMPNIA_NUM ON CMPNIA_NUM.ID= PEXT.[N�mero de Compa��a_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Impuestos IMPSTS ON IMPSTS.ID=PEXT.[Categor�a de Impuestos_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PD_ComentariosCB COMEN ON COMEN.ID=PEXT.Comentarios_ID
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vmMDM_Tipo_De_Almacenaje TDALMAC on TDALMAC.ID=PEXT.[Tipo de Almacenaje_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PoliticaDeOrden PDO ON PDO.ID= PPLAN.[C�d Pol�tica Orden Programa_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_C�digoDeOrigen CDO ON CDO.ID=PPLAN.[C�digo Origen M P_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_CodigoPMP COD_PMP ON  COD_PMP.ID=PPLAN.[C�digo PMP_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_TipoMPPlanificacion TMP_PLAN ON TMP_PLAN.ID=PPLAN.[Tipo MP Planificaci�n Prima_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Formato_Helados FH on FH.ID=PH.[Codigo de Producto_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PD_CATHelados C_H ON C_H.ID= PH.CAT_ID
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Presentacion_Helados C_P_H on C_P_H.ID =PH.Presentaci�n_ID
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_EAN13_PESO ON  UDM_EAN13_PESO.ID = PCDB.[Unidad Medida Peso EAN 13_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_EAN13_STD ON  UDM_EAN13_STD.ID = PCDB.[Unidad Medida Est�ndar EAN 13_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_EAN13_DIM ON  UDM_EAN13_DIM.ID = PCDB.[Unidad Medida Dimensi�n EAN 13_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_DUN14_PESO ON  UDM_DUN14_PESO.ID = PCDB.[Unidad Medida Peso DUN14_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_DUN14_STD ON  UDM_DUN14_STD.ID = PCDB.[Unidad Medida Est�ndar DUN14_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_DUN14_DIM ON  UDM_DUN14_DIM.ID = PCDB.[Unidad Medida Dimensi�n DUN14_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_DUN14T_PESO ON  UDM_DUN14T_PESO.ID = PCDB.[Unidad Medida Peso DUN14T_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_DUN14T_STD ON  UDM_DUN14T_STD.ID = PCDB.[Unidad Medida Est�ndar DUN14T_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_DUN14T_DIM ON  UDM_DUN14T_DIM.ID = PCDB.[Unidad Medida Dimensi�n DUN14T_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PosNutrisa POSN ON  POSN.[C�digo de Producto_ID] = P.ID 
)
-- LINEA
SELECT 
   cast(p.[N�mero de Recurso] as varchar(15)) as KxRecurso_MDM

,  cast(p.[Clave de L�nea] as varchar(3)) as ValorID_MDM 
,  p.[Descripci�n de la L�nea] Descripcion_MDM	

,  SUBSTRING(p_dwh.RecursoLinea,1,3) as ValorID_DWH
,  SUBSTRING (p_dwh.RecursoLinea,5,100) Descripcion_DWH

, C4_LI.RMMKPL AS ValorID_AS400
, C4_LI_DESC.NOMBRELINEA AS Descripcion_AS400
, 'LINEA' as KxTipoDiferencia
, 2 AS Prioridad
from allProducts p
inner join  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[N�mero de Recurso]=p_dwh.ID_Recurso
inner join [MDMHERDEZCI]..DIM_PRODUCTOS_FROM_AS400_23052018 C4_LI on p.[N�mero de Recurso]=C4_LI.RMRESC
INNER JOIN (SELECT * FROM OPENQUERY(HDZ54,'SELECT  * FROM HDZMEN.MLINF ')) C4_LI_DESC ON C4_LI.RMMKPL=C4_LI_DESC.NUMEROLINEA
where  1=1
AND (
		 (
		           p.[Clave de L�nea]<>cast(substring(p_dwh.RecursoLinea,1,3) as int) 
				OR cast(substring(p_dwh.RecursoLinea,1,3) as int) <>C4_LI_DESC.NUMEROLINEA
	     )
		OR  (    
				  RTRIM(LTRIM(p.[Descripci�n de la L�nea]))<> RTRIM(LTRIM(SUBSTRING (p_dwh.RecursoLinea,5,100))) 
			   OR RTRIM(LTRIM(SUBSTRING (p_dwh.RecursoLinea,5,100)))<>RTRIM(LTRIM(C4_LI_DESC.NOMBRELINEA)))
	)


UNION ALL
-- MARCA
SELECT 
  CAST( p.[N�mero de Recurso] AS VARCHAR(15)) as KxRecurso_MDM
,  p.[C�digo de Clave de Marca] as ValorID_MDM
,  p.[Nombre de Clave de Marca]  Descripcion_MDM	
,  p_dwh.ID_RecursoMarca as ValorID_DWH
,  SUBSTRING(p_dwh.RecursoMarca,3,100) Descripcion_DWH
, 'MARCA' as KxTipoDiferencia
, 1 AS Prioridad
from allProducts p
inner join  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[N�mero de Recurso]=p_dwh.ID_Recurso
where  1=1
and  (p_dwh.ID_RecursoMarca <> p.[C�digo de Clave de Marca])
OR p.[Nombre de Clave de Marca]<> SUBSTRING(p_dwh.RecursoMarca,3,100)

-- RECURSO_C
union all
SELECT 
  CAST( p.[N�mero de Recurso] AS VARCHAR(15)) as KxRecurso_MDM
,  '' as ValorID_MDM
,  ltrim(rtrim(p.[Descripci�n del Recurso]))  Descripcion_MDM
	
,  '' as ValorID_DWH
,  ltrim(rtrim(p_dwh.Recurso_C)) Descripcion_DWH
, 'Recurso_C' as KxTipoDiferencia
, 3 AS Prioridad
from allProducts p
inner join  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[N�mero de Recurso]=p_dwh.ID_Recurso
where  1=1
and  (ltrim(rtrim(p_dwh.Recurso_C)) <> ltrim(rtrim(p.[Descripci�n del Recurso])))

-- COMPA�IA ALFANUMERICA
union all
SELECT 
  CAST( p.[N�mero de Recurso] AS VARCHAR(15)) as KxRecurso_MDM
,  p.[C�digo de Compa�ia Alfabetica] as ValorID_MDM
,  ltrim(rtrim(p.[Nombre de Compa�ia Alfabetica]))  Descripcion_MDM
	
,  p_dwh.ID_RecursoCompania as ValorID_DWH
,  ltrim(rtrim(substring(p_dwh.RecursoCompania,3,100))) Descripcion_DWH

, 'COMPA�IA ALFANUMERICA' as KxTipoDiferencia
, 4 AS Prioridad
from allProducts p
inner join  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[N�mero de Recurso]=p_dwh.ID_Recurso
where  1=1
and  (ltrim(rtrim(p_dwh.ID_RecursoCompania)) <> ltrim(rtrim(p.[C�digo de Compa�ia Alfabetica])))
or ltrim(rtrim(p.[Nombre de Compa�ia Alfabetica])) <>ltrim(rtrim(substring(p_dwh.RecursoCompania,3,100)))

-- COMPA�IA CONTABLE
union all
SELECT 
  CAST(p.[N�mero de Recurso] AS VARCHAR(15)) as KxRecurso_MDM

,  CAST(p.[C�digo de Compa�ia Num�rica] AS VARCHAR(3)) as ValorID_MDM
,  ltrim(rtrim(p.[Nombre de Compa�ia Num�rica]))  Descripcion_MDM
	
,  CAST(p_dwh.ID_RecursoCompaniaContable as varchar(3)) as ValorID_DWH
,  ltrim(rtrim(substring(p_dwh.RecursoCompaniaContable,5,200))) Descripcion_DWH

, 'COMPA�IA CONTABLE' as KxTipoDiferencia
, 5 AS Prioridad
from allProducts p
inner join  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[N�mero de Recurso]=p_dwh.ID_Recurso
where  1=1
and p.[C�digo de Compa�ia Num�rica] <> p_dwh.ID_RecursoCompaniaContable
or ltrim(rtrim(p.[Nombre de Compa�ia Num�rica])) <>ltrim(rtrim(substring(p_dwh.RecursoCompaniaContable,5,200)))


-- RECURSO AGRUPACION
union all


SELECT 
  CAST(p.[N�mero de Recurso] AS VARCHAR(15)) as KxRecurso_MDM

,  '' as ValorID_MDM
,  ltrim(rtrim([Clave Tipo_Name]))  Descripcion_MDM
	
,  '' as ValorID_DWH
,  ltrim(rtrim(p_dwh.RecursoAgrupacion)) Descripcion_DWH

, 'RECURSO AGRUPACION NUTRISA' as KxTipoDiferencia
, 6 AS Prioridad
from allProducts p
inner join  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[N�mero de Recurso]=p_dwh.ID_Recurso
where  1=1
AND  ltrim(rtrim(p.[Clave Tipo_Name])) <>ltrim(rtrim(p_dwh.RecursoAgrupacion))

-- CODIGO DE BARRAS
union all
SELECT 
  CAST(p.[N�mero de Recurso] AS VARCHAR(15)) as KxRecurso_MDM

,   cast(CAST(CASE WHEN LEN(p.[EAN13])>0 THEN  REPLACE(ISNULL(LTRIM(RTRIM(p.[EAN13])),0),'',0) ELSE '0'END AS DECIMAL(20,0)) as varchar(20)) as ValorID_MDM
,  ''  Descripcion_MDM

,  ltrim(rtrim(p_dwh.RecursoCodigoBarras)) as ValorID_DWH
,  '' Descripcion_DWH

, 'CODIGO DE BARRAS' as KxTipoDiferencia
, 7 AS Prioridad
from allProducts p
inner join  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[N�mero de Recurso]=p_dwh.ID_Recurso
where  1=1
AND   CAST(CASE WHEN LEN(p.[EAN13])>0 THEN  REPLACE(ISNULL(LTRIM(RTRIM(p.[EAN13])),0),'',0) ELSE '0'END AS DECIMAL(20,0))
		<> cast(ltrim(rtrim(p_dwh.RecursoCodigoBarras)) as decimal(20,0))

-- CLASE
union all
SELECT 
  CAST(p.[N�mero de Recurso] AS VARCHAR(15)) as KxRecurso_MDM

,   LTRIM(RTRIM(p.[Codigo de Clase])) as ValorID_MDM
,  ''  Descripcion_MDM

,  LTRIM(RTRIM(p_dwh.RecursoFuenteClase)) as ValorID_DWH
,  '' Descripcion_DWH

, 'CLASE DEL RECURSO' as KxTipoDiferencia
, 8 AS Prioridad
from allProducts p
LEFT JOIN  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[N�mero de Recurso]=p_dwh.ID_Recurso
where  1=1
AND        LTRIM(RTRIM(p.[Codigo de Clase]))<> LTRIM(RTRIM(p_dwh.RecursoFuenteClase))
ORDER BY 7 ASC


/*


*/


/*
CATALOGOS AS400
SELECT *
FROM [MDMHERDEZCI]..DIM_PRODUCTOS_FROM_AS400_23052018 C4_LI

-- CATALOGO LINEA
SELECT * FROM OPENQUERY(HDZ54,'SELECT  * FROM HDZMEN.MLINF ')
-- CATALOGO MARCA

+/




SELECT * FROM OPENQUERY(HDZ54,'SELECT  * FROM  HDZALM.RESMSA ')

