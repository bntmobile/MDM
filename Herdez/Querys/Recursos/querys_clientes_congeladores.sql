use [MDMHerdezCI]
	go
set nocount on
	go
--SELECT        [Código de Cliente], [Código de Status_Name], [Status Alta], CreadoMDM
--, [Fecha de Envio a CyC]
--, [Fecha de Aprobación x CyC]
--, [Fecha de Rechazo]
--, [Fecha Primera Asignación de Congelador]
--, [Fecha Primera Retiro de Congelador]
--, [Fecha Última Asignación de Congelador]
--, [Fecha Última Retiro de Congelador]
--, [Válida Congelador]
--, [Suma fecha Registro Vs. Fecha Aprobación Días]
--, [Suma Aprobación Vs. Entrega Congelador Días]
--, [Suma Aprobación Vs. Sin Congelador entregado Días]
--FROM            ReporteEstatusClientesNestle

--SELECT 
--*
--from 
--MDMHERDEZCI.dbo.ReporteCompletaClientesNestle


select * from HSVDMDDBPPSQL.MDMHERDEZCI.dbo.ReporteMotivosSinCongeladorCtsNestle

