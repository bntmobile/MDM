

  -- DESCRIPCIONES DE LINEAS
  	WITH X AS (			
				
	select t4.numerolinea AS ID_AS400,t4.nombrelinea AS DESC_AS400,tm.id_linea ID_MDM,tm.desc_linea DESC_MDM ,			
	case			
		when tm.id_linea IS NULL then 'Agregar valor a cat�logo MDM'		
		when t4.numerolinea IS NULL then 'Agregar valor a cat�logo AS400'		
		when t4.nombrelinea<>tm.desc_linea then 'Se requiere actualizar Descrpci�n en MDM'		
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
			SELECT [CLAVE DE L�NEA] as id_linea,[DESCRIPCI�N DE LA L�NEA]  as desc_linea	
			FROM	HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Linea
			where [Status 1]=1	
			GROUP BY [CLAVE DE L�NEA],[DESCRIPCI�N DE LA L�NEA])tm	
			on t4.numerolinea=tm.id_linea	
			)	
				
	SELECT *			
	FROM X WHERE Estatus<>'OK'			
	order by 3,1 asc			
				






			