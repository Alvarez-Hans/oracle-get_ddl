# oracle-get_ddl
* Nombre Procedimiento: `gen_ddl.sql`
* Autor               : Hans Alvarez F. @halvarez_soul
* Fecha Creacion      : 20-06-2023

**Ese release aun esta en desarrollo**

Este script tiene la funcion de ser ejecutado desde `sqlplus` y obtener los script a travez de la funcion `DBMS_METADATA.GET_DD` y generar un archivo para su utilizacion en CI/CD para la generacion de respaldos en objetos ORACLE.

Este script se utiliza para generar 1 archivo por objeto oracle.

Los packages deben ser buscado por su nombre de spec (sin body), en donde, se generar 1 solo archivo con el spec y el body.

### Parametros:
  Entrada:

      Parametro 1 = Nombre del archivo a generar
      Parametro 2 = Esquema 
      Parametro 1 = Objeto Oracle

## Installation

Bajar el script [gen_ddl.sql](https://raw.githubusercontent.com/Alvarez-Hans/oracle-get_ddl/master/gen_ddl.sql) en el directorio donde se quiere realizar el respaldo los objetos de ORACLE.

## Documentation

En Construccion.

## Examples

El script se debe ejecutar en `sqlplus`.

### Sentencia: 
```SQL
@@gen_ddl.sql <archivo.sql>, <owner>, <objeto> 
``` 

### Uso:
```SQL
@@gen_ddl.sql 'prueba.sql', 'SYS', 'ALL_OBJECTS' 
``` 

Esto generara un archivo llamando `prueba.sql` en el directorio de ejecucion del `sqlplus`, en donde el archivo generara los fuentes de la tabla `ALL_OBJECTS` del usuario `SYS`.

## Help

En Construccion

## License

En Construccion, por el momento es de libre uso.
