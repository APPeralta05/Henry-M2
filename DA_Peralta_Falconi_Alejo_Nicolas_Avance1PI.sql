--Creamos la Base de Datos
CREATE DATABASE FastFood;

--Seleccionamos la base de datos
USE FastFood
GO

--Creamos un esquema
CREATE SCHEMA FF;
GO


--Creamos la tabla Sucursales
CREATE TABLE FF.Sucursales (
    id_sucursal INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(20)
);
--Creamos la tabla Empleados
CREATE TABLE FF.Empleados (
    id_empleado INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    posicion VARCHAR(50),
    rol VARCHAR(50),
    id_sucursal INT FOREIGN KEY REFERENCES FF.Sucursales(id_sucursal),
    departamento VARCHAR(50)
);
--Creamos la tabla Clientes
CREATE TABLE FF.Clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(200)
);
--Creamos la tabla Productos
CREATE TABLE FF.Productos (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10,2),
    id_categoria INT FOREIGN KEY REFERENCES FF.Categorias(id_categoria)
);
--Creamos la tabla Categorias
CREATE TABLE FF.Categorias (
    id_categoria INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50)
);

--Creamos la tabla Origenes
CREATE TABLE FF.Origenes (
    id_origen INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50)
);
--Creamos la tabla TiposPago
CREATE TABLE FF.TiposPago (
    id_tipo_pago INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50)
);
--Creamos la tabla Ordenes
CREATE TABLE FF.Ordenes (
    id_orden INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT FOREIGN KEY REFERENCES FF.Clientes(id_cliente),
    id_vendedor INT FOREIGN KEY REFERENCES FF.Empleados(id_empleado),
    id_sucursal INT FOREIGN KEY REFERENCES FF.Sucursales(id_sucursal),
    id_mensajero INT FOREIGN KEY REFERENCES FF.Mensajeros(id_mensajero),
    id_origen INT FOREIGN KEY REFERENCES FF.Origenes(id_origen),
    id_tipo_pago INT FOREIGN KEY REFERENCES FF.TiposPago(id_tipo_pago),
    horario_venta VARCHAR(20),
    total_compra DECIMAL(10,2),
    kilometros_recorrer DECIMAL(10,2),
    fecha_despacho DATETIME,
    fecha_entrega DATETIME,
    fecha_orden_tomada DATETIME,
    fecha_orden_lista DATETIME
);
--Creamos la tabla Mensajeros
CREATE TABLE FF.Mensajeros (
    id_mensajero INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono VARCHAR(20),
    es_empleado BIT, -- Indica si es empleado o externo
    id_sucursal INT FOREIGN KEY REFERENCES FF.Sucursales(id_sucursal) -- Solo para mensajeros empleados
);
--Creamos la tabla DetalleOrdenes
CREATE TABLE FF.DetalleOrdenes (
    id_orden INT,
    id_producto INT,
    cantidad INT NOT NULL,
	precio DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_orden, id_producto),
    FOREIGN KEY (id_orden) REFERENCES FF.Ordenes(id_orden),
    FOREIGN KEY (id_producto) REFERENCES FF.Productos(id_producto)
);
