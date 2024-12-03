/*-----------------------------------------------------------------------------------------
  Pregunta 1:

  Pregunta: ¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?

*/-----------------------------------------------------------------------------------------

SELECT 
    p.id_producto,
    p.nombre AS nombre_producto,
    c.nombre AS nombre_categoria
FROM
    FF.Productos p
INNER JOIN FF.Categorias c ON p.id_categoria = c.id_categoria;

/*----------------------------------------------------------------------

Pregunta 2

Obtener empleados y su sucursal asignada

Pregunta: ¿Cómo puedo saber a qué sucursal está asignado cada empleado?

*/----------------------------------------------------------------------

SELECT 
    e.id_empleado,
    e.nombre,
    s.nombre AS sucursal
FROM
    FF.Empleados e
INNER JOIN FF.Sucursales s ON e.id_sucursal = s.id_sucursal;

/*----------------------------------------------------------------------

Pregunta 3:

Identificar productos sin categoría asignada

Pregunta: ¿Existen productos que no tienen una categoría asignada?

*/----------------------------------------------------------------------

SELECT
    p.id_producto,
    p.nombre
FROM
    FF.Productos p
LEFT JOIN FF.Categorias c ON p.id_categoria = c.id_categoria
WHERE
    c.id_categoria IS NULL;

/*----------------------------------------------------------------------

Pregunta 4:

Detalle completo de órdenes

Pregunta: ¿Cómo puedo obtener un detalle completo de las órdenes, 
incluyendo el Nombre del cliente, Nombre del empleado que tomó la orden, 
y Nombre del mensajero que la entregó?

*/----------------------------------------------------------------------

SELECT 
    o.id_orden,
    c.nombre AS nombre_cliente,
    e.nombre AS nombre_empleado,
    m.nombre AS nombre_mensajero,
    o.fecha_orden_tomada,
    o.fecha_entrega
FROM 
    FF.Ordenes o
INNER JOIN FF.Clientes c ON o.id_cliente = c.id_cliente
INNER JOIN FF.Empleados e ON o.id_vendedor = e.id_empleado
INNER JOIN FF.Mensajeros m ON o.id_mensajero = m.id_mensajero;

/*----------------------------------------------------------------------

Pregunta 5:

Productos vendidos por sucursal

Pregunta: ¿Cuántos artículos correspondientes a cada Categoría de 
Productos se han vendido en cada sucursal?

*/----------------------------------------------------------------------

SELECT 
    c.nombre AS Categoria,
    s.nombre AS Sucursal,
    COUNT(*) AS Cantidad_Vendida
FROM 
    FF.Productos p
INNER JOIN FF.Ordenes o ON p.id_producto = o.id_orden
INNER JOIN FF.Categorias c ON p.id_categoria = c.id_categoria
INNER JOIN FF.Sucursales s ON o.id_sucursal = s.id_sucursal
GROUP BY 
    c.nombre, s.nombre;

/*----------------------------------------------------------------------

¡¡¡EXTRA CREDIT!!!

Pregunta 6: 

Eficiencia de los mensajeros: 

¿Cuál es el tiempo promedio desde el
despacho hasta la entrega de los pedidos gestionados por todo el equipo
de mensajería?

*/----------------------------------------------------------------------

SELECT AVG(DATEDIFF(MINUTE, fecha_despacho, fecha_entrega)) AS tiempo_promedio_minutos
FROM FF.Ordenes
WHERE fecha_entrega IS NOT NULL;

/*----------------------------------------------------------------------

Pregunta 7: 

Análisis de Ventas por Origen de Orden: 

¿Qué canal de ventas genera más ingresos?

*/----------------------------------------------------------------------

SELECT 
    o.id_origen,
    SUM(o.total_compra) AS total_ingresos
FROM 
    FF.Ordenes o
GROUP BY 
    o.id_origen
ORDER BY 
    total_ingresos DESC;

/*----------------------------------------------------------------------

Pregunta 8:

Productividad de los Empleados: 

¿Cuál es el nivel de ingreso generado por Empleado?

*/----------------------------------------------------------------------

SELECT 
    e.nombre,
    e.posicion,
    SUM(o.total_compra) AS total_ingresos
FROM 
    FF.Empleados e
INNER JOIN FF.Ordenes o ON e.id_empleado = o.id_vendedor
GROUP BY 
    e.nombre, e.apellido, e.posicion
ORDER BY 
    total_ingresos DESC;

/*----------------------------------------------------------------------

Pregunta 9: 

Análisis de Demanda por Horario y Día: 

¿Cómo varía la demanda de productos a lo largo del día?
NOTA: Esta consulta no puede ser implementada sin una definición clara 
del horario (mañana, tarde, noche) en la base de datos existente. 
Asumiremos que HorarioVenta refleja esta información correctamente.

*/----------------------------------------------------------------------

SELECT
    DATEPART(HOUR, fecha_orden_tomada) AS Hora,
    COUNT(*) AS Cantidad_Ordenes,
    SUM(total_compra) AS Ingresos_Totales
FROM
    FF.Ordenes
GROUP BY
    DATEPART(HOUR, fecha_orden_tomada)
ORDER BY
    Hora;

/*----------------------------------------------------------------------

Pregunta 10: 

Comparación de Ventas Mensuales: 

¿Cuál es la tendencia de los ingresos generados en cada periodo mensual?

*/----------------------------------------------------------------------

SELECT
    YEAR(fecha_orden_tomada) AS Año,
    MONTH(fecha_orden_tomada) AS Mes,
    SUM(total_compra) AS Ingresos_Totales
FROM
    FF.Ordenes
GROUP BY
    YEAR(fecha_orden_tomada), MONTH(fecha_orden_tomada)
ORDER BY
    YEAR(fecha_orden_tomada), MONTH(fecha_orden_tomada);

/*----------------------------------------------------------------------

Pregunta 11:

Análisis de Fidelidad del Cliente: ¿Qué porcentaje de clientes son 
recurrentes versus nuevos clientes cada mes? NOTA: La consulta se 
enfocaría en la frecuencia de órdenes por cliente para inferir la 
fidelidad.
*/----------------------------------------------------------------------

WITH OrdenesPorMes AS (
  SELECT
    id_cliente,
    YEAR(fecha_orden_lista) AS año,
    MONTH(fecha_orden_lista) AS mes,
    COUNT(*) AS num_ordenes
  FROM
    FF.Ordenes  
  GROUP BY
    id_cliente, YEAR(fecha_orden_lista), MONTH(fecha_orden_lista)
)
SELECT
  año,
  mes,
  COUNT(CASE WHEN num_ordenes > 1 THEN 1 END) AS clientes_recurrentes,
  COUNT(CASE WHEN num_ordenes = 1 THEN 1 END) AS clientes_nuevos,
  FORMAT(ROUND(COUNT(CASE WHEN num_ordenes > 1 THEN 1 END) * 100.0 / COUNT(*), 2), 'P2') AS porcentaje_recurrentes
FROM
  OrdenesPorMes
GROUP BY
  año, mes;