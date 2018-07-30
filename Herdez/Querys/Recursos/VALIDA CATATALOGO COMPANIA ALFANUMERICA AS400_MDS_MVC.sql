
IF OBJECT_ID('tempdb..#Cat_CompaniaAlfaNumerica') IS NOT NULL
    DROP TABLE #Cat_CompaniaAlfaNumerica


select 
 isnull(mvc.clave,'') clave_mvc
,isnull(mds.clave,'') clave_mds
,isnull(as4.clave,'') clave_as4
,isnull(mvc.descripcion,'') descripcion_mvc
,isnull(mds.descripcion,'') descripcion_mds
,isnull(as4.descripcion,'') descripcion_as4
into #Cat_CompaniaAlfaNumerica
from 
	(
			select codigo as clave,nombre as descripcion from [HSVDMDDBPPSQL].[MVCRecursos].[dbo].[CompaniasAlfabetica] --ORDER BY 1
	) mvc
FULL OUTER JOIN 
	(
					select [Código de Compañia Alfabetica] clave,[Nombre de Compañia Alfabetica] descripcion FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_CompaniaAlfabetica]
	)mds on mvc.clave=mds.clave
FULL OUTER JOIN 
	(
				SELECT upper(st2)clave,upper(st3)descripcion 	FROM  OPENQUERY(HDZ54,'SELECT * FROM HDZMEN.FF01 WHERE  APL=''GR2'' AND  ST1=41  WITH UR') FF01 
    )as4 on as4.clave=mvc.clave or as4.clave=mds.clave
WHERE 1=1
ORDER BY 1,2


select * 
from #Cat_CompaniaAlfaNumerica
where descripcion_as4<>descripcion_mds or descripcion_as4<>descripcion_mds