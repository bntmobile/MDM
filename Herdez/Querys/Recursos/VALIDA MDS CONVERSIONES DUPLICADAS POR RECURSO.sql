				SELECT 
				PP.[Número de Recurso] IdRecurso
				,CONV.[De Unidad de Medida_Name]
				,CONV.[A Unidad de Medida_Name]
				,CONV.Factor
				,COUNT(1)CUENTA
				 
				FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos] PP with(nolock)
				LEFT JOIN  [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_Productos_Converciones] CONV with(nolock) ON PP.CODE=CONV.[Codigo de Producto_Code]
				WHERE PP.Clase_Name='PT PRODUCTO TERMINADO' AND PP.[Número de Recurso] IS NOT NULL
				GROUP BY 
				 PP.[Número de Recurso] 
				,CONV.[De Unidad de Medida_Name]
				,CONV.[A Unidad de Medida_Name]
				,CONV.Factor
				HAVING COUNT(1)>1


