-- CUENTA CUANTAS UNIDADES DE CONVERSION TIENE CADA RECURSO
-- SACA AQUELLOS QUE NO TIENEN Y AQUELLOS CON DIFERENCIAS EN EL CONTEO DE UNIDADES DE CONVERSION

select
  AS400.IdRecurso   as  IdRecurso_AS4
, MDS.IdRecurso      as  IdRecurso_MDS
, AS400.CUENTA       as  cuenta_as4
, MDS.CUENTA         as  cuenta_mds
, MDS.[Status_Name]  AS Estatus_MDS
, MDS.Clase_Name     AS Clase_MDS
, AS400.Clase        AS Clase_AS4
,case 
	when  AS400.IdRecurso is null then 'Recurso No Existe en AS400'
	when  AS400.CUENTA   =0 and  MDS.CUENTA   =0 then 'Sin Conversores'  
	when  AS400.CUENTA   <>  MDS.CUENTA   then 'Revisar Conversores'  
  end  Estatus_General
from 
				(
				SELECT RESMST.RMRESC IdRecurso ,RESMST.RMRSCL as Clase, COUNT(UMCONV.UMRESR) CUENTA
				FROM  OPENQUERY(HDZ54,'SELECT * FROM HDZALM.RESMST  WITH UR') RESMST
				LEFT JOIN  OPENQUERY(HDZ54,'SELECT * FROM HDZALM.UMCONV WITH UR')  UMCONV
				ON UMCONV.UMRESR=RESMST.RMRESC
				where RESMST.RMRSCL='PT'
				GROUP BY  RESMST.RMRESC,RESMST.RMRSCL 
				--HAVING  COUNT(UMCONV.UMRESR) <1
				)AS400
full outer join
				(
				SELECT 
				PP.[Número de Recurso] IdRecurso
				, PP.[Status_Name]
				, PP.Clase_Name
				,COUNT(CONV.[De Unidad de Medida_Name]) CUENTA
				FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos] PP with(nolock)
				LEFT JOIN  [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_Productos_Converciones] CONV with(nolock) ON PP.CODE=CONV.[Codigo de Producto_Code]
				WHERE PP.Clase_Name='PT PRODUCTO TERMINADO' AND PP.[Número de Recurso] IS NOT NULL
				GROUP BY  PP.[Número de Recurso],PP.[Status_Name], PP.Clase_Name
				--HAVING COUNT(CONV.[De Unidad de Medida_Name])<1
				) MDS
on MDS.IdRecurso=AS400.IdRecurso
WHERE 1=1
--AND AS400.IdRecurso='27572X'
AND (AS400.CUENTA =0 OR  MDS.CUENTA =0)
OR (AS400.CUENTA =NULL OR  MDS.CUENTA =NULL)
OR (AS400.CUENTA <> MDS.CUENTA )
order by
  case 
	when  AS400.IdRecurso is null then 'Recurso No Existe en AS400'
	when  AS400.CUENTA   =0 and  MDS.CUENTA   =0 then 'Sin Conversores'  
	when  AS400.CUENTA   <>  MDS.CUENTA   then 'Revisar Conversores'  
  end 


--535336
--535395
