USE jardineriaGomez;
/*
1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
*/

SELECT * FROM `Oficina`;
SELECT * FROM ciudad;
SELECT * FROM region;
SELECT * FROM pais;
SELECT * FROM `telefonoOficina`;
SELECT * FROM `telefonoGlobal`;
SELECT * FROM `direccionOficina`

SELECT C.nombre AS Nombre_Oficina, O.codigo_Oficina
FROM ciudad AS C
INNER JOIN Oficina AS O
ON C.idCiudad = O.idCiudad;

/*
2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
*/
SET @valorConsulta = 0;
-- oficinas de españa
SELECT C.nombre AS Ciudad, TG.telefono AS Telefono, OFI.codigo_Oficina , P.nombrePais
FROM pais AS P
INNER JOIN region AS R ON P.idPais = R.idPais
INNER JOIN ciudad AS C ON R.idRegion = C.idRegion
INNER JOIN Oficina AS OFI ON C.idCiudad = OFI.idCiudad
INNER JOIN telefonoOficina AS TOFI ON OFI.codigo_Oficina = TOFI.codigo_Oficina
INNER JOIN telefonoGlobal AS TG ON TOFI.idGlobalPhone = TG.idGlobalPhone
WHERE  P.nombrePais = 'España';

/*
3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
jefe tiene un código de jefe igual a 7.
*/
SELECT * FROM empleado;
SELECT DISTINCT 
    CONCAT(C.nombre, ' ', COALESCE(C.apellido1, ''), ' ', COALESCE(C.apellido2, '')) AS Nombre_Cliente,
    C.email
FROM empleado as C
WHERE C.codigo_jefe = 7;

/*
4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
empresa.
*/

SELECT DISTINCT 
    CONCAT(C.nombre, ' ', COALESCE(C.apellido1, ''), ' ', COALESCE(C.apellido2, '')) AS Nombre_Cliente,
    C.email,
    C.puesto
FROM empleado as C
WHERE C.codigo_jefe IS NULL and  C.puesto = 'Gerente';

SELECT * FROM cliente;
/*
5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
empleados que no sean representantes de ventas.
*/

SELECT DISTINCT 
    CONCAT(C.nombre, ' ', COALESCE(C.apellido1, ''), ' ', COALESCE(C.apellido2, '')) AS Nombre_Cliente,
    C.email,
    C.puesto
FROM empleado as C
LEFT JOIN cliente as CL
ON C.codigo_empleado = CL.codigo_empleado_rep_ventas
WHERE CL.apellido_contacto IS NULL;

/*
6. Devuelve un listado con el nombre de los todos los clientes españoles.
*/

SELECT  C.nombre AS Ciudad,  
        P.nombrePais,
         CONCAT(CL.nombre_cliente, ' ', COALESCE(CL.apellido_contacto, '')) AS Nombre_Cliente
FROM pais AS P
INNER JOIN region AS R ON P.idPais = R.idPais
INNER JOIN ciudad AS C ON R.idRegion = C.idRegion
INNER JOIN cliente as CL ON C.idCiudad = CL.idCiudad
WHERE  P.nombrePais = 'España';

/*
7. Devuelve un listado con los distintos estados por los que puede pasar un
pedido.
*/

SELECT estadoNombrePedido FROM `estadoPedido`;

/*
8. Devuelve un listado con el código de cliente de aquellos clientes que
realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
*/

SELECT  CONCAT(CL.nombre_cliente, ' ', COALESCE(CL.apellido_contacto, '')) AS Nombre_Cliente
FROM cliente AS CL
LEFT JOIN pago AS P 
ON CL.codigo_cliente = P.codigo_cliente
WHERE YEAR(P.fecha_pago) = 2008;


/*
Utilizando la función DATE_FORMAT de MySQL.
*/

SELECT CONCAT(CL.nombre_cliente, ' ', COALESCE(CL.apellido_contacto, '')) AS Nombre_Cliente
FROM cliente AS CL
LEFT JOIN pago AS P ON CL.codigo_cliente = P.codigo_cliente
WHERE DATE_FORMAT(P.fecha_pago, '%Y') = '2008';

/*
• Sin utilizar ninguna de las funciones anteriores.
*/
SELECT CONCAT(CL.nombre_cliente, ' ', COALESCE(CL.apellido_contacto, '')) AS Nombre_Cliente
FROM cliente AS CL
LEFT JOIN pago AS P ON CL.codigo_cliente = P.codigo_cliente
WHERE fecha_pago BETWEEN '2008-01-01' AND '2008-12-31';

/*
9. Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y fecha de entrega de los pedidos que no han sido entregados a
tiempo.
*/

SELECT P.codigo_pedido, P.codigo_cliente, P.fecha_esperada,
        IF(P.fecha_entrega IS NOT NULL, P.fecha_entrega, 'No entregado') as fecha_entrega    
FROM pedido AS P
WHERE P.fecha_entrega  is NULL ;

/*
10. Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
menos dos días antes de la fecha esperada.
*/

/*
La función ABS en MySQL devuelve el valor absoluto de un número. El valor absoluto de un número es su valor sin signo, es decir, es siempre no negativo. Por ejemplo, el valor absoluto de -3 es 3 y el valor absoluto de 3 es 3.

Cuando se aplica ABS a una diferencia de fechas calculada con DATEDIFF, se asegura de que la diferencia sea tratada como positiva independientemente de si la fecha de entrega es antes o después de la fecha esperada.
*/

SELECT 
    P.codigo_pedido, P.codigo_cliente, P.fecha_esperada, P.fecha_entrega
FROM 
    pedido AS P
WHERE 
    ABS(DATEDIFF(P.fecha_entrega, P.fecha_esperada)) <= 2;


SELECT 
    P.codigo_pedido, P.codigo_cliente, P.fecha_esperada, P.fecha_entrega
FROM 
    pedido AS P
WHERE
 P.fecha_entrega BETWEEN P.fecha_esperada AND ADDDATE(P.fecha_esperada, INTERVAL 2 DAY);

 SELECT 
    P.codigo_pedido, P.codigo_cliente, P.fecha_esperada, P.fecha_entrega
FROM 
    pedido AS P
WHERE P.fecha_entrega BETWEEN P.fecha_esperada AND (P.fecha_esperada + INTERVAL 2 DAY);

/*
11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
*/


SELECT P.codigo_pedido, P.codigo_cliente, P.fecha_esperada, P.fecha_entrega, EP.estadoNombrePedido
FROM pedido AS P
INNER JOIN estadoPedido AS EP ON P.idEstadoPedido = EP.idEstadoPedido
WHERE EP.estadoNombrePedido LIKE 'Rechazado%' AND YEAR(P.fecha_pedido) = '2009';

/*
12. Devuelve un listado de todos los pedidos que han sido entregados en el
mes de enero de cualquier año.
*/

SELECT fecha_pedido, codigo_pedido
FROM pedido
WHERE MONTH(fecha_pedido) = '01';

/*
13. Devuelve un listado con todos los pagos que se realizaron en el
año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
*/

SELECT fecha_pago, forma_pago
FROM pago
WHERE YEAR(fecha_pago) = '2008' AND forma_pago = 'PayPal';

/*
14. Devuelve un listado con todas las formas de pago que aparecen en la
tabla pago. Tenga en cuenta que no deben aparecer formas de pago
repetidas.
*/


SELECT DISTINCT forma_pago
FROM pago;

/*
15. Devuelve un listado con todos los productos que pertenecen a la
gama Ornamentales y que tienen más de 100 unidades en stock. El listado
deberá estar ordenado por su precio de venta, mostrando en primer lugar
los de mayor precio.
*/


SELECT G.gama AS Gama , P.cantidad_en_stock, P.precio_venta
FROM gama_producto as G
INNER JOIN producto as P 
ON G.gama = P.gama
WHERE P.cantidad_en_stock >= 100 AND G.gama = 'Ornamentales'
ORDER BY P.precio_venta;

/*
16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
cuyo representante de ventas tenga el código de empleado 11 o 30.
*/



SELECT CL.nombre_cliente , C.nombre
FROM cliente as CL
INNER JOIN ciudad as C
ON CL.idCiudad = C.idCiudad
WHERE C.nombre = 'Madrid' AND CL.codigo_empleado_rep_ventas = 11;

/*
============================= Consultas multitabla (Composición interna) ============================
*/

/*
1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
representante de ventas.
*/


SELECT  CONCAT(CL.nombre, ' ', COALESCE(CL.apellido1, ''),' ', COALESCE(CL.apellido1, '')) AS Nombre_empleado, C.nombre_cliente AS Cliente
FROM empleado AS CL
INNER JOIN cliente AS C
ON CL.codigo_empleado = C.codigo_empleado_rep_ventas
ORDER BY C.nombre_cliente;

/*
2. Muestra el nombre de los clientes que hayan realizado pagos junto con el
nombre de sus representantes de ventas.
*/

SELECT  
CONCAT(CL.nombre, ' ', COALESCE(CL.apellido1, ''),' ', COALESCE(CL.apellido1, '')) AS Nombre_empleado, 
IF(CLT.nombre_cliente IS NOT NULL, CLT.nombre_cliente, 'No tiene cliente') as pago_norealizado ,
IF(PA.total IS NOT NULL, PA.total, 'no realizo pago') as pago_norealizado  
FROM empleado AS CL
LEFT JOIN cliente AS CLT ON CL.codigo_empleado = CLT.codigo_empleado_rep_ventas
LEFT JOIN pago AS PA ON CLT.codigo_cliente = PA.codigo_cliente;

/*
3. Muestra el nombre de los clientes que no hayan realizado pagos junto con
el nombre de sus representantes de ventas.
*/

-- fueron atendidos pidieron pero no pagaron

SELECT  
IF(CL.nombre IS NOT NULL, CL.nombre, 'No tiene cliente') asempleado,
IF(CLT.nombre_cliente IS NOT NULL, CLT.nombre_cliente, 'No tiene cliente') as nombre_cliente
FROM empleado AS CL
LEFT JOIN cliente AS CLT ON CL.codigo_empleado = CLT.codigo_empleado_rep_ventas
LEFT JOIN pago AS PA ON CLT.codigo_cliente = PA.codigo_cliente
WHERE PA.codigo_cliente is null;

/*
4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
representantes junto con la ciudad de la oficina a la que pertenece el
representante.
*/
-- inner me incluye todo de ambas el left me excluye alguna de ellas 

/*
INNER JOIN: Utilizado para asegurar que solo se incluyen ciudades que tienen una oficina, empleados asociados y clientes asociados.
LEFT JOIN: Se utiliza para unir con la tabla de pagos y luego filtrar aquellos registros donde no hay un pago realizado.
*/
SELECT DISTINCT
    CASE 
        WHEN CLT.nombre_cliente IS NOT NULL THEN CLT.nombre_cliente 
        ELSE 'No tiene cliente' 
    END AS nombre_cliente,
    CASE 
        WHEN CL.nombre IS NOT NULL THEN CL.nombre 
        ELSE 'No tiene cliente' 
    END AS empleado,
    CD.nombre AS Ciudad_Representante
FROM ciudad AS CD
INNER JOIN oficina AS OFI ON CD.idCiudad = OFI.idCiudad
INNER JOIN empleado AS CL ON OFI.codigo_oficina = CL.codigo_Oficina
INNER JOIN cliente AS CLT ON CL.codigo_empleado = CLT.codigo_empleado_rep_ventas
INNER JOIN pago AS PA ON CLT.codigo_cliente = PA.codigo_cliente;

/*
5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre
de sus representantes junto con la ciudad de la oficina a la que pertenece el
representante.
*/

SELECT DISTINCT
    CASE 
        WHEN CLT.nombre_cliente IS NOT NULL THEN CLT.nombre_cliente 
        ELSE 'No tiene cliente' 
    END AS nombre_cliente,
    CASE 
        WHEN CL.nombre IS NOT NULL THEN CL.nombre 
        ELSE 'No tiene cliente' 
    END AS empleado,
    CD.nombre AS Ciudad_Representante
FROM ciudad AS CD
INNER JOIN oficina AS OFI ON CD.idCiudad = OFI.idCiudad
INNER JOIN empleado AS CL ON OFI.codigo_oficina = CL.codigo_Oficina
INNER JOIN cliente AS CLT ON CL.codigo_empleado = CLT.codigo_empleado_rep_ventas
LEFT JOIN pago AS PA ON CLT.codigo_cliente = PA.codigo_cliente
WHERE PA.codigo_cliente IS  NULL;
/*
6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
*/


SELECT  CIU.nombre AS Ciudad,
        OFI.codigo_Oficina AS Codec_Oficina,
        DG.direccion AS Direccion,
        CL.nombre_cliente AS Cliente
FROM cliente AS CL
INNER JOIN ciudad AS CIU ON Cl.idCiudad = CIU.idCiudad
INNER JOIN oficina AS OFI ON CIU.idCiudad = OFI.idCiudad
INNER JOIN direccionoficina AS DF ON OFI.codigo_Oficina = DF.codigo_Oficina
INNER JOIN direccionglobal AS DG ON DF.idGlobalDireccion = DG.idGlobalDireccion
WHERE CIU.nombre = 'Madrid';

/*
7. Devuelve el nombre de los clientes y el nombre de sus representantes junto
con la ciudad de la oficina a la que pertenece el representante.
*/


SELECT  CL.nombre_cliente AS Cliente,
        CONCAT(EM.nombre, ' ', COALESCE(EM.apellido1, ''),' ', COALESCE(EM.apellido2, '')) AS Representante,
        CIU.nombre AS Ciudad_Representante,
        OFI.codigo_Oficina AS Codec_Oficina_Representante
FROM cliente AS CL
INNER JOIN empleado AS EM ON CL.codigo_empleado_rep_ventas = EM.codigo_empleado
INNER JOIN oficina AS OFI ON EM.`codigo_Oficina` = OFI.`codigo_Oficina`
INNER JOIN ciudad AS CIU ON OFI.`idCiudad` = CIU.`idCiudad`;
        
/*
8. Devuelve un listado con el nombre de los empleados junto con el nombre
de sus jefes.
*/


SELECT 
    CONCAT(EM.nombre, ' ', COALESCE(EM.apellido1, ''), ' ', COALESCE(EM.apellido2, '')) AS Representante,
    CONCAT(JF.nombre, ' ', COALESCE(JF.apellido1, ''), ' ', COALESCE(JF.apellido2, '')) AS Jefe
FROM empleado AS EM
INNER JOIN empleado AS JF ON EM.codigo_jefe = JF.codigo_empleado;


/*
9. Devuelve un listado que muestre el nombre de cada empleados, el nombre
de su jefe y el nombre del jefe de sus jefe.
*/

SELECT 
    CONCAT(EM.nombre, ' ', COALESCE(EM.apellido1, ''), ' ', COALESCE(EM.apellido2, '')) AS Empleado,
    CONCAT(JF.nombre, ' ', COALESCE(JF.apellido1, ''), ' ', COALESCE(JF.apellido2, '')) AS Jefe,
    CONCAT(JFF.nombre, ' ', COALESCE(JFF.apellido1, ''), ' ', COALESCE(JFF.apellido2, '')) AS Jefe_De_los_Jefes
FROM empleado AS EM
INNER JOIN empleado AS JF ON EM.codigo_jefe = JF.codigo_empleado
INNER JOIN empleado AS JFF ON JF.codigo_jefe = JFF.codigo_empleado;

/*
10. Devuelve el nombre de los clientes a los que no se les ha entregado a
tiempo un pedido.
*/

SELECT  CL.nombre_cliente AS Cliente,
        PE.fecha_entrega AS Fecha_Entrega_Mora
FROM cliente AS CL
INNER JOIN pedido AS PE ON CL.codigo_cliente = PE.codigo_cliente
WHERE PE.fecha_entrega > PE.fecha_esperada; 

/*
11. Devuelve un listado de las diferentes gamas de producto que ha comprado
cada cliente.
*/


SELECT CL.nombre_cliente AS Cliente,
        GP.gama AS Gama
FROM gama_producto AS GP
INNER JOIN producto AS PR ON GP.gama = PR.gama
INNER JOIN detalle_pedido AS EP ON PR.codigo_producto = EP.codigo_producto
INNER JOIN pedido AS PD ON EP.codigo_pedido = PD.codigo_pedido
INNER JOIN cliente AS CL ON PD.codigo_cliente= CL.codigo_cliente;

-- Consultas multitabla (Composición externa)

/*
1. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pago.
*/


SELECT CL.nombre_cliente , CL.codigo_cliente
FROM cliente AS CL
LEFT JOIN pago AS PA 
ON CL.codigo_cliente = PA.codigo_cliente
WHERE PA.codigo_cliente IS NULL;

/*
2. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pedido.
*/

SELECT CL.nombre_cliente , CL.codigo_cliente
FROM cliente AS CL
LEFT JOIN pedido AS PA 
ON CL.codigo_cliente = PA.codigo_cliente
WHERE PA.codigo_cliente IS NULL;
/*
3. Devuelve un listado que muestre los clientes que no han realizado ningún
pago y los que no han realizado ningún pedido.
*/
SELECT CL.nombre_cliente, CL.codigo_cliente
FROM cliente AS CL
LEFT JOIN pago AS PA ON CL.codigo_cliente = PA.codigo_cliente
LEFT JOIN pedido AS PE ON CL.codigo_cliente = PE.codigo_cliente
WHERE PA.codigo_cliente IS NULL AND PE.codigo_cliente IS NULL;

-- Clientes que han pedido pero no han pagado

SELECT CL.nombre_cliente, CL.codigo_cliente
FROM cliente AS CL
LEFT JOIN pago AS PA ON CL.codigo_cliente = PA.codigo_cliente
INNER JOIN pedido AS PE ON CL.codigo_cliente = PE.codigo_cliente
WHERE PA.codigo_cliente IS NULL;


/*
4. Devuelve un listado que muestre solamente los empleados que no tienen
una oficina asociada.
*/


SELECT CONCAT(EM.nombre, ' ', COALESCE(EM.apellido1, ''), ' ', COALESCE(EM.apellido2, '')) AS Empleado, 
    EM.codigo_empleado,
    CASE 
        WHEN EM.codigo_Oficina IS NOT NULL THEN EM.codigo_Oficina 
        ELSE 'No tiene Oficina asignada' 
    END AS Asignacion_OFI
FROM empleado AS EM
LEFT JOIN oficina AS OFI
ON EM.codigo_Oficina = OFI.codigo_Oficina
WHERE  EM.`codigo_Oficina` IS NULL;

/*
5. Devuelve un listado que muestre solamente los empleados que no tienen un
cliente asociado.
*/

SELECT CONCAT(EM.nombre, ' ', COALESCE(EM.apellido1, ''), ' ', COALESCE(EM.apellido2, '')) AS Empleado,
    CASE 
        WHEN CL.codigo_empleado_rep_ventas IS NOT NULL THEN CL.codigo_empleado_rep_ventas
        ELSE 'No tiene Cliente asignado' 
    END AS Asignacion_CL
FROM empleado AS EM
LEFT JOIN cliente AS CL
ON CL.codigo_empleado_rep_ventas = EM.codigo_empleado
WHERE CL.codigo_empleado_rep_ventas IS NULL;

/*
6. Devuelve un listado que muestre solamente los empleados que no tienen un
cliente asociado junto con los datos de la oficina donde trabajan.
*/

SELECT 
    CONCAT(EM.nombre, ' ', COALESCE(EM.apellido1, ''), ' ', COALESCE(EM.apellido2, '')) AS Empleado,
    CASE 
        WHEN CL.codigo_empleado_rep_ventas IS NOT NULL THEN CL.codigo_empleado_rep_ventas
        ELSE 'No tiene Cliente asignado' 
    END AS Asignacion_CL,
    OFI.codigo_Oficina AS CODEC_OFI,
    CIU.nombre AS Ciudad
FROM empleado AS EM
LEFT JOIN cliente AS CL ON CL.codigo_empleado_rep_ventas = EM.codigo_empleado
INNER JOIN oficina AS OFI ON EM.codigo_Oficina = OFI.codigo_Oficina
INNER JOIN ciudad AS CIU ON OFI.idCiudad = CIU.idCiudad
WHERE CL.codigo_empleado_rep_ventas IS NULL;


/*
7. Devuelve un listado que muestre los empleados que no tienen una oficina
asociada y los que no tienen un cliente asociado.
*/

SELECT 
    CONCAT(EM.nombre, ' ', COALESCE(EM.apellido1, ''), ' ', COALESCE(EM.apellido2, '')) AS Empleado,
    CASE 
        WHEN CL.codigo_empleado_rep_ventas IS NOT NULL THEN CL.codigo_empleado_rep_ventas
        ELSE 'No tiene Cliente asignado' 
    END AS Asignacion_CL,
    CASE 
        WHEN OFI.codigo_Oficina IS NOT NULL THEN OFI.codigo_Oficina
        ELSE 'No tiene Oficina' 
    END AS OFI_Asignada
FROM empleado AS EM
LEFT JOIN cliente AS CL ON CL.codigo_empleado_rep_ventas = EM.codigo_empleado
LEFT JOIN oficina AS OFI ON EM.codigo_Oficina = OFI.codigo_Oficina
LEFT JOIN ciudad AS CIU ON OFI.idCiudad = CIU.idCiudad
WHERE CL.codigo_empleado_rep_ventas IS NULL AND OFI.codigo_Oficina IS NULL ;


/*
8. Devuelve un listado de los productos que nunca han aparecido en un
pedido.
*/


SELECT  PR.nombre AS Nombre_Producto,
        PR.codigo_producto AS CODEC
FROM producto AS PR
LEFT JOIN detalle_pedido AS DP ON PR.codigo_producto = DP.codigo_producto
WHERE DP.codigo_producto IS NULL;

/*
9. Devuelve un listado de los productos que nunca han aparecido en un
pedido. El resultado debe mostrar el nombre, la descripción y la imagen del
producto.
*/

SELECT  PR.nombre AS Nombre_Producto,
        PR.codigo_producto AS CODEC,
        PR.descripcion AS DESC_Producto
FROM producto AS PR
LEFT JOIN detalle_pedido AS DP ON PR.codigo_producto = DP.codigo_producto
WHERE DP.codigo_producto IS NULL;

/*
10. Devuelve las oficinas donde no trabajan ninguno de los empleados que
hayan sido los representantes de ventas de algún cliente que haya realizado
la compra de algún producto de la gama Frutales.
*/

SELECT 
    CONCAT(EM.nombre, ' ', COALESCE(EM.apellido1, ''), ' ', COALESCE(EM.apellido2, '')) AS Empleado,
    CASE 
        WHEN CL.codigo_empleado_rep_ventas IS NOT NULL THEN CL.codigo_empleado_rep_ventas
        ELSE 'No tiene Cliente asignado' 
    END AS Asignacion_CL,
    OFI.codigo_Oficina AS CODEC_OFI,
    CIU.nombre AS Ciudad
FROM empleado AS EM
LEFT JOIN cliente AS CL ON CL.codigo_empleado_rep_ventas = EM.codigo_empleado
INNER JOIN oficina AS OFI ON EM.codigo_Oficina = OFI.codigo_Oficina
INNER JOIN ciudad AS CIU ON OFI.idCiudad = CIU.idCiudad
WHERE CL.codigo_empleado_rep_ventas IS NULL;
/*
11. Devuelve un listado con los clientes que han realizado algún pedido pero no
han realizado ningún pago.
*/

SELECT CL.nombre_cliente, CL.codigo_cliente
FROM cliente AS CL
LEFT JOIN pago AS PA ON CL.codigo_cliente = PA.codigo_cliente
INNER JOIN pedido AS PE ON CL.codigo_cliente = PE.codigo_cliente
WHERE PA.codigo_cliente IS NULL;

/*
12. Devuelve un listado con los datos de los empleados que no tienen clientes
asociados y el nombre de su jefe asociado.
*/
SELECT 
    CONCAT(EM.nombre, ' ', COALESCE(EM.apellido1, ''), ' ', COALESCE(EM.apellido2, '')) AS Empleado,
    CONCAT(JF.nombre, ' ', COALESCE(JF.apellido1, ''), ' ', COALESCE(JF.apellido2, '')) AS Jefe
FROM empleado AS EM
LEFT JOIN cliente AS CL ON EM.codigo_empleado = CL.codigo_empleado_rep_ventas
INNER JOIN empleado AS JF ON EM.codigo_jefe = JF.codigo_empleado
WHERE CL.codigo_empleado_rep_ventas IS NULL;
