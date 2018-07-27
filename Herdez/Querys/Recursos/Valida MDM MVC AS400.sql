select 
  as4.IDProducto IDProducto_as4
, mdm.IDProducto IDProducto_mdm
, mvc.IDProducto IDProducto_mvc
, as4.Clase Clase_as4
, mdm.Clase Clase_mdm
, mvc.Clase Clase_mvc
, as4.[Descripción del Recurso] DescripcionDelRecurso_as4
, mdm.[Descripción del Recurso] DescripcionDelRecurso_mdm
, mvc.[Descripción del Recurso] DescripcionDelRecurso_mvc
, as4.[Status] Status_as4
, mdm.[Status] Status_mdm
, mvc.[Status] Status_mvc
, CASE
	WHEN as4.IDProducto is null and ( mdm.IDProducto is not null and mvc.IDProducto is not null ) then 'Recurso No existe en AS400'
	WHEN as4.IDProducto is null and  mdm.IDProducto is  null and mvc.IDProducto is not null  then 'Recurso No existe en AS400 y MDM'
	WHEN as4.IDProducto is not null and  mdm.IDProducto is  null and mvc.IDProducto is  null  then 'Recurso No existe en MVC y MDM'
END as EstatusGeneral
FROM			(SELECT * FROM HSVDMDDB00.MDMHERDEZCI.dbo.BS_AS400   WITH(NOLOCK) WHERE clase='PT') as4
FULL OUTER JOIN (SELECT * FROM HSVDMDDB00.MDMHERDEZCI.dbo.BS_MDM     WITH(NOLOCK) WHERE Clase='PT') mdm on as4.IDProducto=mdm.IDProducto
FULL OUTER JOIN				   HSVDMDDB00.MDMHERDEZCI.dbo.BS_MVC  mvc WITH(NOLOCK)  on mdm.IDProducto=mvc.IDProducto or as4.IDProducto=mvc.IDProducto
WHERE 1=1
AND (as4.IDProducto IS NULL  OR mdm.IDProducto IS NULL OR mvc.IDProducto IS NULL)
 