/*-----------------------------------------------------------------

Pregunta 1: 

Total de ventas globales

Pregunta: ¿Cuál es el total de ventas (TotalCompra) a nivel global?

*/------------------------------------------------------------------

SELECT SUM(total_compra) AS fecha_orden_lista
FROM FF.Ordenes;

/*------------------------------------------------------------------

Pregunta 2:

Promedio de precios de productos por categoría

Pregunta: ¿Cuál es el precio promedio de los productos dentro de cada categoría?

*/-------------------------------------------------------------------

SELECT c.nombre AS categoria, AVG(p.precio) AS precio_promedio
FROM FF.Productos p
INNER JOIN FF.Categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.nombre;

/*-------------------------------------------------------------------

Pregunta 3: 

Orden mínima y máxima por sucursal

Pregunta: ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?

*/-------------------------------------------------------------------

SELECT 
    s.nombre AS sucursal,
    MIN(o.total_compra) AS valor_minimo,
    MAX(o.total_compra) AS valor_maximo
FROM 
    FF.Ordenes o
INNER JOIN 
    FF.Sucursales s ON o.id_sucursal = s.id_sucursal
GROUP BY 
    s.nombre;

/*-------------------------------------------------------------------

Pregunta 4 

Mayor número de kilómetros recorridos para entrega

Pregunta: ¿Cuál es el mayor número de kilómetros recorridos para una entrega?

*/-------------------------------------------------------------------

SELECT 
    MAX(kilometros_recorrer) AS maximo_kilometros
FROM 
    FF.Ordenes;

/*-------------------------------------------------------------------

Pregunta 5:

Promedio de cantidad de productos por orden

Pregunta: ¿Cuál es la cantidad promedio de productos por orden?

*/-------------------------------------------------------------------

SELECT AVG(cantidad) AS promedio_productos_por_orden
FROM FF.DetalleOrdenes;

/*-------------------------------------------------------------------

Pregunta 6: 

Total de ventas por tipo de pago

Pregunta: ¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?

*/-------------------------------------------------------------------

SELECT 
    tp.nombre AS tipo_pago,
    SUM(o.total_compra) AS total_facturado
FROM 
    FF.Ordenes o
INNER JOIN 
    FF.TiposPagos tp ON o.id_orden = tp.id_tipo_pago
GROUP BY 
    tp.nombre;

/*-------------------------------------------------------------------

Pregunta 7:

Sucursal con la venta promedio más alta

Pregunta: ¿Cuál Sucursal tiene el ingreso promedio más alto?

*/-------------------------------------------------------------------

SELECT 
    s.nombre AS sucursal, 
    AVG(o.total_compra) AS ingreso_promedio
FROM 
    FF.Ordenes o
INNER JOIN FF.Sucursales s ON o.id_sucursal = s.id_sucursal
GROUP BY s.nombre
ORDER BY ingreso_promedio DESC

/*------------------------------------------------------------------

Pregunta 8:

Sucursal con la mayor cantidad de ventas por encima de un umbral

Pregunta: ¿Cuáles son las sucursales que han generado ventas totales 
por encima de $ 1000?

*/------------------------------------------------------------------

WITH IngresosPorSucursal AS (
    SELECT 
        o.id_sucursal, 
        s.nombre AS nombre_sucursal,
        SUM(do.cantidad * do.precio) AS total_ingreso
    FROM 
        FF.Ordenes o
    INNER JOIN FF.DetalleOrdenes do ON o.id_orden = do.id_orden_detalle
    INNER JOIN FF.Sucursales s ON o.id_sucursal = s.id_sucursal
    GROUP BY o.id_sucursal, s.nombre
)
SELECT 
    nombre_sucursal, 
    total_ingreso
FROM 
    IngresosPorSucursal
WHERE 
    total_ingreso > 1000
ORDER BY total_ingreso DESC;

/*------------------------------------------------------------------

Pregunta 9:

Comparación de ventas promedio antes y después de una fecha 
específica

Pregunta: ¿Cómo se comparan las ventas promedio antes y después del 
1 de julio de 2023?

*/------------------------------------------------------------------

WITH IngresosPorPeriodo AS (
    SELECT
        CASE WHEN fecha_orden_tomada < '2023-07-01' THEN 'Antes del 1 de julio'
             ELSE 'Después del 1 de julio' END AS periodo,
        SUM(do.cantidad * do.precio) AS total_ingreso
    FROM 
        FF.Ordenes o
    INNER JOIN FF.DetalleOrdenes do ON o.id_orden = do.id_orden_detalle
    GROUP BY 
        CASE WHEN fecha_orden_tomada < '2023-07-01' THEN 'Antes del 1 de julio'
             ELSE 'Después del 1 de julio' END
)
SELECT
    periodo,
    AVG(total_ingreso) AS promedio_ventas
FROM
    IngresosPorPeriodo
GROUP BY
    periodo;

/*--------------------------------------------------------------------

Pregunta 10:

Análisis de actividad de ventas por horario

Pregunta: ¿Durante qué horario del día (mañana, tarde, noche) se 
registra la mayor cantidad de ventas, cuál es el ingreso promedio de 
estas ventas, y cuál ha sido el importe máximo alcanzado por una orden 
en dicha jornada?

*/--------------------------------------------------------------------

WITH VentasPorHora AS (
    SELECT
        DATEPART(HOUR, horario_venta) AS hora,
        SUM(do.cantidad * do.precio) AS total_ingreso
    FROM 
        FF.Ordenes o
    INNER JOIN FF.DetalleOrdenes do ON o.id_orden = do.id_orden_detalle
    GROUP BY DATEPART(HOUR, horario_venta)
)
SELECT 
    hora,
    AVG(total_ingreso) AS promedio_venta_por_hora,
    (SELECT MAX(do.cantidad * do.precio)
     FROM FF.Ordenes o2
     INNER JOIN FF.DetalleOrdenes do2 ON o2.id_orden = do2.id_orden_detalle
     WHERE DATEPART(HOUR, o2.horario_venta) = v.hora) AS venta_maxima_por_hora
FROM 
    VentasPorHora v
ORDER BY promedio_venta_por_hora DESC;