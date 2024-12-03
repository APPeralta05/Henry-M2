

-- Insertar datos en Sucursales
INSERT INTO FF.Sucursales (nombre, direccion) VALUES
('Sucursal Central', '1234 Main St'), ('Sucursal Norte', '5678 North St'), ('Sucursal Este', '9101 East St'), ('Sucursal Oeste', '1121 West St'), ('Sucursal Sur', '3141 South St'),
('Sucursal Playa', '1516 Beach St'), ('Sucursal Montaña', '1718 Mountain St'), ('Sucursal Valle', '1920 Valley St'), ('Sucursal Lago', '2122 Lake St'), ('Sucursal Bosque', '2324 Forest St');

--Lo mostramos en pantalla
Select * from FF.Sucursales



-- Insertar datos en Empleados
INSERT INTO FF.Empleados (nombre, posicion, departamento, id_sucursal, rol) VALUES
('John Doe', 'Gerente', 'Administración', 1, 'Vendedor'), ('Jane Smith', 'Subgerente', 'Ventas', 1, 'Vendedor'), ('Bill Jones', 'Cajero', 'Ventas', 1, 'Vendedor'), ('Alice Johnson', 'Cocinero', 'Cocina', 1, 'Vendedor'), ('Tom Brown', 'Barista', 'Cafetería', 1, 'Vendedor'),
('Emma Davis', 'Repartidor', 'Logística', 1, 'Mensajero'), ('Lucas Miller', 'Atención al Cliente', 'Servicio', 1, 'Vendedor'), ('Olivia García', 'Encargado de Turno', 'Administración', 1, 'Vendedor'), ('Ethan Martinez', 'Mesero', 'Restaurante', 1, 'Vendedor'), ('Sophia Rodriguez', 'Auxiliar de Limpieza', 'Mantenimiento', 1, 'Vendedor');

--Lo mostramos en pantalla
Select * from FF.Empleados



-- Insertar datos en Clientes
INSERT INTO FF.Clientes (nombre, direccion) VALUES
('Cliente Uno', '1000 A Street'), ('Cliente Dos', '1001 B Street'), ('Cliente Tres', '1002 C Street'), ('Cliente Cuatro', '1003 D Street'), ('Cliente Cinco', '1004 E Street'),
('Cliente Seis', '1005 F Street'), ('Cliente Siete', '1006 G Street'), ('Cliente Ocho', '1007 H Street'), ('Cliente Nueve', '1008 I Street'), ('Cliente Diez', '1009 J Street');

--Lo mostramos en pantalla
Select * from FF.Clientes



--Insertamos datos de productos
INSERT INTO FF.Productos (nombre, id_categoria, precio) VALUES
('Hamburguesa Deluxe', 1, 9.99), ('Cheeseburger', 1, 7.99), ('Pizza Margarita', 10, 11.99), ('Pizza Pepperoni', 10, 12.99), ('Helado de Chocolate', 7, 2.99),
('Helado de Vainilla', 7, 2.99), ('Ensalada César', 4, 5.99), ('Ensalada Griega', 4, 6.99), ('Pastel de Zanahoria', 2, 3.99), ('Brownie', 2, 2.99);

Select * from FF.Productos



-- Insertar datos en Categorias
INSERT INTO FF.Categorias (nombre) VALUES
('Comida Rápida'), ('Postres'), ('Bebidas'), ('Ensaladas'), ('Desayunos'),
('Cafetería'), ('Helados'), ('Comida Vegana'), ('Carnes'), ('Pizzas');

--Lo mostramos en pantalla
Select * from FF.Categorias



-- Insertar datos en Origenes
INSERT INTO FF.Origenes (nombre) VALUES
('En línea'), ('Presencial'), ('Teléfono'), ('Drive Thru'), ('App Móvil'),
('Redes Sociales'), ('Correo Electrónico'), ('Publicidad'), ('Recomendación'), ('Evento');

--Lo mostramos en pantalla
Select * from FF.Origenes



-- Insertar datos en TiposPago
INSERT INTO FF.TiposPago (nombre) VALUES
('Efectivo'), ('Tarjeta de Crédito'), ('Tarjeta de Débito'), ('PayPal'), ('Transferencia Bancaria'),
('Criptomonedas'), ('Cheque'), ('Vale de Comida'), ('Cupón de Descuento'), ('Pago Móvil');

--Lo mostramos en pantalla
Select * from FF.TiposPago



-- Insertar datos en Ordenes
INSERT INTO FF.Ordenes (id_cliente, id_vendedor, id_sucursal, id_mensajero, id_tipo_pago, id_origen, horario_venta, total_compra, kilometros_recorrer, fecha_despacho,fecha_entrega, fecha_orden_tomada, fecha_orden_lista) VALUES
(1, 1, 1, 1, 1, 1, 'Mañana', 1053.51, 5.5, '2023-01-10 08:30:00', '2023-01-10 09:00:00', '2023-01-10 08:00:00', '2023-01-10 08:15:00'),
(2, 2, 2, 2, 2, 2, 'Tarde', 1075.00, 10.0, '2023-02-15 14:30:00', '2023-02-15 15:00:00', '2023-02-15 13:30:00', '2023-02-15 14:00:00'),
(3, 3, 3, 3, 3, 3, 'Noche', 920.00, 2.0, '2023-03-20 19:30:00', '2023-03-20 20:00:00', '2023-03-20 19:00:00', '2023-03-20 19:15:00'),
(4, 4, 4, 4, 4, 4, 'Mañana', 930.00, 0.5, '2023-04-25 09:30:00', '2023-04-25 10:00:00', '2023-04-25 09:00:00', '2023-04-25 09:15:00'),
(5, 5, 5, 5, 5, 5, 'Tarde', 955.00, 8.0, '2023-05-30 15:30:00', '2023-05-30 16:00:00', '2023-05-30 15:00:00', '2023-05-30 15:15:00'),
(6, 6, 6, 6, 6, 1, 'Noche', 945.00, 12.5, '2023-06-05 20:30:00', '2023-06-05 21:00:00', '2023-06-05 20:00:00', '2023-06-05 20:15:00'),
(7, 7, 7, 7, 7, 2, 'Mañana', 1065.00, 7.5, '2023-07-10 08:30:00', '2023-07-10 09:00:00', '2023-07-10 08:00:00', '2023-07-10 08:15:00'),
(8, 8, 8, 8, 8, 3, 'Tarde', 1085.00, 9.5, '2023-08-15 14:30:00', '2023-08-15 15:00:00', '2023-08-15 14:00:00', '2023-08-15 14:15:00'),
(9, 9, 9, 9, 9, 4, 'Noche', 1095.00, 3.0, '2023-09-20 19:30:00', '2023-09-20 20:00:00', '2023-09-20 19:00:00', '2023-09-20 19:15:00'),
(10, 10, 10, 10, 10, 5, 'Mañana', 900.00, 15.0, '2023-10-25 09:30:00', '2023-10-25 10:00:00', '2023-10-25 09:00:00', '2023-10-25 09:15:00');

--Lo mostramos en pantalla
Select * from FF.Ordenes


-- Insertar datos en Mensajeros
INSERT INTO FF.Mensajeros (nombre, es_empleado) VALUES
('Mensajero Uno', 0), ('Mensajero Dos', 1), ('Mensajero Tres', 0), ('Mensajero Cuatro', 1), ('Mensajero Cinco', 0),
('Mensajero Seis', 1), ('Mensajero Siete', 0), ('Mensajero Ocho', 1), ('Mensajero Nueve', 0), ('Mensajero Diez', 1);

--Lo mostramos en pantalla
Select * from FF.Mensajeros

--Insertamos datos en DetalleOrdenes
INSERT INTO FF.DetalleOrdenes (id_orden, id_producto, cantidad, precio) VALUES
(1, 1, 3, 23.44),
(1, 2, 5, 45.14),
(1, 3, 4, 46.37),
(1, 4, 4, 42.34),
(1, 5, 1, 18.25),
(1, 6, 4, 20.08),
(1, 7, 2, 13.31),
(1, 8, 2, 20.96),
(1, 9, 4, 30.13),
(1, 10, 3, 38.34);


-- Aumentamos los precios de todos los productos en la categoria
UPDATE FF.Productos SET precio = precio + 1 WHERE categoria_id = 1;
--Le sumamos $1

--Lo mostramos en pantalla
SELECT precio FROM FF.Productos

--Cambiamos la posición de todos los empleados del departamento 'Cocina' a 'Chef'
UPDATE FF.Empleados SET posicion = 'Chef' WHERE departamento = 'Cocina';

--Lo mostramos en pantalla
SELECT posicion FROM FF.Empleados

-- Actualizar la dirección de la primer sucursal a:
UPDATE FF.Sucursales SET direccion = '1234 New Address St' WHERE id_sucursal = 1;

--Lo mostramos en pantalla
SELECT direccion FROM FF.Sucursales 

--Eliminamos una orden especifica
DELETE FROM FF.DetalleOrdenes WHERE id_orden = 10;
DELETE FROM FF.Ordenes WHERE id_orden = 10;

--Lo motramos en pantalla
SELECT id_orden FROM FF.Ordenes

--Eliminamos los producrtos de la categoria postres
DELETE FROM FF.Productos WHERE categoria_id = 2;

--Lo mostramos en pantalla
SELECT categoria_id FROM FF.Productos


/*---------------------------------------------------------------------------------------

Pregunta 1:

Registros únicos

Pregunta: ¿Cuál es la cantidad total de registros únicos en la tabla de órdenes?

*/--------------------------------------------------------------------------------------

SELECT COUNT(*) AS total_de_registros_unicos -- 
FROM (
    SELECT DISTINCT *
    FROM FF.Ordenes
) AS subconsulta;

/*--------------------------------------------------------------------------------------

Pregunta 2:

Empleados por departamento

pregunta: ¿Cuántos empleados existen en cada departamento?

*/--------------------------------------------------------------------------------------

SELECT 
    departamento, 
    COUNT(*) AS total_empleados
FROM 
   FF.Empleados
GROUP BY 
    departamento;

/*--------------------------------------------------------------------------------------

Pregunta 3:

Productos por categoría

Pregunta: ¿Cuántos productos hay por código de categoría?

*/--------------------------------------------------------------------------------------

SELECT 
    c.nombre, 
    COUNT(p.id_categoria) AS cantidad_productos
FROM 
    FF.Productos p
INNER JOIN FF.Categorias c ON p.id_categoria = c.id_categoria
GROUP BY 
    c.nombre;

/*-------------------------------------------------------------------------------------

Pregunta 4:

Importación de clientes

Pregunta: ¿Cuántos clientes se han importado a la tabla de clientes?

*/--------------------------------------------------------------------------------------

SELECT nombre, COUNT(*) AS veces_repetido
FROM FF.Clientes
GROUP BY nombre;

/*---------------------------------------------------------------------------------------------

Pregunta 5:

Análisis de desempeño de sucursales

Pregunta: ¿Cuáles son las sucursales con un promedio de Facturación/Ingresos superior a 1000.00 
y que minimizan sus costos en base al promedio de kilómetros 
recorridos de todas de sus entregas gestionadas? 
Para un mejor relevamiento, ordene el listado por el Promedio Km Recorridos.

*/----------------------------------------------------------------------------------------------

SELECT 
    s.nombre, 
    AVG(o.kilometros_recorrer) AS promedio_km_por_orden,
    AVG(o.total_compra) AS promedio_facturacion_por_orden
FROM 
    FF.Sucursales s
INNER JOIN FF.Ordenes o ON s.id_sucursal = o.id_sucursal
GROUP BY 
    s.nombre
HAVING 
    AVG(o.total_compra) > 1000
ORDER BY 
    AVG(o.kilometros_recorrer) ASC;

