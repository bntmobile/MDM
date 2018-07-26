SELECT    
			   CASE  
				    WHEN 	 'N'+ [PE].[ID de Origen]  = 'N'
				    THEN		 'N'+ RTRIM([P].[Número de Recurso]) 
				   WHEN        'N'+  [PE].[ID de Origen] = 'N0'
				    THEN         'N'+ RTRIM([P].[Número de Recurso]) 
				    ELSE	  	  'N'+ [PE].[ID de Origen] 
			    END [ID_RecursoNutrisa]
		   , RTRIM([P].[Número de Recurso]) [ID_Recurso]
		   , LTRIM(RTRIM([P].[Número de Recurso]))+' '+LTRIM(RTRIM([P].[Descripción del Recurso])) AS [Recurso]
		   , LTRIM(RTRIM([P].[Descripción del Recurso])) [Recurso_C]
		   , LTRIM(RTRIM(SUBSTRING([P].[Unidad de Medida Estándar_Name] , 1 , 2))) [RecursoUMEstandar]
		   , ISNULL([UMPOS].[Código de Unidad de Medida],'-')    RecursoUMEstandarPOS
		   , CASE
			    WHEN [P].[tipo_code] = '0Q'
			    THEN 0
			    ELSE CONVERT(NVARCHAR , LTRIM(RTRIM([P].[tipo_code])))
			END [ID_TipoRecurso]
		   , [ABC].[Código de ABC] [ID_RecursoCodigoABC]
		   , LTRIM(RTRIM([P].[Empaque COntenido])) [RecursoPresentacion]
		   , LTRIM(RTRIM(SUBSTRING([P].[Unidad de Medida de Peso_Name] , 1 , 2))) [RecursoUMPeso]
		   , CONVERT(NUMERIC(15 , 6) , [P].[Peso Neto]) [RecursoPesoNeto]
		   , CONVERT(NUMERIC(15 , 6) , [P].[Peso Bruto]) [RecursoPesoLogistico]
		   , ISNULL([C].[Costo Estándar] , 0) [RecursoCostoUnitario]
		   , ISNULL([PE].[Precio de Venta] , 0)  [RecursoPrecioLista]
		   , ISNULL(RIGHT('000'+LTRIM(RTRIM(CONVERT(NVARCHAR(20) ,[L].[Clave de Línea]))), 3),'N999') [ID_RecursoLinea]
		   --, ISNULL(RIGHT('000'+LTRIM(RTRIM([L].[Clave de Línea])), 3)+' '+SUBSTRING(P.Linea_Name, CHARINDEX(' ', LTRIM(RTRIM(P.Linea_Name)), 1), LEN(P.Linea_Name)),'999 ***ADMINISTRADO***') [RecursoLinea]
		   , ISNULL( LTRIM(RTRIM(L.[Name])),'999 ***ADMINISTRADO***') RecursoLinea
		  ,  [M].[Código de Clave de Marca]    [ID_RecursoMarca]
		  , [M].[Name] [RecursoMarca]
		  , LTRIM(RTRIM([CA].[Código de Compañia Alfabetica] )) [ID_RecursoCompania]
		  , LTRIM(RTRIM([CA].[Name])) [RecursoCompania]
		  , RIGHT ( '0'+ CONVERT ( VARCHAR (20),CN.[Código de Compañia Numérica]), 3)	 [ID_RecursoCompaniaContable]
		  , RIGHT ( '0'+ CONVERT ( VARCHAR (20),CN.[Código de Compañia Numérica]), 3) + ' '+ [Nombre de Compañia Numérica]	  [RecursoCompaniaContable]  
		  , [P].[Unidad de Medida Estándar_Code] [RecursoCjEq]
		  , [P].[Piezas P Unidad de Venta] [RecursoPzEq]
		  , '1.000000' [RecursoKgEq]
		   , '1.000000' [RecursoTmEq]
		   , '1.000000' [RecursoCostoCj]
		   , '1.000000' [RecursoCostoPz]
		   , '1.000000' [RecursoCostoKg]
		   , '1.000000' [RecursoCostoTm]
		   ,0	  RecursoIVA
		   , '0.000000' [RecursoIEPS]
		   , 1 [RecursoClave]
		   , POS.[Clave Tipo_Name]  RecursoAgrupacion
		   , [P].[Tipo_Name] [RecursoTipo]
		   , ISNULL([CB].[EAN 13],0) [RecursoCodigoBarras]
		   , [PD].[Descripción Hérdez] [RecursoCategoriaPlaneacion]
		   , [AC].[Vida útil Días] [RecursoVidaUtil]
		   , ISNULL( [POS].[Tipo Nutrisa_Code],0)  ID_RecursoCategoria
		   , ISNULL( [POS].[Tipo Nutrisa_Name],'0 ***ADMINISTRADO***')  RecursoCategoria
		   , 0 [RecursoDemantra]
		   , ISNULL( [POS].[Clave de Uso_Code],0)	 ID_RecursoCategoria1
		   , ISNULL(SUBSTRING([POS].[Clave de Uso_Name],1,30),'0 ***ADMINISTRADO***')  RecursoCategoria1
		   , P.[Marca P Descripción_Code]	 ID_RecursoCategoria2
		   , P.[Marca P Descripción_Name] RecursoCategoria2
		   , 1 [ID_RecursoGrupoCompania]
		   , 'NUTRISA' [RecursoGrupoCompania]
		   , 0 [ID_RecursoManufactura]
		   , '-' [RecursoManufactura]
		   , '-1' [Recurso_IDSK_SegmentacionRecurso]
		   , [PPCL].[Codigo de Clase]	 [RecursoFuenteClase]
		  , 'HDZALM' [RecursoEntidad]
		   , 'CONGELADOS' [RecursoClasificacionLogistica]
		   , CASE
			    WHEN [H].[Formato_Name] LIKE '-1%'
			    THEN '***Administrado***'
			    ELSE ISNULL([H].[Formato_Name],'***Administrado***')
			END [RecursoFormato]
		   , [ALM].[Cantidad Estiba x Hilera] [RecursoCajasXCama]
		   , [ALM].[Altura de Estiba] [RecursoApilabilidad]
		   , [P].[Piezas P Unidad de Venta] [RecursoUnidades] 
		   , ISNULL([CENS].[Descripcion],'***ADMINISTRADO***')  [RecursoSabor]
		   , ISNULL([P].[Origen_Name],'***ADMINISTRADO***') [RecursoOrigen]
		   --INTO ##CambioSKU
	   FROM             HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ModeloProductos P
	   INNER JOIN    [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].vwMDM_ProductosExtendido PE  WITH (NOLOCK) 
		  ON              P.[Code]=PE.[Codigo de Producto_Code]
	    LEFT JOIN   HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PosNutrisa POS 
		  ON              POS.[Código de Producto_Code] = P.[Code]
	   LEFT JOIN       HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ClaveDeMarca M
		 ON               M.code =  PE.[Clave de Marca_Code]
	   LEFT JOIN      HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Linea L
		 ON			   L.code = P.Linea_Code
	   LEFT JOIN       HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_CompaniaNumerica CN 
		 ON               PE.[Número de Compañía_Code] = CN.Code
	   LEFT JOIN      HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_CompaniaAlfabetica CA 
		  ON             PE.[Clave Compañía Alfanum_Code] = CA.Code
	   LEFT JOIN      HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_UnidadesDeMedida UMPOS 
		   ON            UMPOS.ID = POS.[Unidad de Medida Estándar POS_ID]
	   LEFT JOIN      HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_CódigoABC ABC 
		   ON            ABC.code = P.[Código ABC_Code]
	   INNER JOIN      HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Productos_Codigo_de_Barras CB
		  ON            P.[Code]=CB.[Codigo de Producto_Code]
		 --ON             P.[Número de Recurso] = CB.[Codigo de producto_Name]
	   LEFT JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PlandeDemanda PD
		 ON             P.[Code] = PD. [Codigo de Producto_Code]
	   LEFT JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ProductosAseguramientoCalidad AC
		ON              P.[Code] = AC.[Codigo de Producto_Code]
	   LEFT JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Clase PPCL 
		 ON             PPCL.ID = P.Clase_ID     
	   LEFT JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ModeloProductosHelados H
		 ON             P.[Code] = H.[Codigo de Producto_Code]
	   LEFT JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Productos_Almacenes ALM
		 ON             P.[code] = ALM.[Codigo de Producto_Code]
	   LEFT JOIN     HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_CEN_Recurso_Sabor CENS 
		   ON		 CENS.ID = POS.[CEN Recurso Sabor_ID]
	   INNER JOIN
	   (
		  SELECT
			    [C].[Codigo de Producto_Name]
			  , [C].[Costo Estándar]
			  , [C].[Codigo de Producto_Code]
		  FROM HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ProductosCostos C --Productos Costos
		  WHERE [C].[Codigo de Producto_Name] IS NOT NULL
			   AND [C].[Entidad] = 'ALMACENES'
	   ) C 
		  ON		   C.[Codigo de Producto_Code] = P.[Code]
	   LEFT JOIN [HSVDMDDBPPSQL].MDMHERDEZ.mdm.vwMDM_ClavesDeActualizacionRecurso CAR 
			 ON    CAR.ID = POS.[Status Pos_ID]
	  LEFT JOIN HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ClaveDeActualizacionRecursos SCA 
			 ON SCA.ID = P.[Clave de Actualizacion_ID]