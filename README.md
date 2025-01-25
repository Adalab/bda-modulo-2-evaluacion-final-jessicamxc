CONSULTAS SOBRE DATABASE SAKILA.

-- Instalación --

En primer lugar, para ejecutar las consultas realizadas debe DESCARGAR el programa MySQL Workbench, así como la Base de datos SAKILA: Puedes descargarla desde el sitio oficial de MySQL o utilizar el siguiente enlace para obtener el archivo https://dev.mysql.com/doc/index-other.html .

-- Descripción --

SAKILA es una base de datos de ejemplo sobre un videoclub, que contiene información sobre películas, inventario de las películas, actores, pagos, alquiler, clientes, etc. para realizar diversas consultas. 
La base de datos Sakila está compuesta por varias tablas relacionadas entre sí. Algunas de las principales son:

actor: Información sobre actores que participan en las películas.
category: Categorías de películas (por ejemplo, acción, comedia, drama, etc.).
customer: Información sobre los clientes de la tienda de alquiler.
film: Información sobre las películas disponibles para alquilar.
inventory: El inventario de las películas disponibles en la tienda.
rental: Detalles de los alquileres de las películas.
payment: Información sobre los pagos realizados por los clientes.
staff: Empleados que gestionan la tienda.
store: Tiendas en las que se alquilan las películas.

-- Uso --

Una vez instalada la base de datos, deberás clonar el archivo SQL adjunto en mi repositorio para poder ejecutar las consultas en "MySQLWorkbench" sobre las tablas y explorar cómo interactúan los diferentes datos. En el archivo SQL encontrarás ejemplos de consultas utilizando:
    Queries Básicas:
        SELECT
        WHERE
        ORDER BY
        DISTINCT
        LIMIT
        BETWEEN
        IN
        AS
    Queries Avanzadas:
        AVG
        COUNT
        GROUP BY
        HAVING
    Union de tablas:
        INNER JOIN
        SELF JOIN
    Operadores especiales de filtro :
        IN/ NOT IN
        LIKE
    Subconsultas