
-- DESCRIPCIONES DE COMPAÑIA ALFANUMERICA

select 
  as4.IdCompaniaAlfa IdCompaniaAlfa_as4
, mdm.IdCompaniaAlfa IdCompaniaAlfa_mdm
, as4.DescCompaniaAlfa DescCompaniaAlfa_as4
, mdm.DescCompaniaAlfa DescCompaniaAlfa_mdm
, case
when as4.IdCompaniaAlfa is null then 'Comañia No Existe en AS400'
when mdm.IdCompaniaAlfa is null then 'Comañia No Existe en MDM'
when mdm.DescCompaniaAlfa<>as4.DescCompaniaAlfa  then 'Se debe actulizar MDM o AS400?'
else '' end estatus
from 
(   SELECT upper(st2)IdCompaniaAlfa,upper(st3)DescCompaniaAlfa 	FROM  OPENQUERY(HDZ54,'SELECT * FROM HDZMEN.FF01 WHERE  APL=''GR2'' AND  ST1=41  WITH UR') FF01 
)as4
full outer join 
(	SELECT 	[Código de Compañia Alfabetica] IdCompaniaAlfa,	[Nombre de Compañia Alfabetica] DescCompaniaAlfa 	FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_CompaniaAlfabetica]
)mdm on as4.IdCompaniaAlfa=mdm.IdCompaniaAlfa
where 1=1
and  as4.DescCompaniaAlfa <>  mdm.DescCompaniaAlfa 
or as4.DescCompaniaAlfa is null
or mdm.DescCompaniaAlfa is null
order by 1 asc





