use [MDMHerdezCI]
	go
set nocount on
	go
--SELECT        [C�digo de Cliente], [C�digo de Status_Name], [Status Alta], CreadoMDM
--, [Fecha de Envio a CyC]
--, [Fecha de Aprobaci�n x CyC]
--, [Fecha de Rechazo]
--, [Fecha Primera Asignaci�n de Congelador]
--, [Fecha Primera Retiro de Congelador]
--, [Fecha �ltima Asignaci�n de Congelador]
--, [Fecha �ltima Retiro de Congelador]
--, [V�lida Congelador]
--, [Suma fecha Registro Vs. Fecha Aprobaci�n D�as]
--, [Suma Aprobaci�n Vs. Entrega Congelador D�as]
--, [Suma Aprobaci�n Vs. Sin Congelador entregado D�as]
--FROM            ReporteEstatusClientesNestle

--SELECT 
--*
--from 
--MDMHERDEZCI.dbo.ReporteCompletaClientesNestle


select * from HSVDMDDBPPSQL.MDMHERDEZCI.dbo.ReporteMotivosSinCongeladorCtsNestle

