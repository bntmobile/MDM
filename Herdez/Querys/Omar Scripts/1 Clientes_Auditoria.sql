



IF OBJECT_ID('tempdb..#TmpCC01') IS NOT NULL
begin 
   DROP TABLE #TmpCC01
end
go 
IF OBJECT_ID('tempdb..#TmpEntity00') IS NOT NULL
begin 
   DROP TABLE #TmpEntity00
end
go
IF OBJECT_ID('tempdb..#TmpEntity01') IS NOT NULL
begin 
   DROP TABLE #TmpEntity01
end

go

Select CC.Id, CC.[Código de Cliente], CC.Code
Into #TmpCC01
From MDMHERDEZ.mdm.vwMDM_ModeloCliente CC With(NoLock)
-- Inner Join ##Tmp01 T1 On T1.ID = CC.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ModeloClienteCréditoyCobranza CyC With(NoLock) On CyC.[Clave de  Cliente_ID] = CC.ID
Inner Join MDMHERDEZ.mdm.vwMDM_CyCCadenas CAD With(NoLock) On CAD.ID = CyC.[Código de Cadena_ID] -- And CAD.[Código de Cadena] = 'N34'

go
Create Index idxBBP01 On #TmpCC01 ([Código de Cliente])
Create Clustered Index idxBBP02 On #TmpCC01 (ID)
Go

Select
  SV.Entity_ID
, SV.Name
, Case SV.Name
  When 'vwMDM_ModeloCliente' Then CC.ID
  When 'vwMDM_ModeloClienteCréditoyCobranza' Then CyC.ID
  When 'vwMDM_ModeloClienteVentas' Then CV.ID
  When 'vwMDM_ModeloClienteLogistica' Then CL.ID
  When 'vwMDM_ModeloClienteDirecciones' Then CD.ID
--  When 'vwMDM_RutaCliente' Then RC.ID
  End Member_ID
, CC.ID CC_Member_ID
, CC.Code CC_Code
, CC.[Código de Cliente] [Código de Cliente]
Into #TmpEntity01
From mdmherdez.mdm.tblSubscriptionView SV
Cross Join MDMHERDEZ.mdm.vwMDM_ModeloCliente CC
Inner Join #TmpCC01 T1 on T1.ID = CC.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ModeloClienteCréditoyCobranza CyC on CyC.[Clave de  Cliente_ID] = CC.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ModeloClienteDirecciones CD on CD.[Clave de  Cliente_ID] = CC.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ModeloClienteVentas CV on CV.[Clave de  Cliente_ID] = CC.ID
Inner Join MDMHERDEZ.mdm.vwMDM_ModeloClienteLogistica CL on CL.[Clave de  Cliente_ID] = CC.ID
-- Inner Join MDMHERDEZ.mdm.vwMDM_RutaCliente RC on RC.[Código de Cliente_ID] = CC.ID
Where SV.Name In ('vwMDM_ModeloCliente','vwMDM_ModeloClienteCréditoyCobranza','vwMDM_ModeloClienteVentas','vwMDM_ModeloClienteLogistica','vwMDM_ModeloClienteDirecciones','vwMDM_RutaCliente')


Select
  T1.CC_Member_ID
, T1.CC_Code
, T1.[Código de Cliente]
, AA.DisplayName
, T.*
Into MDMHerdezCI.dbo.google_bq_auditoria_clientes
From MDMHERDEZ.mdm.tblTransaction T -- With(NoLock, Index(idxbbp01))
Inner Join #TmpEntity01 T1 With(NoLock) On T1.Entity_ID = T.Entity_ID And T1.Member_ID = T.Member_ID
Inner Join mdmherdez.mdm.tblAttribute AA On AA.ID = T.Attribute_ID




Select * From MDMHerdezCI.dbo.google_bq_auditoria_clientes TT
where TT.DisplayName = 'Código CP SAT'
-- where TT.DisplayName = 'Usuario Ultima Modificación'
-- And TT.Entity_ID = '984'
-- where TT.DisplayName = 'Tipo Sucursal'
-- where TT.DisplayName = 'NAME'
-- where TT.DisplayName = 'Calle'
-- Where TT.DisplayName = 'Código de Status'
-- Where TT.Attribute_ID = 36824 -- 24554 -- 24480
-- Where TT.DisplayName Like '%statu%' -- And TT.CC_Code = '218594' 
Order By TT.EnterDTM Desc
