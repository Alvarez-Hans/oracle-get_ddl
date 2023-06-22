/*************************************************************************************
  Descripcion SP                : Genera por archivo los fuentes de un objeto Oracle
  Nombre Procedimiento          : gen_ddl.sql
  Autor                         : Hans Alvarez F.
  Fecha Creacion                : 20-06-2023

  NOTA: Si el componente no esta generando el fuente como corresponde, se debe solicitar el respaldo manual al DBA.

  Parametros:
  -----------
  Entrada:
      Parametro 1 = Nombre del archivo a generar
      Parametro 2 = Esquema 
      Parametro 1 = Objeto Oracle

  Modificaciones
  --------------
  Fecha                    :
  Autor                    :
  Descripcion              :
************************************************************************************/

SET LONG 2000000 LONGCHUNKSIZE 20000 PAGESIZE 0 LINESIZE 32000 FEEDBACK OFF VERIFY OFF TRIMSPOOL ON

BEGIN
  DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'SQLTERMINATOR', true);
  DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'PRETTY', true);
  DBMS_METADATA.SET_TRANSFORM_PARAM (DBMS_METADATA.SESSION_TRANSFORM, 'STORAGE',false);
END;
/

spool &&1..sql

SELECT DBMS_METADATA.GET_DDL (A.OBJECT_TYPE, A.OBJECT_NAME, A.OWNER) AS SOURCE
--     , A.*
  FROM ALL_OBJECTS A
 WHERE A.OWNER = '&&2'
   AND A.OBJECT_NAME = '&&3'
   AND A.OBJECT_TYPE NOT LIKE '%PARTITION'
   AND A.OBJECT_TYPE NOT LIKE '%BODY'
   AND A.OBJECT_TYPE NOT IN ('LOB', 'TYPE')
order by object_type, object_name
;

EXECUTE DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'DEFAULT');

spool off
 
