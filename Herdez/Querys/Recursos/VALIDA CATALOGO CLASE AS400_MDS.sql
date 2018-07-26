select  as4.id as id_as4,as4.descripcion adesc_as4,
		mdm.id as id_mdm,mdm.descripcion mdm_desc,
		Case When as4.id = mdm.id THEN 0 ELSE 1 END AS [Ok:id],
		Case When as4.descripcion = mdm.descripcion THEN 0 ELSE 1 END AS [Ok:desc]
from      (SELECT  [Codigo de Clase] as id,[Descripción]  as descripcion 	FROM HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Clase C  	group by [Codigo de Clase],[Descripción])as4
full outer join (SELECT RCRSCL as id,RCDESC as descripcion From OPENQUERY(HDZ54,'SELECT * FROM HDZALM.RECLAS  WITH UR') union  SELECT RCRSCL,RCDESC From OPENQUERY(HDZ54,'SELECT * FROM HDZGPO.RECLAS  WITH UR') ) mdm on as4.id=mdm.id
