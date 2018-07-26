
SELECT
            P.[Número de Recurso]
,           P.[Unidad de Medida Estándar_Name]
,           C.[De Unidad de Medida_Name]
,           C.[A Unidad de MEdida_Name]
,           C.Factor
,			P.Status_Name
,			P.[Enviado a 400]
,			P.[Peso Neto]
,			C.[Cálculo_Name]
FROM          [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos] P
LEFT JOIN   [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_Productos_Converciones] C
ON P.Code = C.[Codigo de Producto_Code]
WHERE   P.[Número de Recurso] in ('505040')
order by 1,3,4

--54554X
--535394-- importante unidad medida estandar - mandar a viri




SELECT  * FROM OPENQUERY
(
		HSVDMDDB00,
				'SELECT *
				FROM OPENQUERY(HDZ54, 
					''SELECT R.RMRESC, R.RMUMSR, U.UMFR,U.UMTO,U.UMCONF,U.UMCALC
						FROM HDZALM.RESMST R
						LEFT JOIN  HDZALM.UMCONV U ON R.RMRESC=U.UMRESR
					'')
				'
) 
ORDER BY 1,2,3,4
