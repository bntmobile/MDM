
 --  Campos CODIGO de BARRAS

			Select
			  RR.RMRESC
			-- 062 **************************************************
--			, Case When RR.RMDESC = PP.[Descripción del Recurso] Then 1 Else 0 End [Ok:Datos Generales-Descripción del Recurso]
			, RR.RMDESC
			, PP.[Descripción del Recurso] [Datos Generales-Descripción del Recurso]

			-- 005   MARCA **************************************************
--			, Case When RRA.CASA = LEFT(PPE.[Clave de Marca_Name],1) THEN 1 ELSE 0 END AS [Ok:Marca]
			, RRA.CASA 
			, PPE.[Clave de Marca_Name]

			-- 005   Compañia Alfanumerica**************************************************
--			, Case When RRA.CIAALFA = LEFT(PPE.[Clave Compañía Alfanum_Name],1) THEN 1 ELSE 0 END AS [Ok:Compañia]
			, RRA.CIAALFA 
			, PPE.[Clave Compañía Alfanum_Name]

	-- CODIGO DE BARRAS
			-- 215 **************************************************
--			, Case When RRA.CODIGODEBARRAS1 = PPCB.[EAN 13] Then 1 Else 0 End [Ok:EAN13 CB_RMSA]
			, RRA.CODIGODEBARRAS1
			, PPCB.[EAN 13] [Codigo de Barras-EAN 13]
			-- 231 **************************************************
--			, Case When RRA.CODIGODEBARRAS2 = PPCB.[DUN14] Then 1 Else 0 End [Ok:-DUN 14  CB_RMSA]
			, RRA.CODIGODEBARRAS2
			, PPCB.[DUN14] [Codigo de Barras-DUN 14]
			-- 243 **************************************************
--			, Case When RRA.CODIGODEBARRAS8 = PPCB.[DUN14T] Then 1 Else 0 End [Ok:DUN 14T  CB_RMSA]
			, RRA.CODIGODEBARRAS8
			, PPCB.[DUN14T] [Codigo de Barras-DUN 14T]


	---- Mantenimiento Codigo de Barras
	--		--  **************************************************
	--		, Case When CODIGODEBARRAS1 = MCB.[EAN13 Unidad] Then 1 Else 0 End [Ok:EAN13 RMSA  MTTO CB]
	--		, RRA.CODIGODEBARRAS1
	--		, MCB.[EAN 13 Unidad] [EAN13 Unidad]
	--		--  **************************************************
	--		, Case When RRA.CODIGODEBARRAS2 = MCB.[DUN14 Caja] Then 1 Else 0 End [Ok:DUN14  RMSA  MTTO CB]
	--		, RRA.CODIGODEBARRAS2
	--		, MCB.[DUN 14 Caja] [DUN14 Caja]
	--		--  **************************************************
	--		, Case When RRA.CODIGODEBARRAS8 = MCB.[DUN14T Tarima] Then 1 Else 0 End [Ok:DUN14T  RMSA  MTTO CB]
	--		, RRA.CODIGODEBARRAS8
	--		, MCB.[DUN14T Tarima] [DUN14T Tarima]


	----  Codigo de Barras PT855  (Opcion13)
	--		--  **************************************************
	--		, Case When MCB.[EAN 13 Unidad] = P855.P855C3 Then 1 Else 0 End [Ok:EAN13 PT MTTO CB]
	--		, MCB.[EAN 13 Unidad]
	--		, P855.P855C3 [EAN13 PT855]
	--		--  **************************************************
	--		, Case When MCB.[DUN 14 Caja] = P855.P855C4 Then 1 Else 0 End [Ok:DUN14 PT MTTO CB]
	--		, MCB.[DUN 14 Caja]
	--		, P855.P855C4 [DUN14 PT855]
	--		--  **************************************************
	--		, Case When MCB.[DUN14T Tarima] = P855.P855C1 Then 1 Else 0 End [Ok:DUN 14T PT MTTO CB]
	--		, MCB.[DUN14T Tarima]
	--		, P855.P855C1 [DUN14T PT855]

			From OPENQUERY(HDZ54IP,'SELECT * FROM HDZALM.RESMST') RR
			--- Left  Join HSVDMDDB01.MDMDB2.dbo.HDZGPO_RESMST RRG On RRG.RMRESC = RR.RMRESC And RRG.ProcessDate = RR.ProcessDate
	--		Left  Join (SELECT * From OPENQUERY(HDZ54IP,'SELECT * FROM HDZGPO.RESMST')) RRG On RRG.RMRESC = RR.RMRESC -- And RRG.ProcessDate = RR.ProcessDate

			Left Join (SELECT * From OPENQUERY(HDZ54IP,'SELECT * FROM HDZALM.RESMSA')) RRA On RRA.NOPRODUCTO = RR.RMRESC --And RRA.ProcessDate = RR.ProcessDate
			Inner Join [HSVDMDDBPPSQL].MDMHERDEZ.mdm.vwMDM_ModeloProductos PP On PP.[Número de Recurso] = RR.RMRESC
			Left Join [HSVDMDDBPPSQL].MDMHERDEZ.mdm.vwMDM_ProductosExtendido PPE On PPE.[Codigo de Producto_ID] = PP.ID
--			Left Join [HSVDMDDBPPSQL].MDMHERDEZ.mdm.vwMDM_PlandeDemanda PPPD On PPPD.[Codigo de Producto_ID] = PP.ID
			Left Join [HSVDMDDBPPSQL].MDMHERDEZ.mdm.vwMDM_Productos_Codigo_de_Barras PPCB On PPCB.[Codigo de Producto_ID] = PP.ID
--			Left Join [HSVDMDDBPPSQL].MDMHERDEZ.mdm.vwMDM_ProductosPlaneacion PPPP On PPPP.[Codigo de Producto_ID] = PP.ID
--			Left Join [HSVDMDDBPPSQL].MDMHERDEZ.mdm.vwMDM_CodigoPMP PMP On PMP.ID = PPPP.[Código PMP_ID]
--			Left Join [HSVDMDDBPPSQL].MDMHERDEZ.mdm.vwMDM_CodigoPMP PMPU On PMPU.[Código de PMP] = RRG.RMMSPC
--			LEFT Join [HSVDMDDBPPSQL].MDMHERDEZ.mdm.vwMDM_CompaniaNumerica NCIA ON  NCIA.CODE = PPE.[Número de Compañía_Code]
--			Left Join [HSVDMDDBPPSQL].MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UM ON UM.Code = PP.[Unidad de Medida Estándar_Code]
--			Left Join [HSVDMDDBPPSQL].MDMHERDEZ.mdm.vwMDM_Impuestos IMPI On IMPI.Code = PPE.[Categoría de Impuestos_Code]
--			Left Join [HSVDMDDBPPSQL].MDMHERDEZ.mdm.vwMDM_Impuestos IMPG On IMPG.Code =  PP.[Catégoria de Impuesto_Code]
--			Left Join [HSVDMDDBPPSQL].MDMHERDEZ.mdm.vwMDM_Productos_Almacenes ALM ON ALM.[Codigo de Producto_Code] = PP.Code
--			Left Join [HSVDMDDBPPSQL].MDMHERDEZ.mdm.vwMDM_ProductosAseguramientoCalidad  CAL ON CAL.[Codigo de Producto_Code] = PP.Code 
			--Left Join (SELECT RECURSO
			--		,RIGHT('000000000000000'+LTRIM(RTRIM([EAN 13 Unidad])),15) AS [EAN 13 Unidad]
			--		,RIGHT('000000000000000'+LTRIM(RTRIM([DUN 14 Caja])),15)   AS [DUN 14 Caja]
			--		,RIGHT('000000000000000'+LTRIM(RTRIM([DUN14T Tarima])),15) AS [DUN14T Tarima]
			--		FROM [HSVDMDDBPPSQL].MDMHERDEZ.mdm.vwMDM_Productos_Producto_Mtto_CB
			--		)  MCB ON MCB.[RECURSO]  = PP.[Número de Recurso]

			--Left Join (SELECT RIGHt('00'+LTRIM(RTRIM(CONVERT(CHAR,P855LI))),2)+'5'+P855PR as IDRecurso
			--		, RIGHT('000000000000000'+LTRIM(RTRIM(P855C3)),15) P855C3
			--		, RIGHT('000000000000000'+LTRIM(RTRIM(P855C4)),15) P855C4
			--		, RIGHT('000000000000000'+LTRIM(RTRIM(P855C1)),15) P855C1
			--		 FROM OPENQUERY(HDZ54,'SELECT * FROM HDZPTE.PT855F')
			--		) P855 ON P855.IDRecurso = PP.[Número de Recurso]

	WHERE RR.RMRESC IN('925005')


		SELECT 
				*
		 FROM OPENQUERY(HDZ54,'SELECT 		NOPRODUCTO
		,DEPRODUCTO
		,RIGHT('000000000000000'+CODBARRASUNCONSUMO,15) CODBARRASUNCONSUMO
		,RIGHT('000000000000000'+CODIGODEBARRAS1

		,CODBARRASUNEXPEDICION
		,CODIGODEBARRAS2
		
		,CODBARRASUNCARGA
		,CODIGODEBARRAS8

		,CAJASXCAMAUNCARGA
		,CAMASXTARIUNCARGA
		,CAJASXTARIUNCARGA
		,CASA
		,CIA
		,CIAALFA
		,MERCADOORIGEN
		,MERCADODESTINO
 FROM HDZALM.RESMSA ')
