
SELECT * 
FROM 

(
SELECT
			  ISNULL(CAST(MtxRecurso.RMRESC AS Varchar),'')							AS [IDProducto_400]
			/*Secci�n Productos Inicio */
			, ISNULL(CAST(MtxRecurso.RMRSCL AS Varchar),'')							AS [Clase_400]
			, ISNULL(CAST(MtxRecurso.RMWGHT AS Varchar),'')							AS [Peso Bruto_400]
			, ISNULL(CAST(MtxRecurso.RMRSSC AS varchar), '')						AS [Subclase de recurso_400]
			, ISNULL(CAST(MtxRecurso.RMNETW AS Varchar),'')							AS [Peso Neto_400]
			, ISNULL(CAST(MtxRecurso.RMWTUM AS Varchar),'')							AS [Unidad de Medida de Peso_400]
			, ISNULL(CAST(MtxRecurso.RMUMSR AS Varchar),'')							AS [Unidad de Medida Est�ndar_400]
			, ISNULL(CAST(MtxRecurso.RMMIS2 AS Varchar),'')							AS [Piezas P Unidad de Venta_400]
			--, ISNULL(CAST(MtxRecurso.RMDTMT AS Varchar),'')							AS [Fecha de �ltimo Mtto_400] 
			, ISNULL(CAST(MtxRecurso.RMABCC AS Varchar),'')							AS [C�digo ABC_400]
			, ISNULL(CAST(MtxRecurso.RMMIS3 AS Varchar),'')							AS [Empaque Contenido_400]
			, ISNULL(CAST(MtxRecurso.RMLOTC AS Varchar),'')							AS [Control de Lote_400]
			--, ISNULL(CAST(MtxRecurso.RMDTAB AS Varchar),'')							AS [Fecha Actualizaci�n ABC_400]
			, ''																	AS [Fecha Actualizaci�n ABC_400]
			, ISNULL(CAST(MtxRecurso.RMBCON AS Varchar),'')							AS [Consumo en Lote_400]
			, ISNULL(CAST(LTRIM(MtxRecurso.RMMKPL) AS Varchar),'')					AS [Linea_400]
			, ISNULL(CAST(MtxRecurso.RMSHTG AS Varchar),'')							AS [Indicador insuficiencia_400]
			, ISNULL(CAST(MtxRecurso.RMBORC AS Varchar),'')							AS [C�digo Saldo Recurso_400]
			, ISNULL(CAST(MtxRecurso.RMTHEO AS Varchar),'')							AS [Consumo Te�rico_400]
			, ISNULL(CAST(MtxRecurso.RMPRCL AS Varchar),'')							AS [Clase Producto Producci�n_400]
			, ISNULL(CAST(MtxRecurso.RMPOTR AS Varchar),'')							AS [Recurso Potente_400]
			, ISNULL(CAST(MtxRecurso.RMPOTF AS Varchar),'')							AS [Factor de Potencia_400]
			, ISNULL(CAST(MtxRecurso.RMBEDT AS Varchar),'')							AS [Fecha Efectividad Inicial_400]
			, ISNULL(CAST(MtxRecurso.RMEEDT AS Varchar),'')							AS [Fecha Efectividad Final_400]
			, ISNULL(CAST(MtxRecurso.RMSFCT AS Varchar),'')							AS [Factor Merma_400]
			, ISNULL(CAST(MtxRecurso.RMJIT AS Varchar),'')							AS [Justo a Tiempo_400]
			, ISNULL(CAST(MtxRecurso.RMBOLH AS Varchar),'')							AS [Peligro BOL_400]
			, ISNULL(CAST(MtxRecurso.RMPRPL AS Varchar),'')							AS [L�nea Prod Producci�n_400]
			, ISNULL(CAST(MtxRecurso.RMTXCC AS Varchar),'')							AS [Cat�goria de Impuesto_400]
			, ISNULL(CAST(MtxRecurso.RMMIS1 AS Varchar),'')							AS [Status_400]
			, ISNULL(CAST(MtxRecurso.RMDESC AS Varchar),'')							AS [Descripci�n del Recurso_400]
			/*Secci�n Productos Fin */

			/*Secci�n Productos Almacen Inicio */
			, ISNULL(CAST(MtxRecurso.RMSUTR AS Varchar),'')							AS [Cantidad Estiba x Hilera_400]
			, ISNULL(CAST(MtxRecurso.RMSUUN AS Varchar),'')							AS [Cantidad Estiba x Unidad_400]
			, ISNULL(CAST(MtxRecurso.CAMASXTARIUNCARGA AS Varchar),'')				AS [Cantidad de Camas x Tarima_400]
			, ISNULL(CAST(MtxRecurso.RMSTHT AS Varchar),'')							AS [Altura de Estiba_400]
			, ISNULL(CAST(MtxRecurso.RMAGD1 AS Varchar),'')							AS [D�as Antig�edad 1_400]
			, ISNULL(CAST(MtxRecurso.RMHTSU AS Varchar),'')							AS [Caja Altura_400]
			, ISNULL(CAST(MtxRecurso.RMWDSU AS Varchar),'')							AS [Caja Ancho_400]
			, ISNULL(CAST(MtxRecurso.RMDPSU AS Varchar),'')							AS [Caja Profundidad_400]
			, ISNULL(CAST(MtxRecurso.RMHTUN AS Varchar),'')							AS [Tarima Altura_400]
			, ISNULL(CAST(MtxRecurso.RMWDUN AS Varchar),'')							AS [Tarima Ancho_400]
			, ISNULL(CAST(MtxRecurso.RMDPUN AS Varchar),'')							AS [Tarima Profundidad_400]
			, ISNULL(CAST(MtxRecurso.RMSTAG AS Varchar),'')							AS [Recurso en Planta_400]
			, ISNULL(CAST(MtxRecurso.RMRTST AS Varchar),'')							AS [Rotaci�n Inventario_400]
			, ISNULL(CAST(MtxRecurso.RMWNDW AS Varchar),'')							AS [Ventana de Env�o Directo_400]
			/*Secci�n Productos Almacen Fin */



			/*Secci�n Productos Aseg. Calidad Inicio */
			, ISNULL(CAST(MtxRecurso.RMSHLB AS Varchar),'')		AS [Vida �til_400]
			, ISNULL(CAST(MtxRecurso.RMSHLD AS Varchar),'')		AS [Vida �til - D�as_400]
			, ISNULL(CAST(MtxRecurso.RMDCPO AS Varchar),'')		AS [Recep Misc C�d Clasific Localiz Predet_400]
			, ISNULL(CAST(MtxRecurso.RMDCPR AS Varchar),'')		AS [Recep Prod C�d Clasific Localiz Predet_400]
			
			/*Secci�n Productos Aseg. Calidad Fin */

			/*Secci�n Productos C. Adicionales Inicio */

			--, ISNULL(CAST(MtxRecurso.RMSFTM AS Varchar),'')		AS [Tiempo de seguridad_400]
			--, ISNULL(CAST(MtxRecurso.RMRPCL AS Varchar),'')		AS [Clase de reporte_400]
			--, ISNULL(CAST(MtxRecurso.RMDOCU AS Varchar),'')		AS [C�d de localiz docum_400]
			--, ISNULL(CAST(MtxRecurso.RMMKCL AS Varchar),'')		AS [Cls Recurso Mercadeo_400]
			--, ISNULL(CAST(MtxRecurso.RMSICL AS Varchar),'')		AS [C�d clase inven est_400]
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
			--,ISNULL(CAST(MtxRecurso.RMCOMM AS Varchar),'')		AS [C�digo de mercanc�a_400]

			--,ISNULL(CAST(MtxRecurso.RMCREV AS Varchar),'')		AS [Nivel Revisi�n Actl_400]
			--,ISNULL(CAST(MtxRecurso.RMEREV AS Varchar),'')		AS [Ultimo Nivel Aceptab_400]
			--,ISNULL(CAST(MtxRecurso.RMBUYR AS Varchar),'')		AS [N�mero de comprador_400]
			--,ISNULL(CAST(MtxRecurso.RMSERV AS Varchar),'')		AS [Nivel Servicio A_400]
			--,ISNULL(CAST(MtxRecurso.RMCAPM AS Varchar),'')		AS [Multiplic Capacidad_400]
			--,ISNULL(CAST(MtxRecurso.RMRFCL AS Varchar),'')		AS [Rqd De Cd Clsif Lclz_400]
			--,ISNULL(CAST(MtxRecurso.RMPLT1 AS Varchar),'')		AS [TE 1 de OC_400]
			--,ISNULL(CAST(MtxRecurso.RMPHR1 AS Varchar),'')		AS [TE 1 OC hrs_400]
			--,ISNULL(CAST(MtxRecurso.RMPMN1 AS Varchar),'')		AS [TE 1 OC mns_400]
			--,ISNULL(CAST(MtxRecurso.RMPLT2 AS Varchar),'')		AS [TE 2 OC_400]
			--,ISNULL(CAST(MtxRecurso.RMPHR2 AS Varchar),'')		AS [TE 2 OC hrs_400]
			--,ISNULL(CAST(MtxRecurso.RMPMN2 AS Varchar),'')		AS [TE 2 OC mns_400]
			--,ISNULL(CAST(MtxRecurso.RMPLTN AS Varchar),'')		AS [TE OC p Nva Versi�n_400]
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
			--,ISNULL(CAST(MtxRecurso.RMPOQY AS Varchar),'')		AS [Cnt M�xima TE OC_400]
			--,ISNULL(CAST(MtxRecurso.RMMOQY AS Varchar),'')		AS [Cnt M�xima TE MO_400]
			--,ISNULL(CAST(MtxRecurso.RMSLLT AS Varchar),'')		AS [TE Ventas_400]
			--,ISNULL(CAST(MtxRecurso.RMSLHR AS Varchar),'')		AS [TE Ventas hrs_400]
			--,ISNULL(CAST(MtxRecurso.RMSLMN AS Varchar),'')		AS [TE Ventas mns_400]
			--,ISNULL(CAST(MtxRecurso.RMGRAP AS Varchar),'')		AS [C�digo de gr�ficos_400]
			--,ISNULL(CAST(MtxRecurso.RMDLPR AS Varchar),'')		AS [Loc Omis p Bolt Prd_400]
			--,ISNULL(CAST(MtxRecurso.RMDWPR AS Varchar),'')		AS [Alm Omis p Bolt Prd_400]
			--,ISNULL(CAST(MtxRecurso.RMCOM1 AS Varchar),'')		AS [C�digo 1 Cmt Omis_400]
			--,ISNULL(CAST(MtxRecurso.RMCOM2 AS Varchar),'')		AS [C�digo 2 Cmt Omis_400]
			--,ISNULL(CAST(MtxRecurso.RMCOM3 AS Varchar),'')		AS [C�digo 3 Cmt Omis_400]
			--,ISNULL(CAST(MtxRecurso.RMINQT AS Varchar),'')	AS [Acept Var Cnt Inv_400]
			--,ISNULL(CAST(MtxRecurso.RMDFIQ AS Varchar),'')	AS [Var Cnt Inv Omis_400]
			--,ISNULL(CAST(MtxRecurso.RMFRQT AS Varchar),'') 	AS [Var Cnt Bol Cmplt_400]
			----,ISNULL(CAST(MtxRecurso.RMDFFQ AS Varchar),'')    AS [Aplica Var Cnt Bol Cmplt_400]
			--,ISNULL(CAST(MtxRecurso.RMINQT AS Varchar),'')		AS [Acept Var Preci Inv_400]
			--,ISNULL(CAST(MtxRecurso.RMDFIP AS Varchar),'')		AS [Var Precio Inv Omi_400]
			--,ISNULL(CAST(MtxRecurso.RMURQT AS Varchar),'')		AS [Var Cnt D�fct Acep_400]
			--,ISNULL(CAST(MtxRecurso.RMDFUQ AS Varchar),'')		AS [Var Cnt D�fic Oms_400]
			--,ISNULL(CAST(MtxRecurso.RMORQT AS Varchar),'')		AS [Var Cnt sbr recp_400]
			--,ISNULL(CAST(MtxRecurso.RMDFOQ AS Varchar),'')		AS [Var Cnt SR Oms_400]
			--,ISNULL(CAST(MtxRecurso.RMZONE AS Varchar),'')		AS [D�as Zona Firme_400]
			--,ISNULL(CAST(MtxRecurso.RMUNPR AS Varchar),'')		AS [Precio Unit Omisi�n_400]
			--,ISNULL(CAST(MtxRecurso.RMRTTB AS Varchar),'')		AS [Tabla Fch Rotaci�n_400]
			--,ISNULL(CAST(MtxRecurso.RMFRCL AS Varchar),'')		AS [Clasif de transp_400]
			--,ISNULL(CAST(MtxRecurso.RMRCLS AS Varchar),'')		AS [Reclasif Autom�tica_400]
			--,ISNULL(CAST(MtxRecurso.RMAGD2 AS Varchar),'')		AS [D�as Antig�edad 2_400]
			--,ISNULL(CAST(MtxRecurso.RMAGD3 AS Varchar),'')		AS [D�as Antig�edad 3_400]
			--,ISNULL(CAST(MtxRecurso.RMAGD4 AS Varchar),'')		AS [D�as Antig�edad 4_400]
			--,ISNULL(CAST(MtxRecurso.RMAGD5 AS Varchar),'')		AS [D�as Antig�edad 5_400]
			--,ISNULL(CAST(MtxRecurso.RMDSTL AS Varchar),'')		AS [Loclzcn Planta_400]
			--,ISNULL(CAST(MtxRecurso.RMCHEM AS Varchar),'')		AS [F�rmula qu�mica_400]
			--,ISNULL(CAST(MtxRecurso.RMPRCA AS Varchar),'')		AS [IMPRIM C A_400]
			--,ISNULL(CAST(MtxRecurso.RMCASN AS Varchar),'')		AS [N�m caja_400]
			--,ISNULL(CAST(MtxRecurso.RMRGCT AS Varchar),'')		AS [Categor�a reglamet_400]
			--,ISNULL(CAST(MtxRecurso.RMSPDI AS Varchar),'')		AS [Trans DI Grp Substit_400]
			--,ISNULL(CAST(MtxRecurso.RMSPRC AS Varchar),'')		AS [Trans RC Grp Substit_400]
			--,ISNULL(CAST(MtxRecurso.RMUNIV AS Varchar),'')		AS [Recurso Universal_400]
			--,ISNULL(CAST(MtxRecurso.RMINQD AS Varchar),'')		AS [N D�as Adel Cons DAC_400]
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
			/*Secci�n Productos C. Adicionales Fin */

			/*Secci�n Productos C�digo Barra Inicio*/
			


			, RIGHT('000000000000000' + ISNULL(CAST(  MtxRecurso.CODBARRASUNCONSUMO AS Varchar),''),15)		AS [CB EAN13_400]
			,ISNULL(CAST(MtxRecurso.PESONETOCB1 AS Varchar),'')				AS [Peso Neto EAN 13_400]
			,ISNULL(CAST(MtxRecurso.PESOBRUTOCB1 AS Varchar),'')				AS [Peso Bruto EAN 13_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADPESO01 AS Varchar),'')			AS [Unidad Medida Peso EAN 13_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADLOGISTICA01 AS Varchar),'')		AS [Unidad Medida Est�ndar EAN 13_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDACB1 AS Varchar),'')						AS [Unidad Medida Dimensi�n EAN 13_400]
			,ISNULL(CAST(MtxRecurso.VOLUMENEXTCB1 AS Varchar),'')						AS [Vol�men Exterior EAN 13_400]
			,ISNULL(CAST(MtxRecurso.DIMINTALTOCB1 AS Varchar),'')				AS [Dimensi�n Interior Alto EAN 13_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTALTOCB1 AS Varchar),'')				AS [Dimensi�n Ext Alto EAN 13_400]
			,ISNULL(CAST(MtxRecurso.DIMINTANCCB1 AS Varchar),'')				AS [Dimensi�n Interior Ancho EAN 13_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTANCCB1 AS Varchar),'')				AS [Dimensi�n Ext Ancho EAN 13_400]
			,ISNULL(CAST(MtxRecurso.DIMINTPROFCB1 AS Varchar),'')				AS [Dimensi�n Interior Profundo EAN 13_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTPROFCB1 AS Varchar),'')				AS [Dimensi�n Ext Profundo EAN 13_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADPESO02 AS Varchar),'')	AS [Unidad Medida Peso DUN14_400]
			,ISNULL(CAST(MtxRecurso.PESONETOCB2 AS Varchar),'')					AS [Peso Neto DUN14_400]
			,ISNULL(CAST(MtxRecurso.PESOBRUTOCB2 AS Varchar),'')				AS [Peso Bruto DUN14_400]
			, RIGHT ('000000000000000' + ISNULL(CAST(MtxRecurso.CODBARRASUNEXPEDICION AS Varchar),''), 15)	AS [CB DUN14_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADLOGISTICA02 AS Varchar),'')		AS [Unidad Medida Est�ndar DUN14_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDACB2 AS Varchar),'')			AS [Unidad Medida Dimensi�n DUN14_400]
			,ISNULL(CAST(MtxRecurso.VOLUMENEXTCB2 AS Varchar),'')		AS [Vol�men Exterior DUN14_400]
			,ISNULL(CAST(MtxRecurso.DIMINTALTOCB2 AS Varchar),'')		AS [Dimensi�n Interior Alto DUN14_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTALTOCB2 AS Varchar),'')		AS  [Dimensi�n Ext Alto DUN14_400]
			,ISNULL(CAST(MtxRecurso.DIMINTANCCB2 AS Varchar),'')		AS [Dimensi�n Interior Ancho DUN14_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTANCCB2 AS Varchar),'')		AS [Dimensi�n Ext Ancho DUN14_400]
			,ISNULL(CAST(MtxRecurso.DIMINTPROFCB2 AS Varchar),'')		AS [Dimensi�n Interior Profundo DUN14_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTPROFCB2 AS Varchar),'')		AS [Dimensi�n Ext Profundo DUN14_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADPESO08 AS Varchar),'')		AS [Unidad Medida Peso DUN14T_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDAUNIDADLOGISTICA08 AS Varchar),'')	AS [Unidad Medida Est�ndar DUN14T_400]
			,RIGHT( '000000000000000' + ISNULL(CAST(MtxRecurso.CODBARRASUNCARGA AS Varchar),''), 15)		AS [CB DUN14T_400]
			,ISNULL(CAST(MtxRecurso.PESONETOCB8 AS Varchar),'')		AS [Peso Neto DUN14T_400]
			,ISNULL(CAST(MtxRecurso.PESOBRUTOCB8 AS Varchar),'')		AS [Peso Bruto DUN14T_400]
			,ISNULL(CAST(MtxRecurso.UNIDADMEDIDACB8 AS Varchar),'')		AS [Unidad Medida Dimensi�n DUN14T_400]
			,ISNULL(CAST(MtxRecurso.VOLUMENEXTCB8 AS Varchar),'')		AS [Vol�men Exterior DUN14T_400]
			,ISNULL(CAST(MtxRecurso.DIMINTALTOCB8 AS Varchar),'')		AS [Dimensi�n Interior Alto DUN14T_400]
			,ISNULL(CAST(MtxRecurso.DIMINTANCCB8 AS Varchar),'')		AS [Dimensi�n Interior Ancho DUN14T_400]
			,ISNULL(CAST(MtxRecurso.DIMINTPROFCB8 AS Varchar),'')		AS [Dimensi�n Interior Profundo DUN14T_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTALTOCB8 AS Varchar),'')		AS [Dimensi�n Ext Alto DUN14T_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTANCCB8 AS Varchar),'')		AS [Dimensi�n Ext Ancho DUN14T_400]
			,ISNULL(CAST(MtxRecurso.DIMEXTPROFCB8 AS Varchar),'')		AS [Dimensi�n Ext Profundo DUN14T_400]

			/*Secci�n Productos C�digo Barra Fin*/
			/*Secci�n Productos Comentario Inicio*/
			--,ISNULL(CAST(MtxRecurso.RNDTMT AS Varchar),'')		AS [Fecha de �ltimo Mtto_400]
			--,ISNULL(CAST(MtxRecurso.RNSEQN AS Varchar),'')		AS [No_400]
			--,ISNULL(CAST(MtxRecurso.RNCNMT AS Varchar),'')		AS [Comentario_400]
			/*Secci�n Productos Comentario Fin*/
			/*Secci�n Productos Compras Inicio*/
			
			,ISNULL(CAST(MtxRecurso.RMUMPR AS Varchar),'')		AS [UM Compras_400]
			,ISNULL(CAST(MtxRecurso.RMVNAP AS Varchar),'')		AS [C�d Aprob Proveedor Y N_400]
			,ISNULL(CAST(MtxRecurso.RMTAXC AS Varchar),'')		AS [C�digo Imponible_400]
			/*Secci�n Productos Compras Fin*/

			/*Secci�n Productos Costos Inicio*/
			,ISNULL(CAST(MtxRecurso.RMFCLC AS Varchar),'')	AS [C�digo Nivel Costeo Fijo_400]
			--,ISNULL(CAST(MtxRecurso.RMCSTP AS Varchar),'')		AS [C�digo Tipo Acum Costo_400] --C,N
			,ISNULL(CAST(MtxRecurso.RMSTDC AS Varchar),'')		AS [Costo Est�ndar_A_400]
			,ISNULL(CAST(MtxRecurso.RMSTDC_GPO AS Varchar),'')		AS [Costo Est�ndar_G_400]
			--,ISNULL(CAST(MtxRecurso.RMDTLR AS Varchar),'')	AS [Fecha �ltima Acumulaci�n_400]
			,ISNULL(CAST(MtxRecurso.RMCLC AS Varchar),'')		AS [C�digo Nivel Costeo_400]
			,ISNULL(CAST(MtxRecurso.RMSELC AS Varchar),'')		AS [Costo Unitario Seleccionado_400]
			,ISNULL(CAST(MtxRecurso.RMPVCS AS Varchar),'')		AS [Costo �ltima Acumulaci�n_400]
			,ISNULL(CAST(MtxRecurso.RMNRVL AS Varchar),'')		AS [Uso Valor Neto Realiz_400]
			,ISNULL(CAST(MtxRecurso.RMCRLC AS Varchar),'')		AS [C�d Clase Nivel Acum Cost_400] --C,N
			,ISNULL(CAST(MtxRecurso.RMRCST AS Varchar),'')		AS [Nuevo Costeo_400]
			,ISNULL(CAST(MtxRecurso.RMCSRU AS Varchar),'')		AS [M�t Costeo Acum Costo_400]
			,ISNULL(CAST(MtxRecurso.RMPCTP AS Varchar),'')		AS [Tipo MP Prim p Costo_400]
			,ISNULL(CAST(MtxRecurso.RMPCNM AS Varchar),'')		AS [Nmb MP Prim p Costo_400]

			/*Secci�n Productos Costos Fin*/
			/*Secci�n Productos Extendido Inicio*/

			,ISNULL(CAST(MtxRecurso.DEPRODUCTO AS Varchar),'')		AS [Descripci�n Larga del Producto_400]
			,ISNULL(CAST(MtxRecurso.NUFICHATECNICA AS Varchar),'')		AS [N�mero Ficha T�cnica_400]
			,ISNULL(CAST(MtxRecurso.UNIDADEMPAQUE AS Varchar),'')		AS [Unidad Empaque_400]
			,ISNULL(CAST(MtxRecurso.TIEMPAQUEPRIM AS Varchar),'')		AS [Tipo Empaque Primario_400]
			,ISNULL(CAST(MtxRecurso.CASA AS Varchar),'')		AS [Clave de Marca_400]
			,ISNULL(CAST(MtxRecurso.CIAALFA AS Varchar),'')		AS [Clave Compa��a Alfanum_400]
			,ISNULL(CAST(MtxRecurso.CIA AS Varchar),'')		AS [N�mero de Compa��a_400]
			,ISNULL(CAST(MtxRecurso.COMPANIAAMECE AS Varchar),'')		AS [Compa��a AMECE_400]
			,ISNULL(CAST(MtxRecurso.RMSELP AS Varchar),'')		AS [Precio de Venta_400]
			,ISNULL(CAST(MtxRecurso.NOPRODUCTO AS Varchar),'')		AS [N�mero del Producto_400]
			,ISNULL(CAST(MtxRecurso.CODBARRASUNCONSUMO AS Varchar),'')		AS [EAN13_400]
			,ISNULL(CAST(MtxRecurso.CODBARRASUNEXPEDICION AS Varchar),'')		AS [DUN14_400]
			,ISNULL(CAST(MtxRecurso.CODBARRASUNCARGA AS Varchar),'')		AS [DUN14T_400]
			,ISNULL(CAST(MtxRecurso.CATIMPUESTOS2 AS Varchar),'')		AS [Categor�a de Impuestos_400]

			/*Secci�n Productos Extendido Fin*/

			/*Secci�n Productos Planeaci�n Inicio*/

			,''	AS [C�d Pol�tica Orden Programa_400]
			,ISNULL(CAST(MtxRecurso.RMORPL AS Varchar),'')	AS [C�d Pol�tica Orden Programa_A_400]
			,ISNULL(CAST(MtxRecurso.RMORPL_GPO AS Varchar),'')	AS [C�d Pol�tica Orden Programa_G_400]

			,''		AS [C�digo Origen M P_400]
			,ISNULL(CAST(MtxRecurso.RMWHFM AS Varchar),'') AS [C�digo Origen M P_A_400]
			,ISNULL(CAST(MtxRecurso.RMWHFM_GPO AS Varchar),'') AS [C�digo Origen M P_G_400]
			,ISNULL(CAST(MtxRecurso.RMPLAN AS Varchar),'')		AS [N�mero de Planificador_400]
			,ISNULL(CAST(MtxRecurso.RMORAM AS Varchar),'')		AS [Cantidad Orden Prog Fijo_400]
			,''		AS [Indicador Nueva Planif_400]
			,ISNULL(CAST(MtxRecurso.RMREPL AS Varchar),'')      AS [Indicador Nueva Planif_A_400]
			,ISNULL(CAST(MtxRecurso.RMREPL_GPO AS Varchar),'')      AS [Indicador Nueva Planif_G_400]
			,ISNULL(CAST(MtxRecurso.RMMNPQ AS Varchar),'')		AS [Ctn Orden Progr Min_400]
			,ISNULL(CAST(MtxRecurso.RMSFST AS Varchar),'')		AS [Inventario de Seguridad_400]
			,''		AS [C�digo PMP_400]
			,ISNULL(CAST(MtxRecurso.RMMSPC AS Varchar),'')      AS [C�digo PMP_A_400]
			,ISNULL(CAST(MtxRecurso.RMMSPC_GPO AS Varchar),'')      AS [C�digo PMP_G_400]
			,ISNULL(CAST(MtxRecurso.RMMXPQ AS Varchar),'')		AS [Ctn Orden Progr M�x_400]
			--,ISNULL(CAST(MtxRecurso.RMPPTP AS Varchar),'')		AS [Tipo MP Planificaci�n Prima_400]
			,ISNULL(CAST(MtxRecurso.RMPPNM AS Varchar),'')		AS [Nombre MP Planif Prima_400]
			,ISNULL(CAST(MtxRecurso.RMMPFT AS Varchar),'')		AS [Ctn Orden Progr Mul_400]
			,ISNULL(CAST(MtxRecurso.RMPLVB AS Varchar),'')		AS [C�d Nivel Planif Fijo_400]
			,ISNULL(CAST(MtxRecurso.RMPLVC AS Varchar),'')		AS [C�d Nivel Planificaci�n_400]
			,ISNULL(CAST(MtxRecurso.RMSTPC AS Varchar),'')		AS [C�digo Plazo Corto_400]
			,ISNULL(CAST(MtxRecurso.RMLTPC AS Varchar),'')		AS [C�digo Plazo Largo_400]
			,ISNULL(CAST(MtxRecurso.RMRCLT AS Varchar),'')		AS [Calc de Nvo Tiempo Espera_400]
			,ISNULL(CAST(MtxRecurso.RMITPC AS Varchar),'')		AS [C�digo Plazo Intermedio_400]
			,ISNULL(CAST(MtxRecurso.RMPEGC AS Varchar),'')		AS [C�digo de Identificaci�n_400]
			,ISNULL(CAST(MtxRecurso.RMORDY AS Varchar),'')		AS [D�as de Abastecimiento_400]

			/*Secci�n Productos Planeaci�n Fin*/

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
) AS stg_mdm
 ON stg_mdm.[N�mero de Recurso]=stg_AS400.[IDProducto_400]
LEFT JOIN ( select top 1 * from hdznt169.dwh_cdc.dbo.recurso) stg_dwh on stg_dwh.ID_Recurso=[N�mero de Recurso]

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



