USE jardineriaGomez;


-- inserciones a la tabla GAMA_PRODUCTO
INSERT INTO gama_producto (gama, descripcion_texto, descripcion_html, imagen) VALUES 
('Herbaceas', 'Plantas para jardin decorativas', NULL, NULL),
('Herramientas', 'Herramientas para todo tipo de acción', NULL, NULL),
('Aromáticas', 'Plantas aromáticas', NULL, NULL),
('Frutales', 'Árboles pequeños de producción frutal', NULL, NULL),
('Ornamentales', 'Plantas vistosas para la decoración del jardín', NULL, NULL);

-- Inserciones a la tabla PROCVEEDOR
INSERT INTO proveedor (nombre_proveedor) VALUES 
('GreenGarden'),
('GardenMaster'),
('Evergreen Landscapes'),
('Blossom Landscaping'),
('Natures Touch'),
('Garden Delights'),
('FreshCut Landscaping'),
('GreenThumb Services'),
('BloomScapes'),
('SpringBloom Gardens');

-- Incerciones a la tabla PRODUCTO
INSERT INTO producto (codigo_producto, nombre, gama, dimensiones, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES 
(1, 'Herbacea Verde', 'Herbaceas', '10x10x10', 'Planta herbácea verde', 100, 15.99, 10.00),
(2, 'Pala Multiuso', 'Herramientas', '30x10x5', 'Pala para múltiples usos en el jardín', 50, 25.99, 20.00),
(3, 'Menta', 'Aromáticas', '15x15x15', 'Planta aromática de menta', 150, 8.99, 5.00),
(4, 'Manzano', 'Frutales', '50x50x150', 'Árbol frutal de manzana', 20, 45.99, 30.00),
(5, 'Rosa', 'Ornamentales', '40x40x100', 'Planta ornamental de rosa', 75, 20.99, 15.00),
(6, 'Herbacea Azul', 'Herbaceas', '12x12x12', 'Planta herbácea azul', 80, 16.99, 11.00),
(7, 'Tijeras de Poda', 'Herramientas', '25x7x3', 'Tijeras para podar plantas', 60, 18.99, 12.00),
(8, 'Lavanda', 'Aromáticas', '10x10x25', 'Planta aromática de lavanda', 140, 9.99, 6.00),
(9, 'Naranjo', 'Frutales', '55x55x160', 'Árbol frutal de naranja', 25, 50.99, 35.00),
(10, 'Tulipán', 'Ornamentales', '30x30x80', 'Planta ornamental de tulipán', 90, 22.99, 17.00);
-- Incerciones a la tabla Productoprovedor tabal intermedia entra estas dos
INSERT INTO productoProveedor (codigo_producto, codigo_proveedor) VALUES
(1, 1), -- Producto: Herbacea Verde, Proveedor: GreenGarden
(2, 7), -- Producto: Pala Multiuso, Proveedor: FreshCut Landscaping
(3, 5), -- Producto: Menta, Proveedor: Natures Touch
(4, 9), -- Producto: Manzano, Proveedor: BloomScapes
(5, 3), -- Producto: Rosa, Proveedor: Evergreen Landscapes
(6, 1), -- Producto: Herbacea Azul, Proveedor: GreenGarden
(7, 8), -- Producto: Tijeras de Poda, Proveedor: GreenThumb Services
(8, 5), -- Producto: Lavanda, Proveedor: Natures Touch
(9, 9), -- Producto: Naranjo, Proveedor: BloomScapes
(10, 2); -- Producto: Tulipán, Proveedor: GardenMaster
-- Insertacion da datos en la tabla pais 
INSERT INTO pais (nombrePais) VALUES
('Argentina'),
('Uruguay'),
('Paraguay'),
('España'),
('Francia'),
('Italia'),
('Estados Unidos'),
('Canadá'),
('México');
SELECT * FROM region;
-- Insertar regiones faltantes
-- Regiones de Argentina
INSERT INTO region (idPais, nombre) VALUES
(1, 'Buenos Aires'),
(1, 'Córdoba'),
(1, 'Mendoza');

-- Regiones de Uruguay
INSERT INTO region (idPais, nombre) VALUES
(2, 'Montevideo'),
(2, 'Punta del Este');

-- Regiones de Paraguay
INSERT INTO region (idPais, nombre) VALUES
(3, 'Asunción'),
(3, 'Encarnación');

-- Regiones de España
INSERT INTO region (idPais, nombre) VALUES
(4, 'Madrid'),
(4, 'Barcelona'),
(4, 'Valencia');

-- Regiones de Francia
INSERT INTO region (idPais, nombre) VALUES
(5, 'París'),
(5, 'Lyon'),
(5, 'Toulouse');

-- Regiones de Italia
INSERT INTO region (idPais, nombre) VALUES
(6, 'Roma'),
(6, 'Milán'),
(6, 'Nápoles');

-- Regiones de Estados Unidos
INSERT INTO region (idPais, nombre) VALUES
(7, 'Nueva York'),
(7, 'Los Ángeles'),
(7, 'Chicago'),
(7, 'Houston');

-- Regiones de Canadá
INSERT INTO region (idPais, nombre) VALUES
(8, 'Toronto'),
(8, 'Montreal'),
(8, 'Vancouver'),
(8, 'Calgary');

-- Regiones de México
INSERT INTO region (idPais, nombre) VALUES
(9, 'Ciudad de México'),
(9, 'Guadalajara'),
(9, 'Monterrey'),
(9, 'Puebla');
-- =================================================================================================
--------------------------------------------------------------------------------------------------------------------------------
-- Ciudades de Buenos Aires
INSERT INTO ciudad (nombre, idRegion, codigopostal) VALUES
('Buenos Aires', 1, 'C1000'),
('La Plata', 1, 'B1900');

-- Ciudades de Córdoba
INSERT INTO ciudad (nombre, idRegion, codigopostal) VALUES
('Córdoba', 2, 'X5000'),
('Villa Carlos Paz', 2, 'X5152');

-- Ciudades de Mendoza
INSERT INTO ciudad (nombre, idRegion, codigopostal) VALUES
('Mendoza', 3, 'M5500'),
('San Rafael', 3, 'M5600');

-- Ciudades de Montevideo
INSERT INTO ciudad (nombre, idRegion, codigopostal) VALUES
('Montevideo', 4, '11000'),
('Punta del Este', 4, '20001');

-- Ciudades de Asunción
INSERT INTO ciudad (nombre, idRegion, codigopostal) VALUES
('Asunción', 6, '1000'),
('Encarnación', 6, '6000');

-- Ciudades de Madrid
INSERT INTO ciudad (nombre, idRegion, codigopostal) VALUES
('Madrid', 8, '28001'),
('Barcelona', 8, '08001');

-- Ciudades de París
INSERT INTO ciudad (nombre, idRegion, codigopostal) VALUES
('París', 11, '75001'),
('Marsella', 11, '13001');

-- Ciudades de Roma
INSERT INTO ciudad (nombre, idRegion, codigopostal) VALUES
('Roma', 14, '00100'),
('Milán', 14, '20121');

-- Ciudades de Nueva York
INSERT INTO ciudad (nombre, idRegion, codigopostal) VALUES
('Nueva York', 17, '10001'),
('Brooklyn', 17, '11201');

-- Ciudades de Los Ángeles
INSERT INTO ciudad (nombre, idRegion, codigopostal) VALUES
('Los Ángeles', 18, '90001'),
('Hollywood', 18, '90028');

-- Ciudades de Toronto
INSERT INTO ciudad (nombre, idRegion, codigopostal) VALUES
('Toronto', 21, 'M5V 1J9'),
('Mississauga', 21, 'L5B 4M7');

-- Ciudades de Montreal
INSERT INTO ciudad (nombre, idRegion, codigopostal) VALUES
('Montreal', 22, 'H2X 1Y6'),
('Quebec', 22, 'G1K 4C4');

-- Ciudades de Ciudad de México
INSERT INTO ciudad (nombre, idRegion, codigopostal) VALUES
('Ciudad de México', 25, '01000'),
('Guadalajara', 25, '44600');

-- Ciudades de Monterrey
INSERT INTO ciudad (nombre, idRegion, codigopostal) VALUES
('Monterrey', 27, '64000'),
('Puebla', 27, '72000');

-- =================================================================================

INSERT INTO Oficina (codigo_Oficina, idCiudad) VALUES
    ('BA123', 1), -- Buenos Aires
    ('BA456', 1), -- Buenos Aires
    ('LP123', 2), -- La Plata
    ('LP456', 2), -- La Plata
    ('CO123', 3), -- Córdoba
    ('CO456', 3), -- Córdoba
    ('VCP123', 4), -- Villa Carlos Paz
    ('VCP456', 4), -- Villa Carlos Paz
    ('ME123', 5), -- Mendoza
    ('ME456', 5), -- Mendoza
    ('SR123', 6), -- San Rafael
    ('SR456', 6), -- San Rafael
    ('MTV123', 7), -- Montevideo
    ('MTV456', 7), -- Montevideo
    ('PDE123', 8), -- Punta del Este
    ('PDE456', 8), -- Punta del Este
    ('ASU123', 9), -- Asunción
    ('ASU456', 9), -- Asunción
    ('ENC123', 10), -- Encarnación
    ('ENC456', 10), -- Encarnación
    ('MAD123', 11), -- Madrid
    ('MAD456', 11), -- Madrid
    ('BCN123', 12), -- Barcelona
    ('BCN456', 12), -- Barcelona
    ('PRS123', 13), -- París
    ('PRS456', 13), -- París
    ('MAR123', 14), -- Marsella
    ('MAR456', 14), -- Marsella
    ('ROM123', 15), -- Roma
    ('ROM456', 15), -- Roma
    ('MIL123', 16), -- Milán
    ('MIL456', 16), -- Milán
    ('NY123', 17), -- Nueva York
    ('NY456', 17), -- Nueva York
    ('BK123', 18), -- Brooklyn
    ('BK456', 18), -- Brooklyn
    ('LA123', 19), -- Los Ángeles
    ('LA456', 19), -- Los Ángeles
    ('HW123', 20), -- Hollywood
    ('HW456', 20), -- Hollywood
    ('TOR123', 21), -- Toronto
    ('TOR456', 21), -- Toronto
    ('MSA123', 22), -- Mississauga
    ('MSA456', 22), -- Mississauga
    ('MTL123', 23), -- Montreal
    ('MTL456', 23), -- Montreal
    ('QUE123', 24), -- Quebec
    ('QUE456', 24), -- Quebec
    ('CDMX123', 25), -- Ciudad de México
    ('CDMX456', 25), -- Ciudad de México
    ('GDL123', 26), -- Guadalajara
    ('GDL456', 26), -- Guadalajara
    ('MTY123', 27), -- Monterrey
    ('MTY456', 27), -- Monterrey
    ('PBL123', 28), -- Puebla
    ('PBL456', 28); -- Puebla
-- =================================================================


--  CREACION DE DATOS DE EMPLEADOS
INSERT INTO empleado (codigo_empleado, codigo_Oficina, nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) VALUES
(1, 'BA123', 'Juan', 'Perez', 'Gonzalez', 'Ext123', 'juan.perez@example.com', NULL, 'Gerente'),
(2, 'BA123', 'Maria', 'Garcia', 'Lopez', 'Ext124', 'maria.garcia@example.com', 1, 'Asistente Administrativo'),
(3, 'LP123', 'Carlos', 'Martinez', 'Hernandez', 'Ext125', 'carlos.martinez@example.com', NULL, 'Analista de Ventas'),
(4, 'LP123', 'Ana', 'Rodriguez', 'Diaz', 'Ext126', 'ana.rodriguez@example.com', 3, 'Ejecutivo de Cuentas'),
(5, 'CO123', 'Pedro', 'Sanchez', 'Lopez', 'Ext127', 'pedro.sanchez@example.com', NULL, 'Desarrollador Web'),
(6, 'CO123', 'Laura', 'Gomez', 'Fernandez', 'Ext128', 'laura.gomez@example.com', 5, 'Diseñador UX/UI'),
(7, 'VCP123', 'Javier', 'Ramirez', 'Perez', 'Ext129', 'javier.ramirez@example.com', NULL, 'Director de Marketing'),
(8, 'VCP123', 'Sofia', 'Reyes', 'Santos', 'Ext130', 'sofia.reyes@example.com', 7, 'Especialista en Redes Sociales'),
(9, 'ME123', 'Diego', 'Hernandez', 'Gutierrez', 'Ext131', 'diego.hernandez@example.com', NULL, 'Ingeniero de Software'),
(10, 'ME123', 'Luisa', 'Torres', 'Martin', 'Ext132', 'luisa.torres@example.com', 9, 'Analista de Sistemas'),
(11, 'SR123', 'Miguel', 'Flores', 'Gomez', 'Ext133', 'miguel.flores@example.com', NULL, 'Contador'),
(12, 'SR123', 'Carmen', 'Diaz', 'Ruiz', 'Ext134', 'carmen.diaz@example.com', 11, 'Auditor Interno'),
(13, 'MTV123', 'Roberto', 'Jimenez', 'Soto', 'Ext135', 'roberto.jimenez@example.com', NULL, 'Consultor'),
(14, 'MTV123', 'Elena', 'Alvarez', 'Lopez', 'Ext136', 'elena.alvarez@example.com', 13, 'Analista de Negocios'),
(15, 'PDE123', 'Oscar', 'Gonzalez', 'Navarro', 'Ext137', 'oscar.gonzalez@example.com', NULL, 'Arquitecto'),
(16, 'PDE123', 'Julia', 'Molina', 'Gomez', 'Ext138', 'julia.molina@example.com', 15, 'Diseñador de Interiores'),
(17, 'ASU123', 'Andres', 'Ruiz', 'Fernandez', 'Ext139', 'andres.ruiz@example.com', NULL, 'Analista Financiero'),
(18, 'ASU123', 'Ana', 'Lopez', 'Perez', 'Ext140', 'ana.lopez@example.com', 17, 'Economista'),
(19, 'ENC123', 'Raul', 'Santos', 'Gonzalez', 'Ext141', 'raul.santos@example.com', NULL, 'Consultor de Recursos Humanos'),
(20, 'ENC123', 'Marta', 'Fernandez', 'Rodriguez', 'Ext142', 'marta.fernandez@example.com', 19, 'Analista de Capacitación');

-- =================================================================================

-- INCERSACION DE BASSE DE DATOS DE CLIENTE
INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, idCiudad, codigo_empleado_rep_ventas, limite_credito) VALUES
(1, 'Acme Corporation', 'John', 'Doe', 1, 1, 10000.00),
(2, 'Tech Innovations LLC', 'Emily', 'Smith', 2, 2, 15000.00),
(3, 'Global Solutions Inc.', 'Michael', 'Johnson', 3, 3, 20000.00),
(4, 'Sunset Resorts', 'Sophia', 'Williams', 4, 4, 12000.00),
(5, 'Fresh Foods Ltd.', 'Daniel', 'Brown', 5, 5, 18000.00),
(6, 'Evergreen Enterprises', 'Olivia', 'Jones', 6, 6, 22000.00),
(7, 'Dynamic Designs Co.', 'William', 'Davis', 7, 7, 13000.00),
(8, 'Creative Solutions', 'Emma', 'Miller', 8, 8, 17000.00),
(9, 'Golden Gate Imports', 'Alexander', 'Wilson', 9, 9, 19000.00),
(10, 'Peak Performance Inc.', 'Mia', 'Taylor', 10, 10, 21000.00),
(11, 'Blue Ocean Enterprises', 'Noah', 'Anderson', 11, 11, 16000.00),
(12, 'Redwood Retailers', 'Ava', 'Martinez', 12, 12, 23000.00),
(13, 'Sunny Side Services', 'Ethan', 'Lopez', 13, 13, 14000.00),
(14, 'Momentum Marketing', 'Isabella', 'Garcia', 14, 14, 20000.00),
(15, 'Tech Titanics', 'James', 'Hernandez', 15, 15, 25000.00),
(16, 'Silver Screen Solutions', 'Charlotte', 'Harris', 16, 16, 17000.00),
(17, 'Pacific Partners Inc.', 'Liam', 'Clark', 17, 17, 18000.00),
(18, 'Mountain View Merchants', 'Amelia', 'Lewis', 18, 18, 19000.00),
(19, 'Urban Oasis', 'Benjamin', 'Young', 19, 19, 22000.00),
(20, 'Harbor Heights Hospitality', 'Harper', 'Scott', 20, 20, 20000.00);
INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, idCiudad, codigo_empleado_rep_ventas, limite_credito) VALUES
(21, 'Sapa', 'Harper', 'Scott', 20, NULL, 20000.00),
(22, 'Perro', 'Zapatoca', 'Smith', 15, NULL, 48500.00);

-- =================================================================================

-- INCERSACION DE BASSE DE tabla PAGO
INSERT INTO pago (codigo_cliente, forma_pago, fecha_pago, total) VALUES
(1, 'Tarjeta de crédito', '2023-05-29', 150.00),
(2, 'Transferencia bancaria', '2022-07-29', 200.00),
(3, 'Efectivo', '2021-01-15', 175.50),
(4, 'Cheque', '2013-09-01', 300.00),
(5, 'PayPal', '2020-04-15', 250.00),
(6, 'Tarjeta de débito', '2017-10-04', 180.00),
(7, 'Transferencia bancaria', '2002-09-15', 220.75),
(8, 'Efectivo', '1988-05-13', 175.00),
(9, 'Tarjeta de crédito', '2024-05-21', 400.00),
(10, 'Cheque', '2009-05-20', 350.00),
(11, 'PayPal', '2022-08-19', 275.00);


-- =================================================================================

-- INCERSACION DE BASSE DE tabla estado pedido


INSERT INTO estadoPedido (idEstadoPedido, estadoNombrePedido) VALUES
(1, 'Pendiente'),
(2, 'Rechazado'),
(3, 'En espera de pago'),
(4, 'Enviado'),
(5, 'Entregado'),
(6, 'Cancelado por el cliente'),
(7, 'Cancelado por falta de stock'),
(8, 'En revisión'),
(9, 'Reembolsado'),
(10, 'Devuelto'),
(11, 'Rechazado por exceso de pago');


-- =================================================================================

-- INCERSACION DE BASSE DE tabla PEDIDO

INSERT INTO pedido (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, comentarios, codigo_cliente, idEstadoPedido) VALUES
(48612, '2024-05-29', '2024-06-05', '2024-05-25', 'Pedido urgente', 1, 1),
(12343, '2024-05-28', '2024-06-04', NULL, 'Cliente solicita entrega en horas de la mañana', 2, 6),
(45616, '2024-05-27', '2024-06-03', '2024-06-03', 'Pedido sujeto a disponibilidad de producto', 3, 3),
(16347, '2024-05-26', '2024-06-02', '2024-06-02', 'Cliente requiere factura proforma', 4, 4),
(49612, '2024-05-25', '2024-05-01', '2024-04-23', 'Pedido con envío express', 5, 5),
(18346, '2024-05-24', '2024-05-30', NULL, 'Cliente prefiere entrega los fines de semana', 6, 11),
(95618, '2024-05-23', '2024-05-30', '2024-05-30', 'Pedido para evento corporativo', 7, 7),
(12335, '2024-05-22', '2024-05-29', NULL, 'Cliente solicita empaquetado especial', 8, 8),
(45612, '2024-05-21', '2024-05-28', '2024-05-27', 'Pedido con descuento por volumen', 9, 9),
(12945, '2024-05-20', '2024-05-26', NULL, 'Cliente requiere cambio de dirección de entrega', 10, 10),
(45912, '2024-05-19', '2024-05-25', NULL, 'Pedido para regalo, se incluirá tarjeta de felicitación', 11, 11);
INSERT INTO pedido (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, comentarios, codigo_cliente, idEstadoPedido) VALUES
(34343, '2023-05-19', '2023-05-25','2023-05-25', 'Pedido para regalo, se incluirá tarjeta de felicitación', 12, 1),
(12309, '2024-08-19', '2024-08-25','2024-08-30', 'Pedido para regalo, se incluirá tarjeta de felicitación', 15, 1);



-- =================================================================================

-- INCERSACION DE BASSE DE tabla detalle pedido



INSERT INTO detalle_pedido (codigo_pedido, codigo_producto, cantidad, precioUnidad, numero_linea) VALUES
(12335, 1, 10, 15.50, 1),
(12335, 2, 5, 25.75, 2),
(12335, 3, 2, 45.00, 3),
(12343, 4, 7, 18.99, 1),
(12343, 5, 3, 34.50, 2),
(12343, 6, 1, 75.99, 3),
(12945, 7, 6, 13.49, 1),
(12945, 8, 4, 22.89, 2),
(16347, 10, 12, 11.49, 1),
(16347, 1, 14, 20.99, 2),
(16347, 2, 9, 14.50, 3),
(18346, 3, 5, 19.99, 1),
(18346, 4, 11, 24.50, 2),
(18346, 5, 3, 29.99, 3),
(45612, 6, 8, 32.99, 1),
(45612, 7, 2, 40.00, 2),
(45612, 8, 6, 27.89, 3),
(45616, 10, 10, 15.49, 2),
(45616, 1, 4, 12.50, 3),
(45912, 2, 3, 17.99, 1),
(45912, 3, 5, 19.49, 2),
(45912, 4, 9, 25.99, 3),
(48612, 5, 11, 29.50, 1),
(48612, 6, 13, 31.99, 2),
(48612, 7, 4, 35.49, 3),
(49612, 8, 6, 22.99, 1),
(49612, 10, 2, 12.99, 3),
(95618, 1, 8, 18.99, 1),
(95618, 2, 4, 20.49, 2),
(95618, 3, 7, 21.99, 3);


-- =================================================================================

-- INCERSACION DE BASSE DE tabla telefono

INSERT INTO tipoTelefono (desctelefono) VALUES
('Móvil'),
('Fijo'),
('Trabajo'),
('Casa'),
('Fax'),
('Otro');
INSERT INTO tipoTelefono (desctelefono) VALUES
('Edificio'),
('Casa Oficina');


-- =================================================================================

-- INCERSACION DE BASSE DE tabla telefono 
INSERT INTO telefonoGlobal (telefono, idtelefono) VALUES
('555-123-4567', 1), -- Móvil
('555-234-5678', 2), -- Fijo
('555-345-6789', 3), -- Trabajo
('555-456-7890', 4), -- Casa
('555-567-8901', 5), -- Fax
('555-678-9012', 6), -- Otro
('555-789-0123', 1), -- Móvil
('555-890-1234', 2), -- Fijo
('555-901-2345', 3), -- Trabajo
('555-012-3456', 4), -- Casa
('555-123-4568', 5), -- Fax
('555-234-5679', 6), -- Otro
('555-345-6780', 1), -- Móvil
('555-456-7891', 2), -- Fijo
('555-567-8902', 3), -- Trabajo
('555-678-9013', 4), -- Casa
('555-789-0124', 5), -- Fax
('555-890-1235', 6), -- Otro
('555-901-2346', 1), -- Móvil
('555-012-3457', 2); -- Fijo
INSERT INTO telefonoGlobal (telefono, idtelefono) VALUES
('555-987-6543', 3), -- Trabajo
('555-876-5432', 4), -- Casa
('555-765-4321', 1), -- Móvil
('555-654-3210', 2), -- Fijo
('555-543-2109', 6), -- Otro
('555-432-1098', 5), -- Fax
('555-321-0987', 1), -- Móvil
('555-210-9876', 2), -- Fijo
('555-109-8765', 3), -- Trabajo
('555-098-7654', 4), -- Casa
('555-987-4321', 5), -- Fax
('555-876-3210', 6), -- Otro
('555-765-2109', 1), -- Móvil
('555-654-1098', 2), -- Fijo
('555-543-0987', 3), -- Trabajo
('555-432-9876', 4), -- Casa
('555-321-8765', 5), -- Fax
('555-210-7654', 6), -- Otro
('555-109-6543', 1), -- Móvil
('555-098-5432', 2); -- Fijo

INSERT INTO telefonoGlobal (telefono, idtelefono) VALUES
('555-321-6543', 3), -- Trabajo
('555-432-5432', 4), -- Casa
('555-543-4321', 1), -- Móvil
('555-654-3219', 2), -- Fijo
('555-765-2108', 6), -- Otro
('555-876-1097', 5), -- Fax
('555-987-0986', 1), -- Móvil
('555-098-9875', 2), -- Fijo
('555-109-8764', 3), -- Trabajo
('555-210-7653', 4), -- Casa
('555-321-6542', 5), -- Fax
('555-432-5431', 6), -- Otro
('555-543-4320', 1), -- Móvil
('555-654-3218', 2), -- Fijo
('555-765-2107', 3), -- Trabajo
('555-876-1096', 4), -- Casa
('555-987-0985', 5), -- Fax
('555-098-9874', 6), -- Otro
('555-109-8763', 1), -- Móvil
('555-210-7652', 2); -- Fijo
INSERT INTO telefonoGlobal (telefono, idtelefono) VALUES
('555-876-5433', 7), -- Trabajo
('555-765-4322', 8), -- Casa
('555-654-3211', 7), -- Móvil
('555-543-2100', 8), -- Fijo
('555-432-1099', 7), -- Otro
('555-321-0988', 8), -- Fax
('555-210-9877', 7), -- Móvil
('555-109-8766', 8), -- Fijo
('555-098-7655', 7), -- Trabajo
('555-987-6544', 8), -- Casa
('555-876-5434', 7), -- Fax
('555-765-4323', 8), -- Otro
('555-654-3212', 7), -- Móvil
('555-543-2101', 8), -- Fijo
('555-432-1100', 7), -- Trabajo
('555-321-0989', 8), -- Casa
('555-210-9878', 7), -- Fax
('555-109-8767', 8), -- Otro
('555-098-7656', 7), -- Móvil
('555-987-6545', 8), -- Fijo
('555-876-5435', 7), -- Trabajo
('555-765-4324', 8), -- Casa
('555-654-3213', 7), -- Fax
('555-543-2102', 8), -- Otro
('555-432-1101', 7), -- Móvil
('555-321-0990', 8), -- Fijo
('555-210-9879', 7), -- Trabajo
('555-109-8768', 8), -- Casa
('555-098-7657', 7), -- Fax
('555-987-6546', 8), -- Otro
('555-321-6543', 7), -- Trabajo
('555-432-5432', 8), -- Casa
('555-543-4321', 7), -- Móvil
('555-654-3219', 8), -- Fijo
('555-765-2108', 7), -- Otro
('555-876-1097', 8), -- Fax
('555-987-0986', 7), -- Móvil
('555-098-9875', 8), -- Fijo
('555-109-8764', 7), -- Trabajo
('555-210-7653', 8), -- Casa
('555-321-6542', 7), -- Fax
('555-432-5431', 8), -- Otro
('555-543-4320', 7), -- Móvil
('555-654-3218', 8), -- Fijo
('555-765-2107', 7), -- Trabajo
('555-876-1096', 8), -- Casa
('555-987-0985', 7), -- Fax
('555-098-9874', 8), -- Otro
('555-109-8763', 7), -- Móvil
('555-210-7652', 8); -- Fijo
INSERT INTO telefonoGlobal (telefono, idtelefono) VALUES
('555-109-8768', 8), -- Casa
('555-098-7657', 7), -- Fax
('555-987-6546', 8), -- Otro
('555-321-6543', 7), -- Trabajo
('555-432-5432', 8), -- Casa
('555-543-4321', 7), -- Móvil
('555-654-3219', 8), -- Fijo
('555-765-2108', 7), -- Otro
('555-876-1097', 8), -- Fax
('555-987-0986', 7), -- Móvil
('555-098-9875', 8), -- Fijo
('555-109-8764', 7), -- Trabajo
('555-210-7653', 8), -- Casa
('555-321-6542', 7), -- Fax
('555-432-5431', 8), -- Otro
('555-543-4320', 7), -- Móvil
('555-654-3218', 8), -- Fijo
('555-765-2107', 7), -- Trabajo
('555-876-1096', 8), -- Casa
('555-987-0985', 7), -- Fax
('555-098-9874', 8), -- Otro
('555-109-8763',7), -- Móvil
('555-210-7652', 8); -- Fijo




-- =================================================================================

-- INCERSACION DE BASSE DE tabla telefono_provedor

INSERT INTO telefonoProveedor (idProveedor, idGlobalPhone) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15),
(8, 16),
(9, 17),
(9, 18),
(10, 19),
(10, 20);




-- ========================================================================
-- INCERSACION DE BASSE DE tabla telefono_cliente
INSERT INTO telefonoCliente (idCliente, idGlobalPhone) VALUES
(1, 21),
(2, 22),
(3, 23),
(4, 24),
(5, 25),
(6, 26),
(7, 27),
(8, 28),
(9, 29),
(10, 30),
(11, 31),
(12, 32),
(13, 33),
(14, 34),
(15, 35),
(16, 36),
(17, 37),
(18, 38),
(19, 39),
(20, 40);

-- ========================================================================
-- INCERSACION DE BASSE DE tabla telefono oficina

-- Asignación de números de teléfono a las oficinas (continuación)
INSERT INTO telefonoOficina (codigo_Oficina, idGlobalPhone) VALUES
('BA123', 91),  -- Móvil
('BA456', 92),  -- Fijo
('LP123', 93),  -- Trabajo
('LP456', 94),  -- Casa
('CO123', 95),  -- Otro
('CO456', 96),  -- Fax
('VCP123', 97), -- Móvil
('VCP456', 98), -- Fijo
('ME123', 99),  -- Trabajo
('ME456', 100), -- Casa
('SR123', 111), -- Otro
('SR456', 102), -- Fax
('MTV123', 103), -- Móvil
('MTV456', 104), -- Fijo
('PDE123', 105), -- Trabajo
('PDE456', 106), -- Casa
('ASU123', 107), -- Otro
('ASU456', 108), -- Fax
('ENC123', 109), -- Móvil
('ENC456', 120),
('MAR123', 61),  -- Móvil
('MAR456', 62),  -- Fijo
('ROM123', 63),  -- Trabajo
('ROM456', 64),  -- Casa
('MIL123', 65),  -- Otro
('MIL456', 66),  -- Fax
('NY123', 67),   -- Móvil
('NY456', 68),   -- Fijo
('BK123', 69),   -- Trabajo
('BK456', 70),   -- Casa
('LA123', 71),   -- Otro
('LA456', 72),   -- Fax
('HW123', 73),   -- Móvil
('HW456', 74),   -- Fijo
('TOR123', 75),  -- Trabajo
('TOR456', 76),  -- Casa
('MSA123', 77),  -- Otro
('MSA456', 78),  -- Fax
('MTL123', 79),  -- Móvil
('MTL456', 80),  -- Fijo
('QUE123', 81),  -- Trabajo
('QUE456', 82),  -- Casa
('CDMX123', 83), -- Otro
('CDMX456', 84), -- Fax
('GDL123', 85),  -- Móvil
('GDL456', 86),  -- Fijo
('MTY123', 87),  -- Trabajo
('MTY456', 88),  -- Casa
('PBL123', 89),  -- Otro
('PBL456', 90),
('MAD123', 132),
('MAD456', 130),
('BCN123',124),
('BCN123',124);


-- Continuar hasta el 100 si es necesario
SELECT * FROM `tipoDireccion`;
-- ========================================================================
-- INCERSACION DE BASSE DE tabla tipo direccion
INSERT INTO tipoDireccion (tipodireccion) VALUES 
('Oficina'),
('Residencia');


INSERT INTO direccionGlobal (direccion, tipoDireccion) VALUES 
('Oficina 1, Calle A', 1),
('Oficina 2, Calle B', 1),
('Oficina 3, Calle C', 1),
('Oficina 4, Calle D', 1),
('Oficina 5, Calle E', 1),
('Oficina 6, Calle F', 1),
('Oficina 7, Calle G', 1),
('Oficina 8, Calle H', 1),
('Oficina 9, Calle I', 1),
('Oficina 10, Calle J', 1),
('Oficina 11, Calle K', 1),
('Oficina 12, Calle L', 1),
('Oficina 13, Calle M', 1),
('Oficina 14, Calle N', 1),
('Oficina 15, Calle O', 1),
('Oficina 16, Calle P', 1),
('Oficina 17, Calle Q', 1),
('Oficina 18, Calle R', 1),
('Oficina 19, Calle S', 1), 
('Oficina 20, Calle T', 1),
('Oficina 21, Calle U', 1),
('Oficina 22, Calle V', 1),
('Oficina 23, Calle W', 1),
('Oficina 24, Calle X', 1),
('Oficina 25, Calle Y', 1),
('Oficina 26, Calle Z', 1),
('Oficina 27, Calle AA', 1),
('Oficina 28, Calle BB', 1),
('Oficina 29, Calle CC', 1),
('Oficina 30, Calle DD', 1),
('Oficina 31, Calle EE', 1),
('Oficina 32, Calle FF', 1),
('Oficina 33, Calle GG', 1),
('Oficina 34, Calle HH', 1),
('Oficina 35, Calle II', 1),
('Oficina 36, Calle JJ', 1),
('Oficina 37, Calle KK', 1),
('Oficina 38, Calle LL', 1),
('Oficina 39, Calle MM', 1),
('Oficina 40, Calle NN', 1),
('Oficina 41, Calle OO', 1),
('Oficina 42, Calle PP', 1),
('Oficina 43, Calle QQ', 1),
('Oficina 44, Calle RR', 1),
('Oficina 45, Calle SS', 1),
('Oficina 46, Calle TT', 1),
('Oficina 47, Calle UU', 1),
('Oficina 48, Calle VV', 1),
('Oficina 49, Calle WW', 1),
('Oficina 50, Calle XX', 1),
('Oficina 51, Calle YY', 1),
('Oficina 52, Calle ZZ', 1),
('Oficina 53, Calle AAA', 1),
('Oficina 54, Calle BBB', 1),
('Oficina 55, Calle CCC', 1),
('Oficina 56, Calle DDD', 1),
('Casa 1, Av. Principal X', 2),
('Casa 2, Av. Principal Y', 2),
('Casa 3, Av. Principal Z', 2),
('Casa 4, Av. Principal W', 2),
('Casa 5, Av. Principal V', 2),
('Casa 6, Av. Principal U', 2),
('Casa 7, Av. Principal T', 2),
('Casa 8, Av. Principal S', 2),
('Casa 9, Av. Principal R', 2),
('Casa 10, Av. Principal Q', 2),
('Casa 11, Av. Principal P', 2),
('Casa 12, Av. Principal O', 2),
('Casa 13, Av. Principal N', 2),
('Casa 14, Av. Principal M', 2),
('Casa 15, Av. Principal L', 2),
('Casa 16, Av. Principal K', 2),
('Casa 17, Av. Principal J', 2),
('Casa 18, Av. Principal I', 2),
('Casa 19, Av. Principal H', 2),
('Casa 20, Av. Principal G', 2);




-- ========================================================================

INSERT INTO direccionOficina (codigo_Oficina, idGlobalDireccion) VALUES 
('BA123', 1),
('BA456', 2),
('LP123', 3),
('LP456', 4),
('CO123', 5),
('CO456', 6),
('VCP123', 7),
('VCP456', 8),
('ME123', 9),
('ME456', 10),
('SR123', 11),
('SR456', 12),
('MTV123', 13),
('MTV456', 14),
('PDE123', 15),
('PDE456', 16),
('ASU123', 17),
('ASU456', 18),
('ENC123', 19),
('ENC456', 20),
('MAD123', 21),
('MAD456', 22),
('BCN123', 23),
('BCN456', 24),
('PRS123', 25),
('PRS456', 26),
('MAR123', 27),
('MAR456', 28),
('ROM123', 29),
('ROM456', 30),
('MIL123', 31),
('MIL456', 32),
('NY123', 33),
('NY456', 34),
('BK123', 35),
('BK456', 36),
('LA123', 37),
('LA456', 38),
('HW123', 39),
('HW456', 40),
('TOR123', 41),
('TOR456', 42),
('MSA123', 43),
('MSA456', 44),
('MTL123', 45),
('MTL456', 46),
('QUE123', 47),
('QUE456', 48),
('CDMX123', 49),
('CDMX456', 50),
('GDL123', 51),
('GDL456', 52),
('MTY123', 53),
('MTY456', 54),
('PBL123', 55),
('PBL456', 56);

INSERT INTO direccionCliente (idCliente, idGlobalDireccion) VALUES 
(1, 57),
(2, 58),
(3, 59),
(4, 60),
(5, 61),
(6, 62),
(7, 63),
(8, 64),
(9, 65),
(10, 66),
(11, 67),
(12, 68),
(13, 69),
(14, 70),
(15, 71),
(16, 72),
(17, 73),
(18, 74),
(19, 75),
(20, 76);