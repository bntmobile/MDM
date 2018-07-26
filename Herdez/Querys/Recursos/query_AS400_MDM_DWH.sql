
SELECT * 
FROM 

(
SELECT
			  ISNULL(CAST(MtxRecurso.RMRESC AS Varchar),'')							AS [IDProducto_400]
			/*Sección Productos Inicio */
			, ISNULL(CAST(MtxRecurso.RMRSCL AS Varchar),'')							AS [Clase_400]
			, ISNULL(CAST(MtxRecurso.RMWGHT AS Varchar),'')							AS [Peso Bruto_400]
			, ISNULL(CAST(MtxRecurso.RMRSSC AS varchar), '')						AS [Subclase de recurso_400]
			, ISNULL(CAST(MtxRecurso.RMNETW AS Varchar),'')							AS [Peso Neto_400]
			, ISNULL(CAST(MtxRecurso.RMWTUM AS Varchar),'')							AS [Unidad de Medida de Peso_400]
			, ISNULL(CAST(MtxRecurso.RMUMSR AS Varchar),'')							AS [Unidad de Medida Estándar_400]
			, ISNULL(CAST(MtxRecurso.RMMIS2 AS Varchar),'')							AS [Piezas P Unidad de Venta_400]
			--, ISNULL(CAST(MtxRecurso.RMDTMT AS Varchar),'')							AS [Fecha de último Mtto_400] 
			, ISNULL(CAST(MtxRecurso.RMABCC AS Varchar),'')							AS [Código ABC_400]
			, ISNULL(CAST(MtxRecurso.RMMIS3 AS Varchar),'')							AS [Empaque Contenido_400]
			, ISNULL(CAST(MtxRecurso.RMLOTC AS Varchar),'')							AS [Control de Lote_400]
			--, ISNULL(CAST(MtxRecurso.RMDTAB AS Varchar),'')							AS [Fecha Actualización ABC_400]
			, ''																	AS [Fecha Actualización ABC_400]
			, ISNULL(CAST(MtxRecurso.RMBCON AS Varchar),'')							AS [Consumo en Lote_400]
			, ISNULL(CAST(LTRIM(MtxRecurso.RMMKPL) AS Varchar),'')					AS [Linea_400]
			, ISNULL(CAST(MtxRecurso.RMSHTG AS Varchar),'')							AS [Indicador insuficiencia_400]
			, ISNULL(CAST(MtxRecurso.RMBORC AS Varchar),'')							AS [Código Saldo Recurso_400]
			, ISNULL(CAST(MtxRecurso.RMTHEO AS Varchar),'')							AS [Consumo Teórico_400]
			, ISNULL(CAST(MtxRecurso.RMPRCL AS Varchar),'')							AS [Clase Producto Producción_400]
			, ISNULL(CAST(MtxRecurso.RMPOTR AS Varchar),'')							AS [Recurso Potente_400]
			, ISNULL(CAST(MtxRecurso.RMPOTF AS Varchar),'')							AS [Factor de Potencia_400]
			, ISNULL(CAST(MtxRecurso.RMBEDT AS Varchar),'')							AS [Fecha Efectividad Inicial_400]
			, ISNULL(CAST(MtxRecurso.RMEEDT AS Varchar),'')							AS [Fecha Efectividad Final_400]
			, ISNULL(CAST(MtxRecurso.RMSFCT AS Varchar),'')							AS [Factor Merma_400]
			, ISNULL(CAST(MtxRecurso.RMJIT AS Varchar),'')							AS [Justo a Tiempo_400]
			, ISNULL(CAST(MtxRecurso.RMBOLH AS Varchar),'')							AS [Peligro BOL_400]
			, ISNULL(CAST(MtxRecurso.RMPRPL AS Varchar),'')							AS [Línea Prod Producción_400]
			, ISNULL(CAST(MtxRecurso.RMTXCC AS Varchar),'')							AS [Catégoria de Impuesto_400]
			, ISNULL(CAST(MtxRecurso.RMMIS1 AS Varchar),'')							AS [Status_400]
			, ISNULL(CAST(MtxRecurso.RMDESC AS Varchar),'')							AS [Descripción del Recurso_400]
			/*Sección Productos Fin */

			/*Sección Productos Almacen Inicio */
			, ISNULL(CAST(MtxRecurso.RMSUTR AS Varchar),'')							AS [Cantidad Estiba x Hilera_400]
			, ISNULL(CAST(MtxRecurso.RMSUUN AS Varchar),'')							AS [Cantidad Estiba x Unidad_400]
			, ISNULL(CAST(MtxRecurso.CAMASXTARIUNCARGA AS Varchar),'')				AS [Cantidad de Camas x Tarima_400]
			, ISNULL(CAST(MtxRecurso.RMSTHT AS Varchar),'')							AS [Altura de Estiba_400]
			, ISNULL(CAST(MtxRecurso.RMAGD1 AS Varchar),'')							AS [Días Antigüedad 1_400]
			, ISNULL(CAST(MtxRecurso.RMHTSU AS Varchar),'')							AS [Caja Altura_400]
			, ISNULL(CAST(MtxRecurso.RMWDSU AS Varchar),'')							AS [Caja Ancho_400]
			, ISNULL(CAST(MtxRecurso.RMDPSU AS Varchar),'')							AS [Caja Profundidad_400]
			, ISNULL(CAST(MtxRecurso.RMHTUN AS Varchar),'')							AS [Tarima Altura_400]
			, ISNULL(CAST(MtxRecurso.RMWDUN AS Varchar),'')							AS [Tarima Ancho_400]
			, ISNULL(CAST(MtxRecurso.RMDPUN AS Varchar),'')							AS [Tarima Profundidad_400]
			, ISNULL(CAST(MtxRecurso.RMSTAG AS Varchar),'')							AS [Recurso en Planta_400]
			, ISNULL(CAST(MtxRecurso.RMRTST AS Varchar),'')							AS [Rotación Inventario_400]
			, ISNULL(CAST(MtxRecurso.RMWNDW AS Varchar),'')							AS [Ventana de Envío Directo_400]
			/*Sección Productos Almacen Fin */



			/*Sección Productos Aseg. Calidad Inicio */
			, ISNULL(CAST(MtxRecurso.RMSHLB AS Varchar),'')		AS [Vida Útil_400]
			, ISNULL(CAST(MtxRecurso.RMSHLD AS Varchar),'')		AS [Vida útil - Días_400]
			, ISNULL(CAST(MtxRecurso.RMDCPO AS Varchar),'')		AS [Recep Misc Cód Clasific Localiz Predet_400]
			, ISNULL(CAST(MtxRecurso.RMDCPR AS Varchar),'')		AS [Recep Prod Cód Clasific Localiz Predet_400]
			
			/*Sección Productos Aseg. Calidad Fin */

			/*Sección Productos C. Adicionales Inicio */

			--, ISNULL(CAST(MtxRecurso.RMSFTM AS Varchar),'')		AS [Tiempo de seguridad_400]
			--, ISNULL(CAST(MtxRecurso.RMRPCL AS Varchar),'')		AS [Clase de reporte_400]
			--, ISNULL(CAST(MtxRecurso.RMDOCU AS Varchar),'')		AS [Cód de localiz docum_400]
			--, ISNULL(CAST(MtxRecurso.RMMKCL AS Varchar),'')		AS [Cls Recurso Mercadeo_400]
			--, ISNULL(CAST(MtxRecurso.RMSICL AS Varchar),'')		AS [Cód clase inven est_400]
			--, ISNULL(CAST(MtxRecurso.RMSWCS AS Varchar),'')		AS [Cambio Sobre Costo_400]
			--, ISNULL(CAST(MtxRecurso.RMVORT AS Varchar),'')		AS [Tasa GI Variable_400]
			--,ISNULL(CAST(MtxRecurso.RMVOTV AS Varchar),'')		AS [Valor Tabla GI Var_400]
			--,ISNULL(CAST(MtxRecurso.RMVOPD AS Varchar),'')		AS [Byte GI Variable_400]
			--,ISNULL(CAST(MtxRecurso.RMVOTR AS Varchar),'')		AS [Tabla Tasa GI Varibl_400]
			--,ISNULL(CAST(MtxRecurso.RMFORT AS Varchar),'')		AS [Tasa GI Fija_400]
			--,ISNULL(CAST(MtxRecurso.RMFOTV AS Varchar),'')		AS [Valor Tabla GI Fija_400]
			--,ISNULL(CAST(MtxRecurso.RMFOPD AS Varchar),'')		AS [Byte GI Fijo_400]
			--,ISNULL(CAST(MtxRecurso.RMFOTR AS Varchar),'')		AS [Tabla Tasa GI Fijo_400]
			--,ISNULL(CAST(MtxRecurso.RMNVAL AS Varchar),'')		AS [Valor Neto Reablizab_400]
			--,ISNULL(CAST(MtxRecurso.RMFIXC AS Varchar),'')		AS [Costo Fijo_400]
			--,ISNULL(CAST(MtxRecurso.RMDFWC AS Varchar),'')		AS [Ctro Trabajo X Omis_400]
			--,ISNULL(CAST(MtxRecurso.RMDSHG AS Varchar),'')		AS [Grupo Turno X Omisi_400]
			--,ISNULL(CAST(MtxRecurso.RMNOPM AS Varchar),'')		AS [N Veces Recurs Usado_400]
			--,ISNULL(CAST(MtxRecurso.RMCMLT AS Varchar),'')		AS [TE Acum MP Cst Prim_400]
			--,ISNULL(CAST(MtxRecurso.RMLTHR AS Varchar),'')		AS [TE Acum MP Cst Pr hr_400]
			--,ISNULL(CAST(MtxRecurso.RMLTMN AS Varchar),'')		AS [TE Acum MP Cst Pr mn_400]
			--,ISNULL(CAST(MtxRecurso.RMATSK AS Varchar),'')		AS [Nmb Tarea Escand rl_400]
			--,ISNULL(CAST(MtxRecurso.RMSTSK AS Varchar),'')		AS [Nmb Tarea Escand Sim_400]
			--,ISNULL(CAST(MtxRecurso.RMPLSQ AS Varchar),'')		AS [N Secuencia Planif_400]
			--,ISNULL(CAST(MtxRecurso.RMDLCO AS Varchar),'')		AS [Loc Omis p Consumo_400]
			--,ISNULL(CAST(MtxRecurso.RMDWCO AS Varchar),'')		AS [Alm Omis p Consumo_400]
			--,ISNULL(CAST(MtxRecurso.RMCOMM AS Varchar),'')		AS [Código de mercancía_400]

			--,ISNULL(CAST(MtxRecurso.RMCREV AS Varchar),'')		AS [Nivel Revisión Actl_400]
			--,ISNULL(CAST(MtxRecurso.RMEREV AS Varchar),'')		AS [Ultimo Nivel Aceptab_400]
			--,ISNULL(CAST(MtxRecurso.RMBUYR AS Varchar),'')		AS [Número de comprador_400]
			--,ISNULL(CAST(MtxRecurso.RMSERV AS Varchar),'')		AS [Nivel Servicio A_400]
			--,ISNULL(CAST(MtxRecurso.RMCAPM AS Varchar),'')		AS [Multiplic Capacidad_400]
			--,ISNULL(CAST(MtxRecurso.RMRFCL AS Varchar),'')		AS [Rqd De Cd Clsif Lclz_400]
			--,ISNULL(CAST(MtxRecurso.RMPLT1 AS Varchar),'')		AS [TE 1 de OC_400]
			--,ISNULL(CAST(MtxRecurso.RMPHR1 AS Varchar),'')		AS [TE 1 OC hrs_400]
			--,ISNULL(CAST(MtxRecurso.RMPMN1 AS Varchar),'')		AS [TE 1 OC mns_400]
			--,ISNULL(CAST(MtxRecurso.RMPLT2 AS Varchar),'')		AS [TE 2 OC_400]
			--,ISNULL(CAST(MtxRecurso.RMPHR2 AS Varchar),'')		AS [TE 2 OC hrs_400]
			--,ISNULL(CAST(MtxRecurso.RMPMN2 AS Varchar),'')		AS [TE 2 OC mns_400]
			--,ISNULL(CAST(MtxRecurso.RMPLTN AS Varchar),'')		AS [TE OC p Nva Versión_400]
			--,ISNULL(CAST(MtxRecurso.RMPHRN AS Varchar),'')		AS [TE OC Nva Ver hrs_400]
			--,ISNULL(CAST(MtxRecurso.RMPMNN AS Varchar),'')		AS [TE OC Nva Ver mns_400]
			--,ISNULL(CAST(MtxRecurso.RMMLT1 AS Varchar),'')		AS [TE 1 MO_400]
			--,ISNULL(CAST(MtxRecurso.RMMHR1 AS Varchar),'')		AS [TE 1 MO hrs_400]
			--,ISNULL(CAST(MtxRecurso.RMMMN1 AS Varchar),'')		AS [TE 1 MO mns_400]
			--,ISNULL(CAST(MtxRecurso.RMMLT2 AS Varchar),'')		AS [TE 2 MO_400]
			--,ISNULL(CAST(MtxRecurso.RMMHR2 AS Varchar),'')		AS [TE 2 MO hrs_400]
			--,ISNULL(CAST(MtxRecurso.RMMMN2 AS Varchar),'')		AS [TE 2 MO mns_400]
			--,ISNULL(CAST(MtxRecurso.RMPLTA AS Varchar),'')		AS [Ajustar TE OC Day_400]
			--,ISNULL(CAST(MtxRecurso.RMPHRA AS Varchar),'')		AS [Ajustar TE OC hrs_400]
			--,ISNULL(CAST(MtxRecurso.RMPMNA AS Varchar),'')		AS [Ajustar TE OC mns_400]
			--,ISNULL(CAST(MtxRecurso.RMMLTA AS Varchar),'')		AS [Ajustar TE MO day_400]
			--,ISNULL(CAST(MtxRecurso.RMMHRA AS Varchar),'')		AS [Ajustar TE MO hrs_400]
			--,ISNULL(CAST(MtxRecurso.RMMMNA AS Varchar),'')		AS [Ajustar TE OM mns_400]
			--,ISNULL(CAST(MtxRecurso.RMPOQY AS Varchar),'')		AS [Cnt Máxima TE OC_400]
			--,ISNULL(CAST(MtxRecurso.RMMOQY AS Varchar),'')		AS [Cnt Máxima TE MO_400]
			--,ISNULL(CAST(MtxRecurso.RMSLLT AS Varchar),'')		AS [TE Ventas_400]
			--,ISNULL(CAST(MtxRecurso.RMSLHR AS Varchar),'')		AS [TE Ventas hrs_400]
			--,ISNULL(CAST(MtxRecurso.RMSLMN AS Varchar),'')		AS [TE Ventas mns_400]
			--,ISNULL(CAST(MtxRecurso.RMGRAP AS Varchar),'')		AS [Código de gráficos_400]
			--,ISNULL(CAST(MtxRecurso.RMDLPR AS Varchar),'')		AS [Loc Omis p Bolt Prd_400]
			--,ISNULL(CAST(MtxRecurso.RMDWPR AS Varchar),'')		AS [Alm Omis p Bolt Prd_400]
			--,ISNULL(CAST(MtxRecurso.RMCOM1 AS Varchar),'')		AS [Código 1 Cmt Omis_400]
			--,ISNULL(CAST(MtxRecurso.RMCOM2 AS Varchar),'')		AS [Código 2 Cmt Omis_400]
			--,ISNULL(CAST(MtxRecurso.RMCOM3 AS Varchar),'')		AS [Código 3 Cmt Omis_400]
			--,ISNULL(CAST(MtxRecurso.RMINQT AS Varchar),'')	AS [Acept Var Cnt Inv_400]
			--,ISNULL(CAST(MtxRecurso.RMDFIQ AS Varchar),'')	AS [Var Cnt Inv Omis_400]
			--,ISNULL(CAST(MtxRecurso.RMFRQT AS Varchar),'') 	AS [Var Cnt Bol Cmplt_400]
			----,ISNULL(CAST(MtxRecurso.RMDFFQ AS Varchar),'')    AS [Aplica Var Cnt Bol Cmplt_400]
			--,ISNULL(CAST(MtxRecurso.RMINQT AS Varchar),'')		AS [Acept Var Preci Inv_400]
			--,ISNULL(CAST(MtxRecurso.RMDFIP AS Varchar),'')		AS [Var Precio Inv Omi_400]
			--,ISNULL(CAST(MtxRecurso.RMURQT AS Varchar),'')		AS [Var Cnt Défct Acep_400]
			--,ISNULL(CAST(MtxRecurso.RMDFUQ AS Varchar),'')		AS [Var Cnt Défic Oms_400]
			--,ISNULL(CAST(MtxRecurso.RMORQT AS Varchar),'')		AS [Var Cnt sbr recp_400]
			--,ISNULL(CAST(MtxRecurso.RMDFOQ AS Varchar),'')		AS [Var Cnt SR Oms_400]
			--,ISNULL(CAST(MtxRecurso.RMZONE AS Varchar),'')		AS [Días Zona Firme_400]
			--,ISNULL(CAST(MtxRecurso.RMUNPR AS Varchar),'')		AS [Precio Unit Omisión_400]
			--,ISNULL(CAST(MtxRecurso.RMRTTB AS Varchar),'')		AS [Tabla Fch Rotación_400]
			--,ISNULL(CAST(MtxRecurso.RMFRCL AS Varchar),'')		AS [Clasif de transp_400]
			--,ISNULL(CAST(MtxRecurso.RMRCLS AS Varchar),'')		AS [Reclasif Automática_400]
			--,ISNULL(CAST(MtxRecurso.RMAGD2 AS Varchar),'')		AS [Días Antigüedad 2_400]
			--,ISNULL(CAST(MtxRecurso.RMAGD3 AS Varchar),'')		AS [Días Antigüedad 3_400]
			--,ISNULL(CAST(MtxRecurso.RMAGD4 AS Varchar),'')		AS [Días Antigüedad 4_400]
			--,ISNULL(CAST(MtxRecurso.RMAGD5 AS Varchar),'')		AS [Días Antigüedad 5_400]
			--,ISNULL(CAST(MtxRecurso.RMDSTL AS Varchar),'')		AS [Loclzcn Planta_400]
			--,ISNULL(CAST(MtxRecurso.RMCHEM AS Varchar),'')		AS [Fórmula química_400]
			--,ISNULL(CAST(MtxRecurso.RMPRCA AS Varchar),'')		AS [IMPRIM C A_400]
			--,ISNULL(CAST(MtxRecurso.RMCASN AS Varchar),'')		AS [Núm caja_400]
			--,ISNULL(CAST(MtxRecurso.RMRGCT AS Varchar),'')		AS [Categoría reglamet_400]
			--,ISNULL(CAST(MtxRecurso.RMSPDI AS Varchar),'')		AS [Trans DI Grp Substit_400]
			--,ISNULL(CAST(MtxRecurso.RMSPRC AS Varchar),'')		AS [Trans RC Grp Substit_400]
			--,ISNULL(CAST(MtxRecurso.RMUNIV AS Varchar),'')		AS [Recurso Universal_400]
			--,ISNULL(CAST(MtxRecurso.RMINQD AS Varchar),'')		AS [N Días Adel Cons DAC_400]
			--,ISNULL(CAST(MtxRecurso.RMSCFM AS Varchar),'')		AS [Familia Programas_400]
			--,ISNULL(CAST(MtxRecurso.CODIGODEBARRAS3 AS Varchar),'')		AS [CODIGODEBARRAS3_400]
			--,ISNULL(CAST(MtxRecurso.CODIGODEBARRAS4 AS Varchar),'')		AS [CODIGODEBARRAS4_400]
			--,ISNULL(CAST(MtxRecurso.CODIGODEBARRAS5 AS Varchar),'')		AS [CODIGODEBARRAS5_400]
			--,ISNULL(CAST(MtxRecurso.CODIGODEBARRAS6 AS Varchar),'')		AS [CODIGODEBARRAS6_400]
			--,ISNULL(CAST(MtxRecurso.CODIGODEBARRAS7 AS Varchar),'')		AS [CODIGODEBARRAS7_400]
			--,ISNULL(CAST(MtxRecurso.CODIGODEBARRAS9 AS Varchar),'')		AS [CODIGODEBARRAS9_400]
			--,ISNULL(CAST(MtxRecurso.CODIGODEBARRAS10 AS Varchar),'')		AS [CODIGODEBARRAS10_400]
			--,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADLOGISTICA03 AS Varchar),'')		AS [UNIDADMEDIDAUNIDADLOGISTICA03_400]
			--,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADLOGISTICA04 AS Varchar),'')		AS [UNIDADMEDIDAUNIDADLOGISTICA04_400]
			--,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADLOGISTICA05 AS Varchar),'')		AS [UNIDADMEDIDAUNIDADLOGISTICA05_400]
			--,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADLOGISTICA06 AS Varchar),'')		AS [UNIDADMEDIDAUNIDADLOGISTICA06_400]
			--,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADLOGISTICA07 AS Varchar),'')		AS [UNIDADMEDIDAUNIDADLOGISTICA07_400]
			--,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADLOGISTICA09 AS Varchar),'')		AS [UNIDADMEDIDAUNIDADLOGISTICA09_400]
			--,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADLOGISTICA10 AS Varchar),'')		AS [UNIDADMEDIDAUNIDADLOGISTICA10_400]
			/*Sección Productos C. Adicionales Fin */

			/*Sección Productos Código Barra Inicio*/
			


			, RIGHT('000000000000000' + ISNULL(CAST(  MtxRecurso.CODBARRASUNCONSUMO AS Varchar),''),15)		AS [CB EAN13_400]
			,ISNULL(CAST(MtxRecurso.PESONETOCB1 AS Varchar),'')				AS [Peso Neto EAN 13_400]
			,ISNULL(CAST(MtxRecurso.PESOBRUTOCB1 AS Varchar),'')				AS [Peso Bruto EAN 13_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADPESO01 AS Varchar),'')			AS [Unidad Medida Peso EAN 13_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADLOGISTICA01 AS Varchar),'')		AS [Unidad Medida Estándar EAN 13_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDACB1 AS Varchar),'')						AS [Unidad Medida Dimensión EAN 13_400]
			,ISNULL(CAST(MtxRecurso.VOLUMENEXTCB1 AS Varchar),'')						AS [Volúmen Exterior EAN 13_400]
			,ISNULL(CAST(MtxRecurso.DIMINTALTOCB1 AS Varchar),'')				AS [Dimensión Interior Alto EAN 13_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTALTOCB1 AS Varchar),'')				AS [Dimensión Ext Alto EAN 13_400]
			,ISNULL(CAST(MtxRecurso.DIMINTANCCB1 AS Varchar),'')				AS [Dimensión Interior Ancho EAN 13_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTANCCB1 AS Varchar),'')				AS [Dimensión Ext Ancho EAN 13_400]
			,ISNULL(CAST(MtxRecurso.DIMINTPROFCB1 AS Varchar),'')				AS [Dimensión Interior Profundo EAN 13_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTPROFCB1 AS Varchar),'')				AS [Dimensión Ext Profundo EAN 13_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADPESO02 AS Varchar),'')	AS [Unidad Medida Peso DUN14_400]
			,ISNULL(CAST(MtxRecurso.PESONETOCB2 AS Varchar),'')					AS [Peso Neto DUN14_400]
			,ISNULL(CAST(MtxRecurso.PESOBRUTOCB2 AS Varchar),'')				AS [Peso Bruto DUN14_400]
			, RIGHT ('000000000000000' + ISNULL(CAST(MtxRecurso.CODBARRASUNEXPEDICION AS Varchar),''), 15)	AS [CB DUN14_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADLOGISTICA02 AS Varchar),'')		AS [Unidad Medida Estándar DUN14_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDACB2 AS Varchar),'')			AS [Unidad Medida Dimensión DUN14_400]
			,ISNULL(CAST(MtxRecurso.VOLUMENEXTCB2 AS Varchar),'')		AS [Volúmen Exterior DUN14_400]
			,ISNULL(CAST(MtxRecurso.DIMINTALTOCB2 AS Varchar),'')		AS [Dimensión Interior Alto DUN14_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTALTOCB2 AS Varchar),'')		AS  [Dimensión Ext Alto DUN14_400]
			,ISNULL(CAST(MtxRecurso.DIMINTANCCB2 AS Varchar),'')		AS [Dimensión Interior Ancho DUN14_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTANCCB2 AS Varchar),'')		AS [Dimensión Ext Ancho DUN14_400]
			,ISNULL(CAST(MtxRecurso.DIMINTPROFCB2 AS Varchar),'')		AS [Dimensión Interior Profundo DUN14_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTPROFCB2 AS Varchar),'')		AS [Dimensión Ext Profundo DUN14_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADPESO08 AS Varchar),'')		AS [Unidad Medida Peso DUN14T_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADLOGISTICA08 AS Varchar),'')	AS [Unidad Medida Estándar DUN14T_400]
			,RIGHT( '000000000000000' + ISNULL(CAST(MtxRecurso.CODBARRASUNCARGA AS Varchar),''), 15)		AS [CB DUN14T_400]
			,ISNULL(CAST(MtxRecurso.PESONETOCB8 AS Varchar),'')		AS [Peso Neto DUN14T_400]
			,ISNULL(CAST(MtxRecurso.PESOBRUTOCB8 AS Varchar),'')		AS [Peso Bruto DUN14T_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDACB8 AS Varchar),'')		AS [Unidad Medida Dimensión DUN14T_400]
			,ISNULL(CAST(MtxRecurso.VOLUMENEXTCB8 AS Varchar),'')		AS [Volúmen Exterior DUN14T_400]
			,ISNULL(CAST(MtxRecurso.DIMINTALTOCB8 AS Varchar),'')		AS [Dimensión Interior Alto DUN14T_400]
			,ISNULL(CAST(MtxRecurso.DIMINTANCCB8 AS Varchar),'')		AS [Dimensión Interior Ancho DUN14T_400]
			,ISNULL(CAST(MtxRecurso.DIMINTPROFCB8 AS Varchar),'')		AS [Dimensión Interior Profundo DUN14T_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTALTOCB8 AS Varchar),'')		AS [Dimensión Ext Alto DUN14T_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTANCCB8 AS Varchar),'')		AS [Dimensión Ext Ancho DUN14T_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTPROFCB8 AS Varchar),'')		AS [Dimensión Ext Profundo DUN14T_400]

			/*Sección Productos Código Barra Fin*/
			/*Sección Productos Comentario Inicio*/
			--,ISNULL(CAST(MtxRecurso.RNDTMT AS Varchar),'')		AS [Fecha de último Mtto_400]
			--,ISNULL(CAST(MtxRecurso.RNSEQN AS Varchar),'')		AS [No_400]
			--,ISNULL(CAST(MtxRecurso.RNCNMT AS Varchar),'')		AS [Comentario_400]
			/*Sección Productos Comentario Fin*/
			/*Sección Productos Compras Inicio*/
			
			,ISNULL(CAST(MtxRecurso.RMUMPR AS Varchar),'')		AS [UM Compras_400]
			,ISNULL(CAST(MtxRecurso.RMVNAP AS Varchar),'')		AS [Cód Aprob Proveedor Y N_400]
			,ISNULL(CAST(MtxRecurso.RMTAXC AS Varchar),'')		AS [Código Imponible_400]
			/*Sección Productos Compras Fin*/

			/*Sección Productos Costos Inicio*/
			,ISNULL(CAST(MtxRecurso.RMFCLC AS Varchar),'')	AS [Código Nivel Costeo Fijo_400]
			--,ISNULL(CAST(MtxRecurso.RMCSTP AS Varchar),'')		AS [Código Tipo Acum Costo_400] --C,N
			,ISNULL(CAST(MtxRecurso.RMSTDC AS Varchar),'')		AS [Costo Estándar_A_400]
			,ISNULL(CAST(MtxRecurso.RMSTDC_GPO AS Varchar),'')		AS [Costo Estándar_G_400]
			--,ISNULL(CAST(MtxRecurso.RMDTLR AS Varchar),'')	AS [Fecha Última Acumulación_400]
			,ISNULL(CAST(MtxRecurso.RMCLC AS Varchar),'')		AS [Código Nivel Costeo_400]
			,ISNULL(CAST(MtxRecurso.RMSELC AS Varchar),'')		AS [Costo Unitario Seleccionado_400]
			,ISNULL(CAST(MtxRecurso.RMPVCS AS Varchar),'')		AS [Costo Última Acumulación_400]
			,ISNULL(CAST(MtxRecurso.RMNRVL AS Varchar),'')		AS [Uso Valor Neto Realiz_400]
			,ISNULL(CAST(MtxRecurso.RMCRLC AS Varchar),'')		AS [Cód Clase Nivel Acum Cost_400] --C,N
			,ISNULL(CAST(MtxRecurso.RMRCST AS Varchar),'')		AS [Nuevo Costeo_400]
			,ISNULL(CAST(MtxRecurso.RMCSRU AS Varchar),'')		AS [Mét Costeo Acum Costo_400]
			,ISNULL(CAST(MtxRecurso.RMPCTP AS Varchar),'')		AS [Tipo MP Prim p Costo_400]
			,ISNULL(CAST(MtxRecurso.RMPCNM AS Varchar),'')		AS [Nmb MP Prim p Costo_400]

			/*Sección Productos Costos Fin*/
			/*Sección Productos Extendido Inicio*/

			,ISNULL(CAST(MtxRecurso.DEPRODUCTO AS Varchar),'')		AS [Descripción Larga del Producto_400]
			,ISNULL(CAST(MtxRecurso.NUFICHATECNICA AS Varchar),'')		AS [Número Ficha Técnica_400]
			,ISNULL(CAST(MtxRecurso.UNIDADEMPAQUE AS Varchar),'')		AS [Unidad Empaque_400]
			,ISNULL(CAST(MtxRecurso.TIEMPAQUEPRIM AS Varchar),'')		AS [Tipo Empaque Primario_400]
			,ISNULL(CAST(MtxRecurso.CASA AS Varchar),'')		AS [Clave de Marca_400]
			,ISNULL(CAST(MtxRecurso.CIAALFA AS Varchar),'')		AS [Clave Compañía Alfanum_400]
			,ISNULL(CAST(MtxRecurso.CIA AS Varchar),'')		AS [Número de Compañía_400]
			,ISNULL(CAST(MtxRecurso.COMPANIAAMECE AS Varchar),'')		AS [Compañía AMECE_400]
			,ISNULL(CAST(MtxRecurso.RMSELP AS Varchar),'')		AS [Precio de Venta_400]
			,ISNULL(CAST(MtxRecurso.NOPRODUCTO AS Varchar),'')		AS [Número del Producto_400]
			,ISNULL(CAST(MtxRecurso.CODBARRASUNCONSUMO AS Varchar),'')		AS [EAN13_400]
			,ISNULL(CAST(MtxRecurso.CODBARRASUNEXPEDICION AS Varchar),'')		AS [DUN14_400]
			,ISNULL(CAST(MtxRecurso.CODBARRASUNCARGA AS Varchar),'')		AS [DUN14T_400]
			,ISNULL(CAST(MtxRecurso.CATIMPUESTOS2 AS Varchar),'')		AS [Categoría de Impuestos_400]

			/*Sección Productos Extendido Fin*/

			/*Sección Productos Planeación Inicio*/

			,''	AS [Cód Política Orden Programa_400]
			,ISNULL(CAST(MtxRecurso.RMORPL AS Varchar),'')	AS [Cód Política Orden Programa_A_400]
			,ISNULL(CAST(MtxRecurso.RMORPL_GPO AS Varchar),'')	AS [Cód Política Orden Programa_G_400]

			,''		AS [Código Origen M P_400]
			,ISNULL(CAST(MtxRecurso.RMWHFM AS Varchar),'') AS [Código Origen M P_A_400]
			,ISNULL(CAST(MtxRecurso.RMWHFM_GPO AS Varchar),'') AS [Código Origen M P_G_400]
			,ISNULL(CAST(MtxRecurso.RMPLAN AS Varchar),'')		AS [Número de Planificador_400]
			,ISNULL(CAST(MtxRecurso.RMORAM AS Varchar),'')		AS [Cantidad Orden Prog Fijo_400]
			,''		AS [Indicador Nueva Planif_400]
			,ISNULL(CAST(MtxRecurso.RMREPL AS Varchar),'')      AS [Indicador Nueva Planif_A_400]
			,ISNULL(CAST(MtxRecurso.RMREPL_GPO AS Varchar),'')      AS [Indicador Nueva Planif_G_400]
			,ISNULL(CAST(MtxRecurso.RMMNPQ AS Varchar),'')		AS [Ctn Orden Progr Min_400]
			,ISNULL(CAST(MtxRecurso.RMSFST AS Varchar),'')		AS [Inventario de Seguridad_400]
			,''		AS [Código PMP_400]
			,ISNULL(CAST(MtxRecurso.RMMSPC AS Varchar),'')      AS [Código PMP_A_400]
			,ISNULL(CAST(MtxRecurso.RMMSPC_GPO AS Varchar),'')      AS [Código PMP_G_400]
			,ISNULL(CAST(MtxRecurso.RMMXPQ AS Varchar),'')		AS [Ctn Orden Progr Máx_400]
			--,ISNULL(CAST(MtxRecurso.RMPPTP AS Varchar),'')		AS [Tipo MP Planificación Prima_400]
			,ISNULL(CAST(MtxRecurso.RMPPNM AS Varchar),'')		AS [Nombre MP Planif Prima_400]
			,ISNULL(CAST(MtxRecurso.RMMPFT AS Varchar),'')		AS [Ctn Orden Progr Mul_400]
			,ISNULL(CAST(MtxRecurso.RMPLVB AS Varchar),'')		AS [Cód Nivel Planif Fijo_400]
			,ISNULL(CAST(MtxRecurso.RMPLVC AS Varchar),'')		AS [Cód Nivel Planificación_400]
			,ISNULL(CAST(MtxRecurso.RMSTPC AS Varchar),'')		AS [Código Plazo Corto_400]
			,ISNULL(CAST(MtxRecurso.RMLTPC AS Varchar),'')		AS [Código Plazo Largo_400]
			,ISNULL(CAST(MtxRecurso.RMRCLT AS Varchar),'')		AS [Calc de Nvo Tiempo Espera_400]
			,ISNULL(CAST(MtxRecurso.RMITPC AS Varchar),'')		AS [Código Plazo Intermedio_400]
			,ISNULL(CAST(MtxRecurso.RMPEGC AS Varchar),'')		AS [Código de Identificación_400]
			,ISNULL(CAST(MtxRecurso.RMORDY AS Varchar),'')		AS [Días de Abastecimiento_400]

			/*Sección Productos Planeación Fin*/

	FROM (SELECT * FROM OPENQUERY(HDZ54, 
'SELECT RESMST1.*, RESMSA.*, RESMST2.RMSTDC AS RMSTDC_GPO, RESMST2.RMORPL AS RMORPL_GPO
, RESMST2.RMWHFM AS RMWHFM_GPO, RESMST2.RMMSPC AS RMMSPC_GPO, RESMST2.RMREPL AS RMREPL_GPO
FROM HDZALM.RESMST RESMST1
LEFT JOIN HDZGPO.RESMST RESMST2 ON RESMST2.RMRESC = RESMST1.RMRESC
LEFT OUTER JOIN HDZALM.RESMSA RESMSA ON RESMSA.NOPRODUCTO = RESMST1.RMRESC
											' ) ) MtxRecurso
) stg_AS400
INNER JOIN 
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
) AS stg_mdm
 ON stg_mdm.[Número de Recurso]=stg_AS400.[IDProducto_400]
LEFT JOIN ( select top 1 * from hdznt169.dwh_cdc.dbo.recurso) stg_dwh on stg_dwh.ID_Recurso=[Número de Recurso]

-- AS400 MARCA
SELECT  M.ST2 MARCA_ID,UPPER(M.ST3) AS MARCA_DESCIPCION
FROM (SELECT * FROM OPENQUERY(HDZ54, 'SELECT * from HDZMEN.FF01 CAT WHERE 	CAT.APL = ''EST'' AND  	CAT.ST1 = ''102'' AND SUBSTRING(CAT.ST2,2,1) <> ''*'' ')) M
ORDER BY 1 ASC

-- AS400 CATEGORIAS
SELECT  A.DCAT AS CATEGORIA_ID, UPPER(RTRIM(LEFT(B.ST3,39))) AS CATEGORIA_DESCRICION
FROM (SELECT * FROM OPENQUERY(HDZ54, 'SELECT * from HDZPC.EF803')) A
INNER JOIN  (SELECT * FROM OPENQUERY(HDZ54,'SELECT * from HDZMEN.FF01 WHERE 1=1 AND APL = ''EST''  AND ST1 = 224 ') ) B 
ON A.DCAT = B.ST2
GROUP BY A.DCAT , UPPER(RTRIM(LEFT(B.ST3,39)))
ORDER BY 1 ASC



