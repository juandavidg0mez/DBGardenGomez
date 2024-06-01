-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS jardineriaGomez;
-- Usar la base de datos
USE jardineriaGomez;

-- Crear las tablas necesarias
CREATE TABLE gama_producto (
    gama VARCHAR(50) PRIMARY KEY,
    descripcion_texto TEXT,
    descripcion_html TEXT,
    imagen VARCHAR(256)
);

CREATE TABLE tipoTelefono (
    idtelefono INT PRIMARY KEY AUTO_INCREMENT,
    desctelefono VARCHAR(20) NOT NULL
);

CREATE TABLE telefonoGlobal (
    idGlobalPhone INT PRIMARY KEY AUTO_INCREMENT,
    telefono VARCHAR(15) NOT NULL,
    idtelefono INT NOT NULL,
    FOREIGN KEY (idtelefono) REFERENCES tipoTelefono(idtelefono)
);

CREATE TABLE pais (
    idPais INT PRIMARY KEY AUTO_INCREMENT,
    nombrePais VARCHAR(60)
);

CREATE TABLE region (
    idRegion  INT PRIMARY KEY AUTO_INCREMENT,
    idPais INT NOT NULL,
    nombre VARCHAR(60),
    FOREIGN KEY (idPais) REFERENCES pais(idPais)
);

CREATE TABLE ciudad (
    idCiudad  INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(60),
    idRegion INT,
    codigopostal VARCHAR(40),
    FOREIGN KEY (idRegion) REFERENCES region(idRegion)
);
CREATE TABLE Oficina (
    codigo_Oficina VARCHAR(10) PRIMARY KEY,
    idCiudad INT NOT NULL,
    FOREIGN KEY (idCiudad) REFERENCES ciudad(idCiudad)
);
CREATE TABLE empleado (
    codigo_empleado INT(11) PRIMARY KEY,
    codigo_Oficina VARCHAR(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    extension VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    codigo_jefe INT(11),
    puesto VARCHAR(50),
    Foreign Key (codigo_Oficina) REFERENCES Oficina(codigo_Oficina),
    Foreign Key (codigo_jefe) REFERENCES empleado(codigo_empleado)
);

CREATE TABLE cliente (
    codigo_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(50) NOT NULL,
    nombre_contacto VARCHAR(30),
    apellido_contacto VARCHAR(30),
    idCiudad INT NOT NULL,
    codigo_empleado_rep_ventas INT(11),
    limite_credito DECIMAL(15,2),
    FOREIGN KEY (idCiudad) REFERENCES ciudad(idCiudad),
    FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado(codigo_empleado)
);


CREATE TABLE proveedor (
    codigo_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proveedor VARCHAR(50) NOT NULL
);

CREATE TABLE producto (
    codigo_producto INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    gama VARCHAR(50) NOT NULL,
    dimensiones VARCHAR(25),
    descripcion TEXT,
    cantidad_en_stock SMALLINT(6) NOT NULL,
    precio_venta DECIMAL(15,2) NOT NULL,
    precio_proveedor DECIMAL(15,2),
    FOREIGN KEY (gama) REFERENCES gama_producto(gama)
);

CREATE TABLE productoProveedor (
    codigo_producto INT NOT NULL,
    codigo_proveedor INT NOT NULL,
    FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto),
    FOREIGN KEY (codigo_proveedor) REFERENCES proveedor(codigo_proveedor)
);

CREATE TABLE telefonoProveedor (
    idProveedor INT NOT NULL,
    idGlobalPhone INT NOT NULL,
    FOREIGN KEY (idProveedor) REFERENCES proveedor(codigo_proveedor),
    FOREIGN KEY (idGlobalPhone) REFERENCES telefonoGlobal(idGlobalPhone)
);

CREATE TABLE telefonoCliente (
    idCliente INT NOT NULL,
    idGlobalPhone INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES cliente(codigo_cliente),
    FOREIGN KEY (idGlobalPhone) REFERENCES telefonoGlobal(idGlobalPhone)
);

CREATE TABLE telefonoOficina (
    codigo_Oficina VARCHAR(10) NOT NULL,
    idGlobalPhone INT NOT NULL,
    FOREIGN KEY (codigo_Oficina) REFERENCES Oficina(codigo_Oficina),
    FOREIGN KEY (idGlobalPhone) REFERENCES telefonoGlobal(idGlobalPhone)
);

CREATE TABLE tipoDireccion (
    idTipoDireccion INT PRIMARY KEY AUTO_INCREMENT,
    tipodireccion VARCHAR(20) NOT NULL
);

CREATE TABLE direccionGlobal (
    idGlobalDireccion INT PRIMARY KEY AUTO_INCREMENT,
    direccion VARCHAR(100) NOT NULL,
    tipoDireccion INT NOT NULL,
    FOREIGN KEY (tipoDireccion) REFERENCES tipoDireccion(idTipoDireccion)
);

CREATE TABLE direccionCliente (
    idCliente INT NOT NULL,
    idGlobalDireccion INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES cliente(codigo_cliente),
    FOREIGN KEY (idGlobalDireccion) REFERENCES direccionGlobal(idGlobalDireccion)
);

CREATE TABLE direccionOficina (
    codigo_Oficina VARCHAR(10) NOT NULL,
    idGlobalDireccion INT NOT NULL,
    FOREIGN KEY (codigo_Oficina) REFERENCES Oficina(codigo_Oficina),
    FOREIGN KEY (idGlobalDireccion) REFERENCES direccionGlobal(idGlobalDireccion)
);



CREATE TABLE pago (
    Id_transaccion INT PRIMARY KEY AUTO_INCREMENT,
    codigo_cliente INT(11),
    forma_pago VARCHAR(40) NOT NULL,
    fecha_pago DATE NOT NULL,
    total DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

CREATE TABLE estadoPedido (
    idEstadoPedido INT(11) PRIMARY KEY,
    estadoNombrePedido VARCHAR(40)
);

CREATE TABLE pedido (
    codigo_pedido INT(11) PRIMARY KEY,
    fecha_pedido DATE NOT NULL,
    fecha_esperada DATE NOT NULL,
    fecha_entrega DATE,
    comentarios TEXT,
    codigo_cliente INT(11),
    idEstadoPedido INT(11),
    FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente),
    FOREIGN KEY (idEstadoPedido) REFERENCES estadoPedido(idEstadoPedido)
);

CREATE TABLE detalle_pedido (
    codigo_pedido INT(11),
    codigo_producto INT,
    cantidad INT(11) NOT NULL,
    precioUnidad DECIMAL(15,2),
    numero_linea SMALLINT(6),
    PRIMARY KEY (codigo_pedido, codigo_producto),
    FOREIGN KEY (codigo_pedido) REFERENCES pedido(codigo_pedido),
    FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto)
);

SHOW TABLES;
