/*

BCM021F -- RESMST -- DATOS GENERALES
BCM024F -- RESMSA -- DATOS EXTENDIDOS

TABLA BATCH ENTRE BIZTALK Y AS400
El campo NOMTXT es el mensaje

*/

SELECT  NOMTXT,* 
FROM OPENQUERY(HDZ54,'SELECT * FROM HERDEZ8.BCM021F WHERE RMSOLC LIKE''180720%'' WITH UR  ') 
WHERE RMRESC='165003'
ORDER BY RMSOLC ASC




