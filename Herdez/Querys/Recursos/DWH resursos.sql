/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
       [ID_Recurso]
      ,[Recurso]
      ,[RecursoAgrupacion]
      ,[RecursoFuenteClase]
      ,[RecursoClasificacionLogistica]
      ,[ID_RecursoBase]
      ,[RecursoBase]
      ,[RecursoInnovacion]
  FROM HDZNT169.[DWH_CDC].[dbo].[Recurso]

  --select *     FROM [DWH_CDC].[dbo].[Recurso]


  SELECT         [RecursoAgrupacion]
  FROM HDZNT169.[DWH_CDC].[dbo].[Recurso]
  GROUP BY [RecursoAgrupacion]
  ORDER BY 1 ASC


  
SELECT  [ID_RecursoBase],[RecursoBase] 
FROM HDZNT169.[DWH_CDC].[dbo].[Recurso]
GROUP BY  [ID_RecursoBase],[RecursoBase] 



SELECT    [RecursoClasificacionLogistica]
FROM     HDZNT169.[DWH_CDC].[dbo].[Recurso]
GROUP BY  [RecursoClasificacionLogistica]


SELECT  [RecursoInnovacion]
FROM    HDZNT169.[DWH_CDC].[dbo].[Recurso]
GROUP BY  [RecursoInnovacion]