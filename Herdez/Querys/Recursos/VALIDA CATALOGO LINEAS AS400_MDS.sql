

  -- DESCRIPCIONES DE LINEAS
  	WITH X AS (			
				
	select t4.numerolinea AS ID_AS400,t4.nombrelinea AS DESC_AS400,tm.id_linea ID_MDM,tm.desc_linea DESC_MDM ,			
	case			
		when tm.id_linea IS NULL then 'Agregar valor a catálogo MDM'		
		when t4.numerolinea IS NULL then 'Agregar valor a catálogo AS400'		
		when t4.nombrelinea<>tm.desc_linea then 'Se requiere actualizar Descrpción en MDM'		
		ELSE 'OK'		
	end Estatus			
	from			
			(	
			SELECT  numerolinea,nombrelinea	
			FROM OPENQUERY (HDZ54, 'SELECT * FROM HDZMEN.MLINF')	
			group by numerolinea,nombrelinea
			--order by 1	
	)		t4	
	full outer join			
			(	
			SELECT [CLAVE DE LÍNEA] as id_linea,[DESCRIPCIÓN DE LA LÍNEA]  as desc_linea	
			FROM	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Linea
			where [Status 1]=1	
			GROUP BY [CLAVE DE LÍNEA],[DESCRIPCIÓN DE LA LÍNEA])tm	
			on t4.numerolinea=tm.id_linea	
			)	
				
	SELECT *			
	FROM X WHERE Estatus<>'OK'			
	order by 3,1 asc			
				






			