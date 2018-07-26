USE MDMHERDEZCI
GO
WITH allProducts 
AS 
(
SELECT    
P.ID
, P.[Número de Recurso]
, P.[Descripción Hérdez]
, TDP.[Código de Tipo de Producto],  TDP.[Nombre de Tipo de Producto]
, O.[Código de Origen] 
, O.[Nombre de Origen]
, M.[Código de Marca Armado Clave ME], M.[Nombre de Marca Armado Clave ME]
, C.[Codigo de Clase],C.Descripción as 'Nombre de Clase'
, P.[Peso Bruto]  	
, TE.[Código de Tipo de Envase],TE.[Nombre de Tipo de Envase]
, SC.[Clave de Subclase],SC.[Descripción Subclase]
, P.[Peso Neto]
, UDM_P.[Código de Unidad de Medida] AS 'Codigo de Unidad de Medida Peso'    ,UDM_P.[Nombre de Unidad de Medida] AS 'Nombre de Unidad de Medida Peso'
, UDM_E.[Código de Unidad de Medida] AS 'Codigo de Unidad de Medida Estandar', UDM_E.[Nombre de Unidad de Medida] AS 'Nombre de Unidad de Medida Estandar'
, P.[Piezas P Unidad de Venta]
, UDM_M.[Código de Unidad de Medida], UDM_M.[Nombre de Unidad de Medida]
, C_ABC.[Código de ABC],C_ABC.[Nombre de ABC]
, P.[Empaque Contenido]
, P.[Control de Lote]
, MRCD.[Código de Mercado], MRCD.[Nombre de Mercado]   
, P.[Consumo en Lote]
, TPO.[Código de Tipo], TPO.[Nombre de Tipo]
, LN.[Clave de Línea],ln.[Descripción de la Línea]
, P.[Indicador insuficiencia]
, P.[Código Saldo Recurso]
, P.[Consumo Teórico]
, P.[Clase Producto Producción]  	
, P.[Recurso Potente]
, P.[Factor de Potencia]
, P.[Fecha Efectividad Inicial]
, P.[Fecha Efectividad Final]
, P.[Factor Merma]
, P.[Justo a Tiempo]
, P.[Peligro BOL]
, P.[Línea Prod Producción]
, I.[Codigo de Categoria Impuesto] as 'Codigo Categoría de Impuesto',I.[Descripcion del Impuesto] 'Descrpción Categoria de Impuesto'
, ST.[Código de Status],ST.[Nombre de Status]
, P.Consecutivo
, P.Descripción
, SHMT.[Código de Sabor], SHMT.[Nombre de Sabor]
, PA_CLV.[Código de Planta Armado Clave ME] AS 'Código de Planta Armado' , PA_CLV.[Nombre de Planta Armado Clave ME] AS 'Nombre de Planta Armado Clave'				
, P.[Descripción del Recurso]
, P.[Contenido Neto]
, PA.[Cantidad Estiba x Hilera]
, PA.[Cantidad Estiba x Unidad]
, PA.[Cantidad de Camas x Tarima]
, PA.[Altura de Estiba]
, PA.[Días Antigüedad 1]
, PA.[Caja Altura]  	
, PA.[Caja Ancho]
, PA.[Caja Profundidad]
, PA.[Tarima Altura]
, PA.[Tarima Ancho]
, PA.[Tarima Profundidad]
, PA.[Recurso en Planta]
, PA.[Rotación Inventario]
, PA.[Ventana de Envío Directo]
, PC.[Código Nivel Costeo Fijo]
, TACSTO.[Código de Tipo Acum Costo],TACSTO.[Nombre de Tipo Acum Costo]
, PC.[Costo Estándar]
, PC.[Fecha Última Acumulación]
, PC.[Código Nivel Costeo]
, CUS.[Código de Costo Unitario Seleccionado],CUS.[Nombre de Costo Unitario Seleccionado]
, PC.[Costo Última Acumulación]
, PC.[Uso Valor Neto Realiz]
, CNACSTO.[Código de Clase Nivel Acum Costo],CNACSTO.[Nombre de Clase Nivel Acum Costo]
, PC.[Nuevo Costeo]
, CACSTO.[Código de Método Costeo Acum Costo],CACSTO.[Nombre de Método Costeo Acum Costo]
, PC.Entidad
, PC.[Tipo MP Prim p Costo]  	
, PC.[Nmb MP Prim p Costo]
, UDM_CMPRS.[Código de Unidad de Medida] as 'Código de Unidad de Medida Compras',UDM_CMPRS.[Nombre de Unidad de Medida] as 'Nombre de Unidad de Medida Compras'
, PCOMPRAS.[Cód Aprob Proveedor Y N]
, PCOMPRAS.[Código Imponible]
, CAT_CMPRS.[Código de Categoría de Compras], CAT_CMPRS.[Nombre de Categoría de Compras]
, SUBCAT_CMPRS.[Código de Subcategoría de Compras],SUBCAT_CMPRS.[Nombre de Subcategoría de Compras]
, CAT_NEG.[Código de Categoría de Negociación],CAT_NEG.[Nombre de Categoría de Negociación]
, PEXT.[Descripción Larga del Producto]
, PEXT.[Número del Producto]
, PEXT.[Número Ficha Técnica]
, PEXT.[Unidad Empaque]
, T_ENV.[Código de Tipo de Envase]AS 'Código de Tipo de Envase Primario',T_ENV.[Nombre de Tipo de Envase] 'Nombre de Tipo de Envase Primario'
, CLV_MRCA.[Código de Clave de Marca],CLV_MRCA.[Nombre de Clave de Marca]
, CMPNIA_ALF.[Código de Compañia Alfabetica],CMPNIA_ALF.[Nombre de Compañia Alfabetica]
, CMPNIA_GS1.[Código de Compañia GS1],CMPNIA_GS1.[Nombre de Compañia GS1]
, PEXT.[Código de Barras GS1 8]
, PEXT.[Consecutivo EAN 13]
, PEXT.[Consecutivo DUN14]
, PEXT.[Consecutivo DUN14T]
, PEXT.[Cambio EAN 13]
, PEXT.[Cambio DUN14]
, PEXT.[Cambio DUN14T]
, CMPNIA_NUM.[Código de Compañia Numérica],CMPNIA_NUM.[Nombre de Compañia Numérica]
, PEXT.[Compañía AMECE]
, PEXT.[Precio de Venta]
, PEXT.[EAN 13] AS EAN13
, PEXT.DUN14
, PEXT.DUN14T
, PEXT.[ID de Origen]
, IMPSTS.[Codigo de Categoria Impuesto],IMPSTS.[Nombre de Impuestos]
, COMEN.[Código de Comentarios CB],COMEN.[Nombre de Comentarios CB]
, PEXT.[Componentes de la OF Pack]
, TDALMAC.[Código de Tipo de Almacenaje],TDALMAC.[Nombre de Tipo de Almacenaje]
, PDO.[Código de Politica de Orden],PDO.[Nombre de Politica de Orden]
, CDO.[Código de Origen]as 'Código de Origen M P',CDO.[Nombre de Origen] AS 'Nombre de Origen M P'
, PPLAN.[Número de Planificador]
, PPLAN.[Cantidad Orden Prog Fijo]
, PPLAN.[Indicador Nueva Planif]
, PPLAN.[Ctn Orden Progr Min]
, PPLAN.[Inventario de Seguridad]
, COD_PMP.[Código de PMP],COD_PMP.[Nombre de PMP]
, PPLAN.[Ctn Orden Progr Máx]
, TMP_PLAN.[Código de Tipo MP Planificación],TMP_PLAN.[Nombre de Tipo MP Planificación]
, PPLAN.[Nombre MP Planif Prima]
, PPLAN.[Ctn Orden Progr Mul]
, PPLAN.[Cód Nivel Planif Fijo]
, PPLAN.[Cód Nivel Planificación]
, PPLAN.[Código Plazo Corto]
, PPLAN.[Código Plazo Largo]
, PPLAN.[Calc de Nvo Tiempo Espera]
, PPLAN.[Código Plazo Intermedio]
, PPLAN.[Código de Identificación]
, PPLAN.[Días de Abastecimiento]
, FH.[Código de Formato Helados],FH.[Nombre de Formato Helados]
, C_H.[Código de CAT Helados],C_H.[Nombre de CAT Helados]
, C_P_H.[Código de Presentación Helados],C_P_H.[Nombre de Presentación Helados]
, PH.DSD
, PCDB.[Peso Neto EAN 13]
, PCDB.[Peso Bruto EAN 13]
, UDM_EAN13_PESO.[Código de Unidad de Medida] AS 'Código de Unidad de Medida Peso EAN13',UDM_EAN13_PESO.[Nombre de Unidad de Medida] as 'Nombre de Unidad de Medida Peso EAN13'
, UDM_EAN13_STD.[Código de Unidad de Medida] 'Código de Unidad de Medida Estandar EAN13',UDM_EAN13_STD.[Nombre de Unidad de Medida]  as 'Nombre de Unidad de Medida Estandar EAN13'
, UDM_EAN13_DIM.[Código de Unidad de Medida] AS 'Código de Unidad de Medida Dimension EAN13', UDM_EAN13_DIM.[Nombre de Unidad de Medida] as 'Nombre de Unidad de Medida Dimension EAN13'
, PCDB.[EAN 13] Codigo_de_Barras
, PCDB.[Volúmen Exterior EAN 13]
, PCDB.[Dimensión Interior Alto EAN 13]
, PCDB.[Dimensión Ext Alto EAN 13]
, PCDB.[Dimensión Interior Ancho EAN 13]
, PCDB.[Dimensión Ext Ancho EAN 13]
, PCDB.[Dimensión Interior Profundo EAN 13]
, PCDB.[Dimensión Ext Profundo EAN 13]
, UDM_DUN14_PESO.[Código de Unidad de Medida] AS 'Código de Unidad de Medida Peso DUN14',UDM_DUN14_PESO.[Nombre de Unidad de Medida] as 'Nombre de Unidad de Medida Peso DUN14'
, UDM_DUN14_STD.[Código de Unidad de Medida] 'Código de Unidad de Medida Estandar DUN14',UDM_DUN14_STD.[Nombre de Unidad de Medida]  as 'Nombre de Unidad de Medida Estandar DUN14'
, UDM_DUN14_DIM.[Código de Unidad de Medida] AS 'Código de Unidad de Medida Dimension DUN14', UDM_DUN14_DIM.[Nombre de Unidad de Medida] as 'Nombre de Unidad de Medida Dimension DUN14'
, PCDB.[Peso Neto DUN14]
, PCDB.[Peso Bruto DUN14]
, PCDB.[Volúmen Exterior DUN14]
, PCDB.[Dimensión Interior Alto DUN14]
, PCDB.[Dimensión Ext Alto DUN14]
, PCDB.[Dimensión Interior Ancho DUN14]
, PCDB.[Dimensión Ext Ancho DUN14]
, PCDB.[Dimensión Interior Profundo DUN14]
, PCDB.[Dimensión Ext Profundo DUN14]
, UDM_DUN14T_PESO.[Código de Unidad de Medida] AS 'Código de Unidad de Medida Peso DUN14T',UDM_DUN14T_PESO.[Nombre de Unidad de Medida] as 'Nombre de Unidad de Medida Peso DUN14T'
, UDM_DUN14T_STD.[Código de Unidad de Medida] 'Código de Unidad de Medida Estandar DUN14T',UDM_DUN14T_STD.[Nombre de Unidad de Medida]  as 'Nombre de Unidad de Medida Estandar DUN14T'
, UDM_DUN14T_DIM.[Código de Unidad de Medida] AS 'Código de Unidad de Medida Dimension DUN14T', UDM_DUN14T_DIM.[Nombre de Unidad de Medida] as 'Nombre de Unidad de Medida Dimension DUN14T'
, PCDB.[Peso Neto DUN14T]						
, PCDB.[Peso Bruto DUN14T]
, PCDB.[Volúmen Exterior DUN14T]						
, PCDB.[Dimensión Interior Alto DUN14T]
, PCDB.[Dimensión Ext Alto DUN14T]
, PCDB.[Dimensión Interior Ancho DUN14T]
, PCDB.[Dimensión Ext Ancho DUN14T]
, PCDB.[Dimensión Interior Profundo DUN14T]						
, PCDB.[Dimensión Ext Profundo DUN14T]
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
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_MarcaPDescripción M on M.ID=P.[Marca P Descripción_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Clase C on C.ID=P.Clase_ID
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vmMDM_PD_Tipo_De_Envase TE ON TE.ID=P.[Tipo de Envase_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_SubClase SC ON SC.ID=P.[Sub Clase_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_P ON UDM_P.ID=P.[Unidad de Medida de Peso_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_E ON UDM_E.ID=P.[Unidad de Medida Estándar_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_M ON UDM_M.ID=P.[Unidad de Medida P Descripción_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_CódigoABC  AS C_ABC ON C_ABC.ID=P.[Código ABC_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PD_Mercado AS MRCD ON MRCD.ID=P.Mercado_ID
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Tipo AS TPO ON TPO.ID=P.Tipo_ID
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Linea LN on LN.ID=p.Linea_ID
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Impuestos  I on I.ID=P.[Catégoria de Impuesto_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Miscelaneos1 ST  on ST.ID=P.Status_ID
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PlantaArmadoClaveMe PA_CLV on PA_CLV.ID=P.[Planta Armado Clave_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Tipo_Acum_Costo TACSTO				   ON TACSTO.ID      = PC.[Código Tipo Acum Costo_ID] 
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Costo_Unitario_Seleccionado CUS ON CUS.ID=PC.[Costo Unitario Seleccionado_ID] AND PC.Entidad='ALMACENES'
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Clase_Nivel_Acum_Costo CNACSTO ON CNACSTO.ID=PC.[Cód Clase Nivel Acum Cost_ID] AND PC.Entidad='ALMACENES'
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Metodo_Costeo_Acum_Costo CACSTO ON CACSTO.ID=PC.[Mét Costeo Acum Costo_ID] AND PC.Entidad='ALMACENES'
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_CMPRS ON UDM_CMPRS.ID = PCOMPRAS.[UM Compras_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.viw_SYSTEM_21_1280_CHILDATTRIBUTES CAT_CMPRS on CAT_CMPRS.ID= PCOMPRAS.[Categoría de Compras_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.viw_SYSTEM_21_1338_CHILDATTRIBUTES SUBCAT_CMPRS ON SUBCAT_CMPRS.ID=PCOMPRAS.[Subcategoría de Compras_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_CategoriaDeNegociacion CAT_NEG  on CAT_NEG.ID=PCOMPRAS.[Categoría de Negociación_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_TipoDeEnvase T_ENV ON T_ENV.ID=PEXT.[Tipo Empaque Primario_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ClaveDeMarca CLV_MRCA ON CLV_MRCA.ID = PEXT.[Clave de Marca_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_CompaniaAlfabetica CMPNIA_ALF ON CMPNIA_ALF.ID=PEXT.[Clave Compañía Alfanum_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PD_CompaniasGS1 CMPNIA_GS1 on CMPNIA_GS1.ID = PEXT.[Compañía GS1_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PD_CompaniasNumerica CMPNIA_NUM ON CMPNIA_NUM.ID= PEXT.[Número de Compañía_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Impuestos IMPSTS ON IMPSTS.ID=PEXT.[Categoría de Impuestos_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PD_ComentariosCB COMEN ON COMEN.ID=PEXT.Comentarios_ID
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vmMDM_Tipo_De_Almacenaje TDALMAC on TDALMAC.ID=PEXT.[Tipo de Almacenaje_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PoliticaDeOrden PDO ON PDO.ID= PPLAN.[Cód Política Orden Programa_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_CódigoDeOrigen CDO ON CDO.ID=PPLAN.[Código Origen M P_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_CodigoPMP COD_PMP ON  COD_PMP.ID=PPLAN.[Código PMP_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_TipoMPPlanificacion TMP_PLAN ON TMP_PLAN.ID=PPLAN.[Tipo MP Planificación Prima_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Formato_Helados FH on FH.ID=PH.[Codigo de Producto_ID]
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PD_CATHelados C_H ON C_H.ID= PH.CAT_ID
LEFT OUTER JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Presentacion_Helados C_P_H on C_P_H.ID =PH.Presentación_ID
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_EAN13_PESO ON  UDM_EAN13_PESO.ID = PCDB.[Unidad Medida Peso EAN 13_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_EAN13_STD ON  UDM_EAN13_STD.ID = PCDB.[Unidad Medida Estándar EAN 13_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_EAN13_DIM ON  UDM_EAN13_DIM.ID = PCDB.[Unidad Medida Dimensión EAN 13_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_DUN14_PESO ON  UDM_DUN14_PESO.ID = PCDB.[Unidad Medida Peso DUN14_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_DUN14_STD ON  UDM_DUN14_STD.ID = PCDB.[Unidad Medida Estándar DUN14_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_DUN14_DIM ON  UDM_DUN14_DIM.ID = PCDB.[Unidad Medida Dimensión DUN14_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_DUN14T_PESO ON  UDM_DUN14T_PESO.ID = PCDB.[Unidad Medida Peso DUN14T_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_DUN14T_STD ON  UDM_DUN14T_STD.ID = PCDB.[Unidad Medida Estándar DUN14T_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UDM_DUN14T_DIM ON  UDM_DUN14T_DIM.ID = PCDB.[Unidad Medida Dimensión DUN14T_ID]
LEFT OUTER JOIN  	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PosNutrisa POSN ON  POSN.[Código de Producto_ID] = P.ID 
)
-- LINEA
SELECT 
   cast(p.[Número de Recurso] as varchar(15)) as KxRecurso_MDM

,  cast(p.[Clave de Línea] as varchar(3)) as ValorID_MDM 
,  p.[Descripción de la Línea] Descripcion_MDM	

,  SUBSTRING(p_dwh.RecursoLinea,1,3) as ValorID_DWH
,  SUBSTRING (p_dwh.RecursoLinea,5,100) Descripcion_DWH

, C4_LI.RMMKPL AS ValorID_AS400
, C4_LI_DESC.NOMBRELINEA AS Descripcion_AS400
, 'LINEA' as KxTipoDiferencia
, 2 AS Prioridad
from allProducts p
inner join  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[Número de Recurso]=p_dwh.ID_Recurso
inner join [MDMHERDEZCI]..DIM_PRODUCTOS_FROM_AS400_23052018 C4_LI on p.[Número de Recurso]=C4_LI.RMRESC
INNER JOIN (SELECT * FROM OPENQUERY(HDZ54,'SELECT  * FROM HDZMEN.MLINF ')) C4_LI_DESC ON C4_LI.RMMKPL=C4_LI_DESC.NUMEROLINEA
where  1=1
AND (
		 (
		           p.[Clave de Línea]<>cast(substring(p_dwh.RecursoLinea,1,3) as int) 
				OR cast(substring(p_dwh.RecursoLinea,1,3) as int) <>C4_LI_DESC.NUMEROLINEA
	     )
		OR  (    
				  RTRIM(LTRIM(p.[Descripción de la Línea]))<> RTRIM(LTRIM(SUBSTRING (p_dwh.RecursoLinea,5,100))) 
			   OR RTRIM(LTRIM(SUBSTRING (p_dwh.RecursoLinea,5,100)))<>RTRIM(LTRIM(C4_LI_DESC.NOMBRELINEA)))
	)


UNION ALL
-- MARCA
SELECT 
  CAST( p.[Número de Recurso] AS VARCHAR(15)) as KxRecurso_MDM
,  p.[Código de Clave de Marca] as ValorID_MDM
,  p.[Nombre de Clave de Marca]  Descripcion_MDM	
,  p_dwh.ID_RecursoMarca as ValorID_DWH
,  SUBSTRING(p_dwh.RecursoMarca,3,100) Descripcion_DWH
, 'MARCA' as KxTipoDiferencia
, 1 AS Prioridad
from allProducts p
inner join  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[Número de Recurso]=p_dwh.ID_Recurso
where  1=1
and  (p_dwh.ID_RecursoMarca <> p.[Código de Clave de Marca])
OR p.[Nombre de Clave de Marca]<> SUBSTRING(p_dwh.RecursoMarca,3,100)

-- RECURSO_C
union all
SELECT 
  CAST( p.[Número de Recurso] AS VARCHAR(15)) as KxRecurso_MDM
,  '' as ValorID_MDM
,  ltrim(rtrim(p.[Descripción del Recurso]))  Descripcion_MDM
	
,  '' as ValorID_DWH
,  ltrim(rtrim(p_dwh.Recurso_C)) Descripcion_DWH
, 'Recurso_C' as KxTipoDiferencia
, 3 AS Prioridad
from allProducts p
inner join  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[Número de Recurso]=p_dwh.ID_Recurso
where  1=1
and  (ltrim(rtrim(p_dwh.Recurso_C)) <> ltrim(rtrim(p.[Descripción del Recurso])))

-- COMPAÑIA ALFANUMERICA
union all
SELECT 
  CAST( p.[Número de Recurso] AS VARCHAR(15)) as KxRecurso_MDM
,  p.[Código de Compañia Alfabetica] as ValorID_MDM
,  ltrim(rtrim(p.[Nombre de Compañia Alfabetica]))  Descripcion_MDM
	
,  p_dwh.ID_RecursoCompania as ValorID_DWH
,  ltrim(rtrim(substring(p_dwh.RecursoCompania,3,100))) Descripcion_DWH

, 'COMPAÑIA ALFANUMERICA' as KxTipoDiferencia
, 4 AS Prioridad
from allProducts p
inner join  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[Número de Recurso]=p_dwh.ID_Recurso
where  1=1
and  (ltrim(rtrim(p_dwh.ID_RecursoCompania)) <> ltrim(rtrim(p.[Código de Compañia Alfabetica])))
or ltrim(rtrim(p.[Nombre de Compañia Alfabetica])) <>ltrim(rtrim(substring(p_dwh.RecursoCompania,3,100)))

-- COMPAÑIA CONTABLE
union all
SELECT 
  CAST(p.[Número de Recurso] AS VARCHAR(15)) as KxRecurso_MDM

,  CAST(p.[Código de Compañia Numérica] AS VARCHAR(3)) as ValorID_MDM
,  ltrim(rtrim(p.[Nombre de Compañia Numérica]))  Descripcion_MDM
	
,  CAST(p_dwh.ID_RecursoCompaniaContable as varchar(3)) as ValorID_DWH
,  ltrim(rtrim(substring(p_dwh.RecursoCompaniaContable,5,200))) Descripcion_DWH

, 'COMPAÑIA CONTABLE' as KxTipoDiferencia
, 5 AS Prioridad
from allProducts p
inner join  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[Número de Recurso]=p_dwh.ID_Recurso
where  1=1
and p.[Código de Compañia Numérica] <> p_dwh.ID_RecursoCompaniaContable
or ltrim(rtrim(p.[Nombre de Compañia Numérica])) <>ltrim(rtrim(substring(p_dwh.RecursoCompaniaContable,5,200)))


-- RECURSO AGRUPACION
union all


SELECT 
  CAST(p.[Número de Recurso] AS VARCHAR(15)) as KxRecurso_MDM

,  '' as ValorID_MDM
,  ltrim(rtrim([Clave Tipo_Name]))  Descripcion_MDM
	
,  '' as ValorID_DWH
,  ltrim(rtrim(p_dwh.RecursoAgrupacion)) Descripcion_DWH

, 'RECURSO AGRUPACION NUTRISA' as KxTipoDiferencia
, 6 AS Prioridad
from allProducts p
inner join  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[Número de Recurso]=p_dwh.ID_Recurso
where  1=1
AND  ltrim(rtrim(p.[Clave Tipo_Name])) <>ltrim(rtrim(p_dwh.RecursoAgrupacion))

-- CODIGO DE BARRAS
union all
SELECT 
  CAST(p.[Número de Recurso] AS VARCHAR(15)) as KxRecurso_MDM

,   cast(CAST(CASE WHEN LEN(p.[EAN13])>0 THEN  REPLACE(ISNULL(LTRIM(RTRIM(p.[EAN13])),0),'',0) ELSE '0'END AS DECIMAL(20,0)) as varchar(20)) as ValorID_MDM
,  ''  Descripcion_MDM

,  ltrim(rtrim(p_dwh.RecursoCodigoBarras)) as ValorID_DWH
,  '' Descripcion_DWH

, 'CODIGO DE BARRAS' as KxTipoDiferencia
, 7 AS Prioridad
from allProducts p
inner join  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[Número de Recurso]=p_dwh.ID_Recurso
where  1=1
AND   CAST(CASE WHEN LEN(p.[EAN13])>0 THEN  REPLACE(ISNULL(LTRIM(RTRIM(p.[EAN13])),0),'',0) ELSE '0'END AS DECIMAL(20,0))
		<> cast(ltrim(rtrim(p_dwh.RecursoCodigoBarras)) as decimal(20,0))

-- CLASE
union all
SELECT 
  CAST(p.[Número de Recurso] AS VARCHAR(15)) as KxRecurso_MDM

,   LTRIM(RTRIM(p.[Codigo de Clase])) as ValorID_MDM
,  ''  Descripcion_MDM

,  LTRIM(RTRIM(p_dwh.RecursoFuenteClase)) as ValorID_DWH
,  '' Descripcion_DWH

, 'CLASE DEL RECURSO' as KxTipoDiferencia
, 8 AS Prioridad
from allProducts p
LEFT JOIN  hdznt169.dwh_cdc.dbo.recurso p_dwh on p.[Número de Recurso]=p_dwh.ID_Recurso
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

