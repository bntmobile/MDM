/* 
 ---- CUENTA NÚMEROS DE RECURSOS QUE SON PT

SELECT COUNT(P.NumeroDeRecurso)
FROM       HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos] P							WITH(NOLOCK)
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].Clases C								WITH(NOLOCK)  ON P.ClaseId=C.MvcId 
WHERE 1=1
AND C.Codigo='PT'

*/


SELECT 
  P.NumeroDeRecurso																				AS [IDProducto]	
, ISNULL(CAST(CDAR.Codigo+' '+ CDAR.Nombre				AS Varchar),'')							AS [Clave de Actualizacion]	
, ISNULL(CAST(P.EnviadoA400								AS Varchar),'')							AS [Enviado a 400]
, ISNULL(CAST(ST.Codigo+' '+ST.Nombre					AS Varchar),'')							AS [Status_Name]
, ISNULL(CAST(C.Codigo									AS Varchar),'')  						AS [Clase]
, ISNULL(CAST(P.PesoBruto								AS Varchar),'')							AS [Peso Bruto]
, ISNULL(CAST(SC.ClaveDeSubclase						AS Varchar),'')							AS [Subclase de recurso]
, ISNULL(CAST(P.PesoNeto								AS Varchar),'')							AS [Peso Neto]
, ISNULL(CAST(UDM.Codigo								AS Varchar),'')							AS [Unidad de Medida de Peso]
, ISNULL(CAST(UDM2.Codigo								AS Varchar),'')							AS [Unidad de Medida Estándar]
, ISNULL(CAST(P.PiezasPUnidadDeVenta					AS Varchar),'')							AS [Piezas P Unidad de Venta] 
, ISNULL(CAST(C_ABC.Codigo 								AS Varchar),'')							AS [Código ABC]
, ISNULL(CAST(P.EmpaqueContenido						AS Varchar),'')							AS [Empaque Contenido]
, CASE WHEN P.ControlDeLote= 1 THEN 'Y' WHEN P.ControlDeLote= 0 THEN 'N'	 ELSE ''		END	AS [Control de Lote]
, ''																							AS [Fecha Actualización ABC]
, CASE WHEN  P.ConsumoEnLote= 1 THEN 'Y' WHEN  P.ConsumoEnLote= 0 THEN 'N'	 ELSE ''		END	AS [Consumo en Lote]
, ISNULL(CAST(L.ClaveDeLinea							AS Varchar),'')							AS [Linea]
, CASE WHEN  P.IndicadorInsuficiencia= 1 THEN 'Y' WHEN  P.IndicadorInsuficiencia= 0 THEN 'N'	 ELSE '' END	 AS [Indicador insuficiencia]
, ISNULL(CAST(P.CodigoSaldoRecurso						AS Varchar),'')							AS [Código Saldo Recurso]
, ISNULL(CAST(P.ConsumoTeorico							AS Varchar),'')							AS [Consumo Teórico]
, ISNULL(CAST(P.ClaseProductoProduccion					AS Varchar),'')							AS [Clase Producto Producción]
, CASE WHEN  P.RecursoPotente= 1 THEN 'Y' WHEN  P.RecursoPotente= 0 THEN 'N'	 ELSE '' END	AS [Recurso Potente]
, ISNULL(CAST(P.FactorPotencia							AS Varchar),'')							AS [Factor de Potencia]
, ISNULL(CAST(P.FechaEfectividadInicial					AS Varchar),'')							AS [Fecha Efectividad Inicial]
, ISNULL(CAST(P.FechaEfectividadFinal					AS Varchar),'')							AS [Fecha Efectividad Final]
, ISNULL(CAST(P.FactorMerma								AS Varchar),'')							AS [Factor Merma]
, CASE WHEN  P.JustoATiempo= 1 THEN 'Y' WHEN  P.JustoATiempo= 0 THEN 'N'	 ELSE '' END AS [Justo a Tiempo]
, CASE WHEN  P.PeligroBol= 1 THEN 'Y' WHEN  P.PeligroBol= 0 THEN 'N'	 ELSE '' END AS [Peligro BOL]
, ISNULL(CAST(P.LineaProdProduccion						AS Varchar),'')							AS [Línea Prod Producción]
, ISNULL(CAST(IMPG.Codigo								AS Varchar),'')							AS [Catégoria de Impuesto] 
, CASE  WHEN ST.Nombre='A DESCONTINUAR' OR ST.NOMBRE='DESCONTINUADOS' then ST.Codigo WHEN O.Nombre='IMPORTACIÓN' then O.Codigo WHEN M.Nombre = 'EXPORTACION' then M.Codigo ELSE T.Codigo END AS [Status] -- COMPARTIÓ LA REGLA ÁNGEL ACUÑA
, ISNULL(CAST(P.DescripcionDelRecurso 					AS Varchar),'')							AS [Descripción del Recurso] 
, ISNULL(CAST(PA.CantidadEstibaxHilera					AS Varchar),'')							AS [Cantidad Estiba x Hilera] 
, ISNULL(CAST(PA.CantidadEstibaxUnidad					AS Varchar),'')							AS [Cantidad Estiba x Unidad] 
, ISNULL(CAST(PA.CantidadDeCamasxTarima					AS Varchar),'')							AS [Cantidad de Camas x Tarima] 
, ISNULL(CAST(PA.AlturaDeEstiba							AS Varchar),'')							AS [Altura de Estiba] 
, ISNULL(CAST(PA.DiasAntiguedad1						AS Varchar),'')							AS [Días Antigüedad 1] 
, ISNULL(CAST(PA.CajaAltura								AS Varchar),'')							AS [Caja Altura] 
, ISNULL(CAST(PA.CajaAncho								AS Varchar),'')							AS [Caja Ancho] 
, ISNULL(CAST(PA.CajaProfundidad						AS Varchar),'')							AS [Caja Profundidad]
, ISNULL(CAST(PA.TarimaAltura							AS Varchar),'')							AS [Tarima Altura] 
, ISNULL(CAST(PA.TarimaAncho							AS Varchar),'')							AS [Tarima Ancho] 
, ISNULL(CAST(PA.TarimaProfundidad						AS Varchar),'')							AS [Tarima Profundidad] 
, ISNULL(CAST(PA.RecursoEnPlanta						AS Varchar),'')							AS [Recurso en Planta] 
, ISNULL(CAST(PA.RotacionInventario						AS Varchar),'')							AS [Rotación Inventario]
, ISNULL(CAST(PA.VentanaDeEnvioDirecto					AS Varchar),'')							AS [Ventana de Envío Directo]
, ISNULL(CAST(PADC.VidaUtil								AS Varchar),'')							AS [Vida Útil]
, ISNULL(CAST(PADC.VidaUtilDias							AS Varchar),'')							AS [Vida Útil - Días]
, ISNULL(CAST(PADC.RecepMiscCodClasificLocalizPredet	AS Varchar),'')							AS [Recep Misc Cód Clasific Localiz Predet] 
, ISNULL(CAST(PADC.RecepProdCodClasificLocalizPredet	AS Varchar),'')							AS [Recep Prod Cód Clasific Localiz Predet]
, ISNULL(CAST(PCDB.Ean13								AS Varchar),'')							AS [CB EAN13]
, ISNULL(CAST(PCDB.PesoNetoEan13						AS Varchar),'')							AS [Peso Neto EAN 13]
, ISNULL(CAST(PCDB.PesoBrutoEan13						AS Varchar),'')							AS [Peso Bruto EAN 13]
, ISNULL(CAST(UMPEA.Codigo								AS Varchar),'')							AS [Unidad Medida Peso EAN 13]
, ISNULL(CAST(UMEEA.Codigo								AS Varchar),'')							AS [Unidad Medida Estándar EAN 13]
, ISNULL(CAST(UMDEA.Codigo 								AS Varchar),'')							AS [Unidad Medida Dimensión EAN 13]		
, ISNULL(CAST(PCDB.VolumenExteriorEan13					AS Varchar),'')							AS [Volúmen Exterior EAN 13]
, ISNULL(CAST(PCDB.DimensionInteriorAltoEan13			AS Varchar),'')							AS [Dimensión Interior Alto EAN 13]
, ISNULL(CAST(PCDB.DimensionExtAltoEan13				AS Varchar),'')							AS [Dimensión Ext Alto EAN 13]
, ISNULL(CAST(PCDB.DimensionInteriorAnchoEan13			AS Varchar),'')							AS [Dimensión Interior Ancho EAN 13]
, ISNULL(CAST(PCDB.DimensionExtAnchoEan13				AS Varchar),'')							AS [Dimensión Ext Ancho EAN 13]
, ISNULL(CAST(PCDB.DimensionInteriorProfundoEan13		AS Varchar),'')							AS [Dimensión Interior Profundo EAN 13]
, ISNULL(CAST(PCDB.DimensionExtProfundoEan13			AS Varchar),'')							AS [Dimensión Ext Profundo EAN 13]
, ISNULL(CAST(UMPDU.Codigo								AS Varchar),'')							AS [Unidad Medida Peso DUN14] 
, ISNULL(CAST(PCDB.PesoNetoDun14						AS Varchar),'')							AS [Peso Neto DUN14]
, ISNULL(CAST(PCDB.PesoBrutoDun14						AS Varchar),'')							AS [Peso Bruto DUN14]
, ISNULL(CAST(PCDB.Dun14								AS Varchar),'')							AS [CB DUN14]
, ISNULL(CAST(UMEDU.Codigo								AS Varchar),'')							AS [Unidad Medida Estándar DUN14]  
, ISNULL(CAST(UMDDU.Codigo								AS Varchar),'')							AS [Unidad Medida Dimensión DUN14]
, ISNULL(CAST(PCDB.VolumenExteriorDun14					AS Varchar),'')							AS [Volúmen Exterior DUN14]
, ISNULL(CAST(PCDB.DimensionInteriorAltoDun14			AS Varchar),'')							AS [Dimensión Interior Alto DUN14]
, ISNULL(CAST(PCDB.DimensionExtAltoDun14				AS Varchar),'')							AS [Dimensión Ext Alto DUN14]
, ISNULL(CAST(PCDB.DimensionInteriorAnchoDun14			AS Varchar),'')							AS [Dimensión Interior Ancho DUN14]
, ISNULL(CAST(PCDB.DimensionExtAnchoDun14				AS Varchar),'')							AS [Dimensión Ext Ancho DUN14]
, ISNULL(CAST(PCDB.DimensionInteriorProfundodun14 		AS Varchar),'')							AS [Dimensión Interior Profundo DUN14]
, ISNULL(CAST(PCDB.DimensionExtProfundoDun14			AS Varchar),'')							AS [Dimensión Ext Profundo DUN14]
, ISNULL(CAST(UMDDU1.Codigo								AS Varchar),'')							AS [Unidad Medida Peso DUN14T]
, ISNULL(CAST(UMDDU4.Codigo								AS Varchar),'')							AS [Unidad Medida Estándar DUN14T]
, ISNULL(CAST(PCDB.Dun14T								AS Varchar),'')							AS [CB DUN14T]
, ISNULL(CAST(PCDB.PesoNetoDun14T 						AS Varchar),'')							AS [Peso Neto DUN14T]
, ISNULL(CAST(PCDB.PesoBrutoDun14T						AS Varchar),'')							AS [Peso Bruto DUN14T]
, ISNULL(CAST(UMD14.Codigo								AS Varchar),'')							AS [Unidad Medida Dimensión DUN14T]
, ISNULL(CAST(PCDB.VolumenExteriorDun14T				AS Varchar),'')							AS [Volúmen Exterior DUN14T]
, CASE WHEN  PCDB.DimensionInteriorAltoDun14T = 0.000000 THEN 0.000000 ELSE ISNULL(PCDB.DimensionInteriorAltoDun14T ,0.000000)	END	AS [Dimensión Interior Alto DUN14T]
, ISNULL(CAST(PCDB.DimensionInteriorAnchoDun14T			AS Varchar),'')								AS [Dimensión Interior Ancho DUN14T]
, ISNULL(CAST(PCDB.DimensionInteriorProfundoDun14T		AS Varchar),'')								AS [Dimensión Interior Profundo DUN14T]
, ISNULL(CAST(PCDB.DimensionExtAltoDun14T				AS Varchar),'')								AS [Dimensión Ext Alto DUN14T]
, ISNULL(CAST(PCDB.DimensionExtAnchoDun14T				AS Varchar),'')								AS [Dimensión Ext Ancho DUN14T]
, ISNULL(CAST(PCDB.DimensionExtProfundoDun14T			AS Varchar),'')								AS [Dimensión Ext Profundo DUN14T]
, ISNULL(CAST(UMC.Codigo								AS Varchar),'')								AS [UM Compras]					
, ISNULL(CAST(PC.CodAprobProveedorYn					AS Varchar),'')								AS [Cód Aprob Proveedor Y N]
, ISNULL(CAST(PC.CodigoImponible						AS Varchar),'')								AS [Código Imponible]
, ISNULL(CAST(PC1.CodigoNivelCosteoFijo  				AS Varchar),'')								AS [Código Nivel Costeo Fijo]
, ISNULL(CAST(PC2.CodigoEstandar						AS Varchar),'')								AS [Costo Estándar_A]
, ISNULL(CAST(PC1.CodigoEstandar						AS Varchar),'')								AS [Costo Estándar_G]
, ISNULL(CAST(PC1.CodigoNivelCosteo						AS Varchar),'')								AS [Código Nivel Costeo]
, ISNULL(CAST(CUS.Codigo								AS Varchar),'')								AS [Costo Unitario Seleccionado] 
, ISNULL(CAST(PC1.CostoUltimaAcumulacion				AS Varchar),'')								AS [Costo Última Acumulación]
, ISNULL(CAST(PC1.UsoValorNetoRealiz					AS Varchar),'')								AS [Uso Valor Neto Realiz]
, ISNULL(CAST(CNAC.Codigo								AS Varchar),'')								AS [Cód Clase Nivel Acum Cost]
, ISNULL(CAST(PC1.NuevoCosteo							AS Varchar),'')								AS [Nuevo Costeo]
, ISNULL(CAST(MCAC.Codigo								AS Varchar),'')								AS [Mét Costeo Acum Costo]
, ISNULL(CAST(PC1.TipoMpPrimPCosto						AS Varchar),'')								AS [Tipo MP Prim p Costo]
, ISNULL(CAST(PC1.NmbMpPrimPCosto						AS Varchar),'')								AS [Nmb MP Prim p Costo]
, ISNULL(CAST(PE.DescripcionLargaDelProducto			AS Varchar),'')							AS [Descripción Larga del Producto]
, ISNULL(CAST(PE.NumeroFichaTecnica						AS Varchar),'')							AS [Número Ficha Técnica]
, ISNULL(CAST(PE.UnidadEmpaque							AS Varchar),'')							AS [Unidad Empaque]
, ISNULL(CAST(TDE.Nombre								AS Varchar),'')							AS [Tipo Empaque Primario]
, ISNULL(CAST(CV.Codigo									AS Varchar),'')							AS [Clave de Marca]
, ISNULL(CAST(CAN.Codigo								AS Varchar),'')							AS [Clave Compañía Alfanum]
, ISNULL(CAST(NCIA.Codigo								AS Varchar),'')							AS [Número de Compañía]
, ISNULL(CAST(PE.CompaniaAmece							AS Varchar),'')							AS [Compañía AMECE]
, ISNULL(CAST(PE.PrecioDeVenta							AS Varchar),'')							AS [Precio de Venta]
, ISNULL(CAST(PE.NumeroDelProducto						AS Varchar),'')							AS [Número del Producto]
, ISNULL(CAST(PE.Ean13									AS Varchar),'')							AS [EAN13]
, ISNULL(CAST(PE.Dun14 									AS Varchar),'')							AS [DUN14]
, ISNULL(CAST(PE.Dunt14T								AS Varchar),'')							AS [DUN14T]
, ISNULL(CAST(IMPI.Codigo								AS Varchar),'')							AS [Categoría de Impuestos] 
, ISNULL(CAST(PO.Codigo									AS Varchar),'')							AS [Cód Política Orden Programa]
, ISNULL(CAST(CDO.Codigo								AS Varchar),'')							AS [Código Origen M P]
, ISNULL(CAST(PP.NumeroDePlanificador					AS Varchar),'')							AS [Número de Planificador]
, ISNULL(CAST(PP.CantidadOrdenProgFijo					AS Varchar),'')							AS [Cantidad Orden Prog Fijo]
, ISNULL(CAST(PP.IndicadorNuevaPlanif					AS Varchar),'')							AS [Indicador Nueva Planif]
, ISNULL(CAST(PP.CtnOrdenProgrMin						AS Varchar),'')							AS [Ctn Orden Progr Min]
, ISNULL(CAST(PP.InventarioDeSeguridad					AS Varchar),'')							AS [Inventario de Seguridad]
, ISNULL(CAST(CPMP.Codigo								AS Varchar),'')							AS [Código PMP]
, ISNULL(CAST(PP.CtnOrdenProgrMax						AS Varchar),'')							AS [Ctn Orden Progr Máx]
, ISNULL(CAST(PP.NombreMpPlanifPrima					AS Varchar),'')							AS [Nombre MP Planif Prima]
, ISNULL(CAST(PP.CtnOrdenProgrMul						AS Varchar),'')							AS [Ctn Orden Progr Mul]
, ISNULL(CAST(PP.CodNivelPlanifFijo						AS Varchar),'')							AS [Cód Nivel Planif Fijo]
, ISNULL(CAST(PP.CodNivelPlanificacion					AS Varchar),'')							AS [Cód Nivel Planificación]
, ISNULL(CAST(PP.CodigoPlazoCorto						AS Varchar),'')							AS [Código Plazo Corto]
, ISNULL(CAST(PP.CodigoPlazoLargo						AS Varchar),'')							AS [Código Plazo Largo]
, ISNULL(CAST(PP.CalcDeNvoTiempoEspera					AS Varchar),'')							AS [Calc de Nvo Tiempo Espera]
, ISNULL(CAST(PP.CodigoPlazoIntermedio					AS Varchar),'')							AS [Código Plazo Intermedio]
, ISNULL(CAST(PP.CodigodeIdentificación					AS Varchar),'')							AS [Código de Identificación]
, ISNULL(CAST(PP.DíasDeAbastecimiento					AS Varchar),'')							AS [Días de Abastecimiento]
FROM       HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos] P							WITH(NOLOCK)
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].Clases C								WITH(NOLOCK)  ON P.ClaseId=C.MvcId 
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ClavesDeActualizacionRecurso] CDAR	WITH(NOLOCK)  ON P.ClaveDeActualizacionID=CDAR.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[SubsClaseDeMaterial] SC				WITH(NOLOCK)  ON P.SubClaseDeMaterialId =SC.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Miscelaneos] ST						WITH(NOLOCK)  ON P.StatusId=ST.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[UnidadesDeMedida] UDM					WITH(NOLOCK)  ON P.UnidadDeMedidaDePesoId=UDM.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[UnidadesDeMedida] UDM2				WITH(NOLOCK)  ON P.UnidadDeMedidaEstandarId=UDM2.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Abc] C_ABC							WITH(NOLOCK)  ON P.CodigoAbcId=C_ABC.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].Lineas L								WITH(NOLOCK)  ON P.LineaId=L.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].Impuestos IMPG							WITH(NOLOCK)  ON P.CategoriaDeImpuestoId=IMPG.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Origenes] O							WITH(NOLOCK)  ON O.MVCID=P.OrigenId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Mercados] M							WITH(NOLOCK)  ON M.MVCID=P.MercadoId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Tipos] T								WITH(NOLOCK)  ON T.MVCID=P.TipoID
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosAlmacen] PA					WITH(NOLOCK)  ON PA.CodigoDeProductoId=P.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosAsegCalidad] PADC			WITH(NOLOCK)  ON P.MvcId=PADC.CodigoDeProductoId	
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosCodigosDeBarras] PCDB		WITH(NOLOCK)  ON P.MvcId=PCDB.CodigoDeProductoId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[UnidadesDeMedida] UMPEA				WITH(NOLOCK)  ON PCDB.UnidadMedidaPesoEan13Id=UMPEA.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[UnidadesDeMedida] UMEEA				WITH(NOLOCK)  ON PCDB.UnidadMedidaEstandarEan13Id=UMEEA.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[UnidadesDeMedida] UMDEA				WITH(NOLOCK)  ON PCDB.UnidadMedidaDimensionEan13Id= UMDEA.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[UnidadesDeMedida] UMPDU				WITH(NOLOCK)  ON PCDB.UnidadMedidaPesoDun14Id = UMPDU.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[UnidadesDeMedida] UMEDU				WITH(NOLOCK)  ON PCDB.UnidadMedidaEstandarDun14Id=UMEDU.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[UnidadesDeMedida] UMDDU				WITH(NOLOCK)  ON PCDB.UnidadMedidaDimensionDun14Id= UMDDU.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[UnidadesDeMedida] UMDDU1              WITH(NOLOCK)  ON PCDB.UnidadMedidaPesoDun14TId= UMDDU1.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[UnidadesDeMedida] UMDDU4				WITH(NOLOCK)  ON PCDB.UnidadMedidaEstandarDun14TId=UMDDU4.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[UnidadesDeMedida] UMD14				WITH(NOLOCK)  ON PCDB.UnidadMedidaDimensionDun14TId=UMD14.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosCompra] PC 				    WITH(NOLOCK)  ON P.MVCid=PC.CodigoDeProductoId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[UnidadesDeMedida] UMC 				WITH(NOLOCK)  ON PC.UmComprasId= UMC.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosCosto] PC1 					WITH(NOLOCK)  ON PC1.Entidad='GRUPO'     AND P.MvcId=PC1.ProductoId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosCosto] PC2 					WITH(NOLOCK)  ON PC2.Entidad='ALMACENES' AND P.MvcId=PC2.ProductoId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[CostosUnitariosSeleccionados] CUS 	WITH(NOLOCK)  ON PC1.CostoUnitarioSeleccionadoId=CUS.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ClasesNivelAcumCosto] CNAC			WITH(NOLOCK)  ON CNAC.mvcid = PC1.CodClaseNivelAcumCostId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[MetodosCosteoAcumCosto] MCAC			WITH(NOLOCK)  ON MCAC.mvcid = PC1.MetCosteoAcumCostoId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosExtendido]  PE				WITH(NOLOCK)  ON P.MvcId=PE.CodigoDeProductoId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[TiposDeEnvase] TDE 					WITH(NOLOCK)  ON PE.TipoEmpaquePrimarioId=TDE.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ClavesDeMarca] CV 					WITH(NOLOCK)  ON PE.ClaveDeMarcaId=CV.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[CompaniasAlfabetica] CAN 				WITH(NOLOCK)  ON PE.ClaveCompaniaAlfanumId=CAN.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[CompaniasNumerica] NCIA 				WITH(NOLOCK)  ON PE.NumeroDeCompaniaId=NCIA.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].Impuestos IMPI							WITH(NOLOCK)  ON PE.CategoriaDeImpuestoId=IMPI.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosPlaneacion] PP				WITH(NOLOCK)  ON P.MvcId =PP.ProductoId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[PoliticasdeOrden] PO					WITH(NOLOCK)  ON PP.PoliticadeOrdenId=PO.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[CodigosdeOrigen] CDO					WITH(NOLOCK)  ON PP.CodigoDeOrigenMpId=CDO.MvcId
LEFT JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[CodigosPmp]  CPMP						WITH(NOLOCK)  ON PP.CodigoPmpId=CPMP.MvcId
WHERE 1=1
AND C.Codigo='PT'
--AND P.NumeroDeRecurso  in ( '005081','005083','005084')


/*
SE REVISA DUPLICIDAD EN TABLA.[MVCRecursos].[dbo].ProductosCostos
-- HOY 23 DE JULIO YA NO ESTÁ LA DUPLICIDAD

SELECT		P.NumeroDeRecurso ,PC.Entidad, count(1)
FROM        HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos] P							WITH(NOLOCK)
INNER JOIN  HSVDMDDBPPSQL.[MVCRecursos].[dbo].[ProductosCosto] PC 	WITH(NOLOCK) ON P.mvcid=PC.productoid
--WHERE  P.NumeroDeRecurso in ('005081','005083','005084') 
GROUP BY  P.NumeroDeRecurso ,PC.Entidad
HAVING COUNT (1)>1


*/
-- 9860 23 Julio 2018 15:28 P.M.