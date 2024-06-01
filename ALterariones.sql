use jardineriaGomez;


-- para alaterar los registros de una tabla
UPDATE cliente
SET codigo_empleado_rep_ventas = NULL
WHERE codigo_cliente = 10;


UPDATE pago
SET fecha_pago = '2008-05-15'
WHERE Id_transaccion = 10;

UPDATE pedido
SET fecha_pedido =  '2023-01-23'
WHERE codigo_pedido = 49612;

UPDATE pago
SET fecha_pago =  '2008-11-23'
WHERE Id_transaccion = 11;
UPDATE pago
SET codigo_cliente =  12
WHERE Id_transaccion = 4;

UPDATE producto
SET gama =  'Ornamentales'
WHERE codigo_producto = 1;

UPDATE pedido
SET idEstadoPedido =  2
WHERE codigo_pedido = 12343;
UPDATE pedido
SET codigo_cliente =  12
WHERE codigo_pedido = 16347;

UPDATE pedido
SET fecha_pedido =  '2009-09-15'
WHERE codigo_pedido = 12343;

UPDATE pedido
SET fecha_entrega =  '2024-06-01'
WHERE codigo_pedido = 18346;

UPDATE pedido
SET fecha_entrega =  '2024-06-07'
WHERE codigo_pedido = 45912;




UPDATE cliente
SET codigo_empleado_rep_ventas =  9
WHERE codigo_cliente = 20;

UPDATE cliente
SET codigo_empleado_rep_ventas =  20
WHERE codigo_cliente = 10;

UPDATE cliente
SET codigo_empleado_rep_ventas =  NULL
WHERE codigo_cliente = 1 ;

UPDATE cliente
SET codigo_empleado_rep_ventas =  20
WHERE codigo_cliente = 21 ;

UPDATE cliente
SET codigo_empleado_rep_ventas =  20
WHERE codigo_cliente = 22;

UPDATE empleado
SET codigo_jefe =  2
WHERE codigo_empleado = 3;

UPDATE empleado
SET codigo_jefe =  4
WHERE codigo_empleado =5 ;

UPDATE empleado
SET codigo_jefe =  6
WHERE codigo_empleado = 7 ;

UPDATE empleado
SET codigo_Oficina = NULL
WHERE codigo_empleado = 7 ;
UPDATE empleado
SET codigo_Oficina = NULL
WHERE codigo_empleado = 2 ;

UPDATE cliente
SET codigo_empleado_rep_ventas = NULL
WHERE codigo_cliente = 2 ;


UPDATE cliente
SET codigo_empleado_rep_ventas = NULL
WHERE codigo_cliente = 2 ;

