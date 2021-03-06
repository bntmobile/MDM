
/*
CAMPOS QUE SE EXTRAEN DE TABLA POS NUTRISA QUE SE VAN CON LEO  ( SEGUN QUERY QUE COMPARTIO LEO)

[Clave Tipo_Name]
ISNULL( [POS].[Tipo Nutrisa_Code],0)
ISNULL( [POS].[Tipo Nutrisa_Name],'0 ***ADMINISTRADO***')
ISNULL( [POS].[Clave de Uso_Code],0)
ISNULL(SUBSTRING([POS].[Clave de Uso_Name],1,30),'0 ***ADMINISTRADO***') 



*/

SELECT        
 --POSN.ID,
 --POSN.MUID,
 --POSN.VersionName,
 --POSN.VersionNumber,
 --POSN.VersionFlag,
 --POSN.Name,
 --POSN.Code,
 --POSN.ChangeTrackingMask,
 --POSN.[C�digo de Producto_Code],
 --POSN.[C�digo de Producto_Name],
 --POSN.[C�digo de Producto_ID],
 --POSN.[Precio de Venta C Impuesto],
 --POSN.Costo,
 --POSN.CostoF,
 --POSN.[Clave Tipo_Code],
 POSN.[Clave Tipo_Name],
 --POSN.[Clave Tipo_ID],
 --POSN.[Clave Area_Code],
 --POSN.[Clave Area_Name],
 --POSN.[Clave Area_ID],
 POSN.[Clave de Uso_Code],
 POSN.[Clave de Uso_Name],
 --POSN.[Clave de Uso_ID],
 --POSN.[Cantidad Exhibida],
 POSN.[Tipo Nutrisa_Code],
 POSN.[Tipo Nutrisa_Name]
 --POSN.[Tipo Nutrisa_ID],
 --POSN.ProdKit,
 --POSN.[Requiere Peso],
 --POSN.[Para Venta PV],
 --POSN.Wellnesscard,
 --POSN.[Clave de Proveedor Nutrisa],
 --POSN.[Descripci�n de Proveedor Nutrisa],
 --POSN.[C�digo de Proveedor H�rdez],
 --POSN.[Descripci�n de Proveedor H�rdez],
 --POSN.Sabor_Code,
 --POSN.Sabor_Name,
 --POSN.Sabor_ID,
 --POSN.[Excento Impuestos],
 --POSN.[Clave de Actualizacion_Code],
 --POSN.[Clave de Actualizacion_Name],
 --POSN.[Clave de Actualizacion_ID],
 --POSN.[Usuario Creaci�n],
 --POSN.[Usuario Modificaci�n],
 --POSN.[Fecha Creaci�n],
 --POSN.[Fecha Modificaci�n],
 --POSN.[Precio Base],
 --POSN.[C�digo de Impuesto_Code],
 --POSN.[C�digo de Impuesto_Name],
 --POSN.[C�digo de Impuesto_ID],
 --POSN.[Importe de Impuesto],
 --POSN.[Clasificaci�n del Producto_Code],
 --POSN.[Clasificaci�n del Producto_Name],
 --POSN.[Clasificaci�n del Producto_ID],
 --POSN.[Unidad Real de Salida],
 --POSN.Unidades,
 --POSN.Compuesto,
 --POSN.[Es Topping],
 --POSN.Topping_Code,
 --POSN.Topping_Name,
 --POSN.Topping_ID,
 --POSN.[Unidad de Medida Est�ndar POS_Code],
 --POSN.[Unidad de Medida Est�ndar POS_Name],
 --POSN.[Unidad de Medida Est�ndar POS_ID],
 --POSN.[mismo precio],
 --POSN.[CEN Recurso Agrupacion_Code],
 --POSN.[CEN Recurso Agrupacion_Name],
 --POSN.[CEN Recurso Agrupacion_ID],
 --POSN.[CEN Recurso Categoria_Code],
 --POSN.[CEN Recurso Categoria_Name],
 --POSN.[CEN Recurso Categoria_ID],
 --POSN.[CEN Recurso Categoria 1_Code],
 --POSN.[CEN Recurso Categoria 1_Name],
 --POSN.[CEN Recurso Categoria 1_ID],
 --POSN.[CEN Recurso Categoria 2_Code],
 --POSN.[CEN Recurso Categoria 2_Name],
 --POSN.[CEN Recurso Categoria 2_ID],
 --POSN.[CEN Recurso Sabor_Code],
 --POSN.[CEN Recurso Sabor_Name],
 --POSN.[CEN Recurso Sabor_ID],
 --POSN.[CEN Recurso Origen_Code],
 --POSN.[CEN Recurso Origen_Name],
 --POSN.[CEN Recurso Origen_ID]
 --POSN.[Clave de Sincronizacion_Code],
 --POSN.[Clave de Sincronizacion_Name],
 --POSN.[Clave de Sincronizacion_ID],
 --POSN.[Status Pos_Code],
 --POSN.[Status Pos_Name],
 --POSN.[Status Pos_ID],
 --POSN.EnterDateTime,
 --POSN.EnterUserName,
 --POSN.EnterVersionNumber,
 --POSN.LastChgDateTime,
 --POSN.LastChgUserName,
 --POSN.LastChgVersionNumber,
 --POSN.ValidationStatus
FROM            HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_Productos AS P INNER JOIN
                         HSVDMDDBPPSQL.MDMHERDEZ.mdm.vwMDM_PosNutrisa AS POSN ON P.ID = POSN.[C�digo de Producto_ID]
WHERE        (1 = 1)