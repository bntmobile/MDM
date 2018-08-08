

-- SELECT upper(st2)st2,upper(st3)st3  FROM OPENQUERY(HDZ54,'SELECT * FROM HDZMEN.FF01 WHERE APL=''EST'' AND st1 = 102 ')
-- GO
WITH MARCA AS (				
select a.ID_AS400,a.DESC_AS400,m.ID_MDM,m.DESC_MDM				
,				
case				
	when m.ID_MDM IS NULL then 'Agregar valor a catálogo MDM'			
	when a.ID_AS400 IS NULL then 'Agregar valor a catálogo AS400'			
	when a.DESC_AS400<>m.DESC_MDM then 'Se requiere actualizar Descrpción en AS400 //CAMPO st3 EN  HDZMEN.FF01 APL=EST AND st1 = 102 '			
	ELSE 'OK'			
end Estatus				
				
from				
(				
SELECT [Código de Clave de Marca] as ID_MDM,	[Nombre de Clave de Marca] as DESC_MDM			
FROM HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_ClaveDeMarca M				
INNER JOIN HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Linea  L				
	ON L.Marca_Id=M.id -- RELACION PARA DETECTAR MARCA Y SUS LINEAS, EL OBJETIVO ES SOLO MOSTRAR LAS MARCAS QUE ESTAN ACTIVAS			
WHERE L.[Status 1]=1 -- SÓLO LINEAS ACTIVAS				
GROUP BY [Código de Clave de Marca],	[Nombre de Clave de Marca]			
) m				
full outer join				
(				
				
select st2 as ID_AS400,upper(st3) as DESC_AS400				
FROM OPENQUERY(HDZ54,'SELECT * FROM HDZMEN.FF01 WHERE APL=''EST'' AND st1 = 102 ')				
)a on m.ID_MDM=a.ID_AS400				
)				
				
select *,'MARCA' as Tipo from Marca				
where Estatus<>'OK' --and ID_MDM  is not null	
and (id_mdm is not null	and	id_mdm  not like '$')	
ORDER BY 1,2				

--SELECT 
--L.NUMEROLINEA
--,L.NOMBRELINEA
--,L.MARCAREC
--,M.ID_AS400
--,M.DESC_AS400 AS DESC_MARCA
--FROM OPENQUERY (HDZ54, 'SELECT * FROM HDZMEN.MLINF WITH UR') L
--INNER JOIN (
--			select st2 as ID_AS400,upper(st3) as DESC_AS400				
--			FROM OPENQUERY(HDZ54,'SELECT * FROM HDZMEN.FF01 WHERE APL=''EST'' AND st1 = 102 ')	
--			)M
--ON L.MARCAREC=M.ID_AS400