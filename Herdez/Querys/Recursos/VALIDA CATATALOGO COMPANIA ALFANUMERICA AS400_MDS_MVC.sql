
select 
 mvc.clave clave_mvc
,mds.clave clave_mds
,as4.clave clave_as4
,mvc.descripcion descripcion_mvc
,mds.descripcion descripcion_mds
,as4.descripcion descripcion_as4
 from 
(
select codigo as clave,nombre as descripcion from [HSVDMDDBPPSQL].[MVCRecursos].[dbo].[CompaniasAlfabetica] --ORDER BY 1
) mvc
full outer join (
select [Código de Compañia Alfabetica] clave,[Nombre de Compañia Alfabetica] descripcion FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_CompaniaAlfabetica]
)mds on mvc.clave=mds.clave
full outer join 
(
 SELECT upper(st2)clave,upper(st3)descripcion 	FROM  OPENQUERY(HDZ54,'SELECT * FROM HDZMEN.FF01 WHERE  APL=''GR2'' AND  ST1=41  WITH UR') FF01 
)as4 on as4.clave=mvc.clave or as4.clave=mds.clave
where 1=1
--and mvc.descripcion <> mds.descripcion
order by 1,2