SELECT a.IDProducto, a.[Descripción del Recurso]
,a.[Subclase de recurso]  Valor_400 
,m.[Subclase de recurso]  Valor_MDM 
,mv.[Subclase de recurso] Valor_MVC 
,'SubClase' Tipo
FROM [MDMHERDEZCI].[dbo].[BS_AS400] A
INNER JOIN [MDMHERDEZCI].[dbo].BS_MDM M on a.idproducto=m.idproducto
INNER JOIN [MDMHERDEZCI].[dbo].BS_MVC Mv on a.IDProducto=mv.idproducto
where 1=1 
and  m.[Subclase de recurso] <>mv.[Subclase de recurso] or  a.[Subclase de recurso] <>m.[Subclase de recurso]
and mv.[Subclase de recurso] in (
'445031','445028','445034','445025','445022','445029','445035','445032','445036','445023','445030','445026',
'445027','445024','445033','445045','445046','445041','445039','445037','445042','445038','445047','445040',
'445043','445044','445048','445049'
)


---------



SELECT a.IDProducto, a.[Descripción del Recurso]
,a.Linea  Valor_400 
,m.Linea  Valor_MDM 
,mv.Linea Valor_MVC 
,'Linea' Tipo
, case when a.Clase =m.Clase and m.Clase=mv.Clase then  a.Clase else 'Revisar Clase del Recurso' end 'Clase'
,case when --a.Status =m.Status and
 A.Status=mv.Status then  a.Status else 'Revisar Status del Recurso' end 'Status'
,a.Status status_as400
,m.Status status_mds
,mv.Status status_mvc
FROM [MDMHERDEZCI].[dbo].[BS_AS400] A
INNER JOIN [MDMHERDEZCI].[dbo].BS_MDM M on a.idproducto=m.idproducto
INNER JOIN [MDMHERDEZCI].[dbo].BS_MVC Mv on a.IDProducto=mv.idproducto
where 1=1 
and  cast(m.Linea as int) <>mv.Linea or  a.Linea <>m.Linea



select  CODE,[STATUS_nAME] from  [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos] PP with(nolock) WHERE [NÚMERO DE RECURSO]='005057'
SELECT [Tipo Producto Demantra] FROM [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_PlandeDemanda] PPPD with(nolock) WHERE [Codigo de Producto_Code]=17513



select [STATUS_nAME] from  [HSVDMDDBPPSQL].[MDMHERDEZ].[mdm].[vwMDM_ModeloProductos] PP with(nolock)
WHERE [NÚMERO DE RECURSO]='005057'

union all
SELECT a.IDProducto, a.[Descripción del Recurso]
,a.[Clave de Marca] marca_as400
,m.[Clave de Marca] marca_mdm
,mv.[Clave de Marca]  marca_mvc
,'Marca' Tipo
, case when a.Clase =m.Clase and m.Clase=mv.Clase then  a.Clase else 'Revisar Clase del Recurso' end 'Clase'
FROM [MDMHERDEZCI].[dbo].[BS_AS400] A
INNER JOIN [MDMHERDEZCI].[dbo].BS_MDM M on a.idproducto=m.idproducto
INNER JOIN [MDMHERDEZCI].[dbo].BS_MVC Mv on a.IDProducto=mv.idproducto
where 1=1 
and  m.[Clave de Marca]  <>mv.[Clave de Marca] or  a.Linea <>m.Linea



SELECT DISTINCT StatusId  FROM HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Productos]  

SELECT * FROM HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Origenes]

SELECT * FROM HSVDMDDBPPSQL.[MVCRecursos].[dbo].[Miscelaneos] ST WHERE ST.MvcId IN (
1,
2,
4,
6
)