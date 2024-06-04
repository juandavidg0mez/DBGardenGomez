## DB Garden

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

~~~~mysql
SELECT C.nombre AS Nombre_Oficina, O.codigo_Oficina
FROM ciudad AS C
INNER JOIN Oficina AS O
ON C.idCiudad = O.idCiudad;
~~~~

##  Resultado:

<pre>
+-------------------+----------------+
| Nombre_Oficina    | codigo_Oficina |
+-------------------+----------------+
| Buenos Aires      | BA123          |
| Buenos Aires      | BA456          |
| La Plata          | LP123          |
| La Plata          | LP456          |
| Córdoba           | CO123          |
| Córdoba           | CO456          |
| Villa Carlos Paz  | VCP123         |
| Villa Carlos Paz  | VCP456         |
| Mendoza           | ME123          |
| Mendoza           | ME456          |
| San Rafael        | SR123          |
| San Rafael        | SR456          |
| Montevideo        | MTV123         |
| Montevideo        | MTV456         |
| Punta del Este    | PDE123         |
| Punta del Este    | PDE456         |
| Asunción          | ASU123         |
| Asunción          | ASU456         |
| Encarnación       | ENC123         |
| Encarnación       | ENC456         |
| Madrid            | MAD123         |
| Madrid            | MAD456         |
| Barcelona         | BCN123         |
| Barcelona         | BCN456         |
| París             | PRS123         |
| París             | PRS456         |
| Marsella          | MAR123         |
| Marsella          | MAR456         |
| Roma              | ROM123         |
| Roma              | ROM456         |
| Milán             | MIL123         |
| Milán             | MIL456         |
| Nueva York        | NY123          |
| Nueva York        | NY456          |
| Brooklyn          | BK123          |
| Brooklyn          | BK456          |
| Los Ángeles       | LA123          |
| Los Ángeles       | LA456          |
| Hollywood         | HW123          |
| Hollywood         | HW456          |
| Toronto           | TOR123         |
| Toronto           | TOR456         |
| Mississauga       | MSA123         |
| Mississauga       | MSA456         |
| Montreal          | MTL123         |
| Montreal          | MTL456         |
| Quebec            | QUE123         |
| Quebec            | QUE456         |
| Ciudad de México  | CDMX123        |
| Ciudad de México  | CDMX456        |
| Guadalajara       | GDL123         |
| Guadalajara       | GDL456         |
| Monterrey         | MTY123         |
| Monterrey         | MTY456         |
| Puebla            | PBL123         |
| Puebla            | PBL456         |
+-------------------+----------------+
</pre>

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
~~~~ mysql
SELECT C.nombre AS Ciudad, TG.telefono AS Telefono, OFI.codigo_Oficina , P.nombrePais
FROM pais AS P
INNER JOIN region AS R ON P.idPais = R.idPais
INNER JOIN ciudad AS C ON R.idRegion = C.idRegion
INNER JOIN Oficina AS OFI ON C.idCiudad = OFI.idCiudad
INNER JOIN telefonoOficina AS TOFI ON OFI.codigo_Oficina = TOFI.codigo_Oficina
INNER JOIN telefonoGlobal AS TG ON TOFI.idGlobalPhone = TG.idGlobalPhone
WHERE  P.nombrePais = 'España';
~~~~
## Resultado:
<pre>
+-----------+--------------+----------------+------------+
| Ciudad    | Telefono     | codigo_Oficina | nombrePais |
+-----------+--------------+----------------+------------+
| Madrid    | 555-109-8763 | MAD123         | España     |
| Madrid    | 555-987-0985 | MAD456         | España     |
| Barcelona | 555-321-6542 | BCN123         | España     |
| Barcelona | 555-321-6542 | BCN123         | España     |
+-----------+--------------+----------------+------------+
</pre>

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
jefe tiene un código de jefe igual a 7.
~~~~ mysql
SELECT DISTINCT 
    CONCAT(C.nombre, ' ', COALESCE(C.apellido1, ''), ' ', COALESCE(C.apellido2, '')) AS Nombre_Cliente,
    C.email
FROM empleado as C
WHERE C.codigo_jefe = 7;
~~~~
## Resultado:
<pre>
+--------------------+-------------------------+
| Nombre_Cliente     | email                   |
+--------------------+-------------------------+
| Sofia Reyes Santos | sofia.reyes@example.com |
+--------------------+-------------------------+
</pre>

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
empresa.
~~~~ mysql
SELECT DISTINCT 
    CONCAT(C.nombre, ' ', COALESCE(C.apellido1, ''), ' ', COALESCE(C.apellido2, '')) AS Nombre_Cliente,
    C.email,
    C.puesto
FROM empleado as C
WHERE C.codigo_jefe IS NULL and  C.puesto = 'Gerente';
~~~~

## Resultado:
<pre>
+--------------------+-------------------------+
| Nombre_Cliente     | email                   |
+--------------------+-------------------------+
| Sofia Reyes Santos | sofia.reyes@example.com |
+--------------------+-------------------------+
</pre>
5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
empleados que no sean representantes de ventas.
~~~~ mysql
SELECT DISTINCT 
    CONCAT(C.nombre, ' ', COALESCE(C.apellido1, ''), ' ', COALESCE(C.apellido2, '')) AS Nombre_Cliente,
    C.email,
    C.puesto
FROM empleado as C
LEFT JOIN cliente as CL
ON C.codigo_empleado = CL.codigo_empleado_rep_ventas
WHERE CL.apellido_contacto IS NULL;
~~~~
## Resultado:
<pre>
+---------------------------+-----------------------------+----------------------+
| Nombre_Cliente            | email                       | puesto               |
+---------------------------+-----------------------------+----------------------+
| Juan Perez Gonzalez       | juan.perez@example.com      | Gerente              |
| Carlos Martinez Hernandez | carlos.martinez@example.com | Analista de Ventas   |
| Luisa Torres Martin       | luisa.torres@example.com    | Analista de Sistemas |
+---------------------------+-----------------------------+----------------------+
</pre>
6. Devuelve un listado con el nombre de los todos los clientes españoles.

~~~~ mysql
SELECT  C.nombre AS Ciudad,  
        P.nombrePais,
         CONCAT(CL.nombre_cliente, ' ', COALESCE(CL.apellido_contacto, '')) AS Nombre_Cliente
FROM pais AS P
INNER JOIN region AS R ON P.idPais = R.idPais
INNER JOIN ciudad AS C ON R.idRegion = C.idRegion
INNER JOIN cliente as CL ON C.idCiudad = CL.idCiudad
WHERE  P.nombrePais = 'España';
~~~~

## Resultado:
<pre>
+-----------+------------+---------------------------------+
| Ciudad    | nombrePais | Nombre_Cliente                  |
+-----------+------------+---------------------------------+
| Madrid    | España     | Blue Ocean Enterprises Anderson |
| Barcelona | España     | Redwood Retailers Martinez      |
+-----------+------------+---------------------------------+</pre>

7. Devuelve un listado con los distintos estados por los que puede pasar un
pedido.

~~~~ mysql
SELECT estadoNombrePedido FROM `estadoPedido`;
~~~~
<pre>
## Resultado:
+------------------------------+
| estadoNombrePedido           |
+------------------------------+
| Pendiente                    |
| Rechazado                    |
| En espera de pago            |
| Enviado                      |
| Entregado                    |
| Cancelado por el cliente     |
| Cancelado por falta de stock |
| En revisión                  |
| Reembolsado                  |
| Devuelto                     |
| Rechazado por exceso de pago |
+------------------------------+
</pre>
8. Devuelve un listado con el código de cliente de aquellos clientes que
realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
~~~~ mysql
SELECT  CONCAT(CL.nombre_cliente, ' ', COALESCE(CL.apellido_contacto, '')) AS Nombre_Cliente
FROM cliente AS CL
LEFT JOIN pago AS P 
ON CL.codigo_cliente = P.codigo_cliente
WHERE YEAR(P.fecha_pago) = 2008;
~~~~
## Resultado:
<pre>
+---------------------------------+
| Nombre_Cliente                  |
+---------------------------------+
| Peak Performance Inc. Taylor    |
| Blue Ocean Enterprises Anderson |
+---------------------------------+
</pre>
## Utilizando la función DATE_FORMAT de MySQL.
~~~~ mysql
SELECT CONCAT(CL.nombre_cliente, ' ', COALESCE(CL.apellido_contacto, '')) AS Nombre_Cliente
FROM cliente AS CL
LEFT JOIN pago AS P ON CL.codigo_cliente = P.codigo_cliente
WHERE DATE_FORMAT(P.fecha_pago, '%Y') = '2008';
~~~~
## Resultado:
<pre>
+---------------------------------+
| Nombre_Cliente                  |
+---------------------------------+
| Peak Performance Inc. Taylor    |
| Blue Ocean Enterprises Anderson |
+---------------------------------+
</pre>

Sin utilizar ninguna de las funciones anteriores.
~~~~mysql
SELECT CONCAT(CL.nombre_cliente, ' ', COALESCE(CL.apellido_contacto, '')) AS Nombre_Cliente
FROM cliente AS CL
LEFT JOIN pago AS P ON CL.codigo_cliente = P.codigo_cliente
WHERE fecha_pago BETWEEN '2008-01-01' AND '2008-12-31';
~~~~
## Resultado:
<pre>
+---------------------------------+
| Nombre_Cliente                  |
+---------------------------------+
| Peak Performance Inc. Taylor    |
| Blue Ocean Enterprises Anderson |
+---------------------------------+
</pre>
9. Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y fecha de entrega de los pedidos que no han sido entregados a
tiempo.
~~~~mysql
SELECT P.codigo_pedido, P.codigo_cliente, P.fecha_esperada,
        IF(P.fecha_entrega IS NOT NULL, P.fecha_entrega, 'No entregado') as fecha_entrega    
FROM pedido AS P
WHERE P.fecha_entrega  is NULL ;
~~~~
## Resultado:
<pre>
+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|         12335 |              8 | 2024-05-29     | No entregado  |
|         12343 |              2 | 2024-06-04     | No entregado  |
|         12945 |             10 | 2024-05-26     | No entregado  |
+---------------+----------------+----------------+---------------+
</pre>
10. Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
menos dos días antes de la fecha esperada.

~~~~mysql
SELECT 
    P.codigo_pedido, P.codigo_cliente, P.fecha_esperada, P.fecha_entrega
FROM 
    pedido AS P
WHERE 
    ABS(DATEDIFF(P.fecha_entrega, P.fecha_esperada)) <= 2;
~~~~

## Resultado

<pre>
+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|         16347 |             12 | 2024-06-02     | 2024-06-02    |
|         18346 |              6 | 2024-05-30     | 2024-06-01    |
|         34343 |             12 | 2023-05-25     | 2023-05-25    |
|         45612 |              9 | 2024-05-28     | 2024-05-27    |
|         45616 |              3 | 2024-06-03     | 2024-06-03    |
|         95618 |              7 | 2024-05-30     | 2024-05-30    |
+---------------+----------------+----------------+---------------+
</pre>
~~~~mysql
SELECT 
    P.codigo_pedido, P.codigo_cliente, P.fecha_esperada, P.fecha_entrega
FROM 
    pedido AS P
WHERE
 P.fecha_entrega BETWEEN P.fecha_esperada AND ADDDATE(P.fecha_esperada, INTERVAL 2 DAY);
~~~~
## Resultado:
<pre>
+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|         16347 |             12 | 2024-06-02     | 2024-06-02    |
|         18346 |              6 | 2024-05-30     | 2024-06-01    |
|         34343 |             12 | 2023-05-25     | 2023-05-25    |
|         45616 |              3 | 2024-06-03     | 2024-06-03    |
|         95618 |              7 | 2024-05-30     | 2024-05-30    |
+---------------+----------------+----------------+---------------+
</pre>
~~~~mysql
 SELECT 
    P.codigo_pedido, P.codigo_cliente, P.fecha_esperada, P.fecha_entrega
FROM 
    pedido AS P
WHERE P.fecha_entrega BETWEEN P.fecha_esperada AND (P.fecha_esperada + INTERVAL 2 DAY);
~~~~

## Resultado:
<pre>
+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|         16347 |             12 | 2024-06-02     | 2024-06-02    |
|         18346 |              6 | 2024-05-30     | 2024-06-01    |
|         34343 |             12 | 2023-05-25     | 2023-05-25    |
|         45616 |              3 | 2024-06-03     | 2024-06-03    |
|         95618 |              7 | 2024-05-30     | 2024-05-30    |
+---------------+----------------+----------------+---------------+
</pre>
11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
~~~~mysql
SELECT P.codigo_pedido, P.codigo_cliente, P.fecha_esperada, P.fecha_entrega, EP.estadoNombrePedido
FROM pedido AS P
INNER JOIN estadoPedido AS EP ON P.idEstadoPedido = EP.idEstadoPedido
WHERE EP.estadoNombrePedido LIKE 'Rechazado%' AND YEAR(P.fecha_pedido) = '2009';
~~~~
## Resultado:
<pre>
+---------------+----------------+----------------+---------------+--------------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega | estadoNombrePedido |
+---------------+----------------+----------------+---------------+--------------------+
|         12343 |              2 | 2024-06-04     | NULL          | Rechazado          |
+---------------+----------------+----------------+---------------+--------------------+
</pre>
12. Devuelve un listado de todos los pedidos que han sido entregados en el
mes de enero de cualquier año.
~~~~mysql
SELECT fecha_pedido, codigo_pedido
FROM pedido
WHERE MONTH(fecha_pedido) = '01';
~~~~
## Resultado:
<pre>
+--------------+---------------+
| fecha_pedido | codigo_pedido |
+--------------+---------------+
| 2023-01-23   |         49612 |
+--------------+---------------+
</pre>
13. Devuelve un listado con todos los pagos que se realizaron en el
año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

~~~~mysql
SELECT fecha_pago, forma_pago
FROM pago
WHERE YEAR(fecha_pago) = '2008' AND forma_pago = 'PayPal';
~~~~
## Resultado:
<pre>
+------------+------------+
| fecha_pago | forma_pago |
+------------+------------+
| 2008-11-23 | PayPal     |
+------------+------------+
</pre>
14. Devuelve un listado con todas las formas de pago que aparecen en la
tabla pago. Tenga en cuenta que no deben aparecer formas de pago
repetidas.
~~~~mysql
SELECT DISTINCT forma_pago
FROM pago;
~~~~
## Resultado:
<pre>
+------------------------+
| forma_pago             |
+------------------------+
| Tarjeta de crédito     |
| Transferencia bancaria |
| Efectivo               |
| Cheque                 |
| PayPal                 |
| Tarjeta de débito      |
+------------------------+
</pre>
15. Devuelve un listado con todos los productos que pertenecen a la
gama Ornamentales y que tienen más de 100 unidades en stock. El listado
deberá estar ordenado por su precio de venta, mostrando en primer lugar
los de mayor precio.
~~~~mysql
SELECT G.gama AS Gama , P.cantidad_en_stock, P.precio_venta
FROM gama_producto as G
INNER JOIN producto as P 
ON G.gama = P.gama
WHERE P.cantidad_en_stock >= 100 AND G.gama = 'Ornamentales'
ORDER BY P.precio_venta;
~~~~
## Resultado:
<pre>
+--------------+-------------------+--------------+
| Gama         | cantidad_en_stock | precio_venta |
+--------------+-------------------+--------------+
| Ornamentales |               100 |        15.99 |
+--------------+-------------------+--------------+
</pre>
16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
cuyo representante de ventas tenga el código de empleado 11 o 30.
~~~~mysql
SELECT CL.nombre_cliente , C.nombre
FROM cliente as CL
INNER JOIN ciudad as C
ON CL.idCiudad = C.idCiudad
WHERE C.nombre = 'Madrid' AND CL.codigo_empleado_rep_ventas = 11;
~~~~
## Resultado:
<pre>
+------------------------+--------+
| nombre_cliente         | nombre |
+------------------------+--------+
| Blue Ocean Enterprises | Madrid |
+------------------------+--------+
</pre>
# Consultas multitabla (Composición interna) 
1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
representante de ventas.

~~~~mysql
SELECT  CONCAT(CL.nombre, ' ', COALESCE(CL.apellido1, ''),' ', COALESCE(CL.apellido1, '')) AS Nombre_empleado, C.nombre_cliente AS Cliente
FROM empleado AS CL
INNER JOIN cliente AS C
ON CL.codigo_empleado = C.codigo_empleado_rep_ventas
ORDER BY C.nombre_cliente;
~~~~
## Resultado:
<pre>
+---------------------------+----------------------------+
| Nombre_empleado           | Cliente                    |
+---------------------------+----------------------------+
| Miguel Flores Flores      | Blue Ocean Enterprises     |
| Sofia Reyes Reyes         | Creative Solutions         |
| Javier Ramirez Ramirez    | Dynamic Designs Co.        |
| Laura Gomez Gomez         | Evergreen Enterprises      |
| Pedro Sanchez Sanchez     | Fresh Foods Ltd.           |
| Carlos Martinez Martinez  | Global Solutions Inc.      |
| Diego Hernandez Hernandez | Golden Gate Imports        |
| Diego Hernandez Hernandez | Harbor Heights Hospitality |
| Elena Alvarez Alvarez     | Momentum Marketing         |
| Ana Lopez Lopez           | Mountain View Merchants    |
| Andres Ruiz Ruiz          | Pacific Partners Inc.      |
| Luisa Torres Torres       | Peak Performance Inc.      |
| Marta Fernandez Fernandez | Perro                      |
| Carmen Diaz Diaz          | Redwood Retailers          |
| Marta Fernandez Fernandez | Sapa                       |
| Julia Molina Molina       | Silver Screen Solutions    |
| Roberto Jimenez Jimenez   | Sunny Side Services        |
| Ana Rodriguez Rodriguez   | Sunset Resorts             |
| Oscar Gonzalez Gonzalez   | Tech Titanics              |
| Raul Santos Santos        | Urban Oasis                |
+---------------------------+----------------------------+
</pre>
2. Muestra el nombre de los clientes que hayan realizado pagos junto con el
nombre de sus representantes de ventas.
~~~~mysql
SELECT  
CONCAT(CL.nombre, ' ', COALESCE(CL.apellido1, ''),' ', COALESCE(CL.apellido1, '')) AS Nombre_empleado, 
IF(CLT.nombre_cliente IS NOT NULL, CLT.nombre_cliente, 'No tiene cliente') as pago_norealizado ,
IF(PA.total IS NOT NULL, PA.total, 'no realizo pago') as pago_norealizado  
FROM empleado AS CL
LEFT JOIN cliente AS CLT ON CL.codigo_empleado = CLT.codigo_empleado_rep_ventas
LEFT JOIN pago AS PA ON CLT.codigo_cliente = PA.codigo_cliente;
~~~~
## Resultado:
<pre>
+---------------------------+----------------------------+------------------+
| Nombre_empleado           | pago_norealizado           | pago_norealizado |
+---------------------------+----------------------------+------------------+
| Juan Perez Perez          | No tiene cliente           | no realizo pago  |
| Maria Garcia Garcia       | No tiene cliente           | no realizo pago  |
| Carlos Martinez Martinez  | Global Solutions Inc.      | 175.50           |
| Ana Rodriguez Rodriguez   | Sunset Resorts             | no realizo pago  |
| Pedro Sanchez Sanchez     | Fresh Foods Ltd.           | 250.00           |
| Laura Gomez Gomez         | Evergreen Enterprises      | 180.00           |
| Javier Ramirez Ramirez    | Dynamic Designs Co.        | 220.75           |
| Sofia Reyes Reyes         | Creative Solutions         | 175.00           |
| Diego Hernandez Hernandez | Golden Gate Imports        | 400.00           |
| Diego Hernandez Hernandez | Harbor Heights Hospitality | no realizo pago  |
| Luisa Torres Torres       | Peak Performance Inc.      | 350.00           |
| Miguel Flores Flores      | Blue Ocean Enterprises     | 275.00           |
| Carmen Diaz Diaz          | Redwood Retailers          | 300.00           |
| Roberto Jimenez Jimenez   | Sunny Side Services        | no realizo pago  |
| Elena Alvarez Alvarez     | Momentum Marketing         | no realizo pago  |
| Oscar Gonzalez Gonzalez   | Tech Titanics              | no realizo pago  |
| Julia Molina Molina       | Silver Screen Solutions    | no realizo pago  |
| Andres Ruiz Ruiz          | Pacific Partners Inc.      | no realizo pago  |
| Ana Lopez Lopez           | Mountain View Merchants    | no realizo pago  |
| Raul Santos Santos        | Urban Oasis                | no realizo pago  |
| Marta Fernandez Fernandez | Sapa                       | no realizo pago  |
| Marta Fernandez Fernandez | Perro                      | no realizo pago  |
+---------------------------+----------------------------+------------------+
</pre>
3. Muestra el nombre de los clientes que no hayan realizado pagos junto con
el nombre de sus representantes de ventas.
~~~~mysql
SELECT  
IF(CL.nombre IS NOT NULL, CL.nombre, 'No tiene cliente') asempleado,
IF(CLT.nombre_cliente IS NOT NULL, CLT.nombre_cliente, 'No tiene cliente') as nombre_cliente
FROM empleado AS CL
LEFT JOIN cliente AS CLT ON CL.codigo_empleado = CLT.codigo_empleado_rep_ventas
LEFT JOIN pago AS PA ON CLT.codigo_cliente = PA.codigo_cliente
WHERE PA.codigo_cliente is null;
~~~~
## Resultado:
<pre>
+------------+----------------------------+
| asempleado | nombre_cliente             |
+------------+----------------------------+
| Juan       | No tiene cliente           |
| Maria      | No tiene cliente           |
| Ana        | Sunset Resorts             |
| Diego      | Harbor Heights Hospitality |
| Roberto    | Sunny Side Services        |
| Elena      | Momentum Marketing         |
| Oscar      | Tech Titanics              |
| Julia      | Silver Screen Solutions    |
| Andres     | Pacific Partners Inc.      |
| Ana        | Mountain View Merchants    |
| Raul       | Urban Oasis                |
| Marta      | Sapa                       |
| Marta      | Perro                      |
+------------+----------------------------+
</pre>
4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
representantes junto con la ciudad de la oficina a la que pertenece el
representante.
~~~~mysql
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
~~~~
## Resultado:
<pre>
+------------------------+----------+----------------------+
| nombre_cliente         | empleado | Ciudad_Representante |
+------------------------+----------+----------------------+
| Global Solutions Inc.  | Carlos   | La Plata             |
| Fresh Foods Ltd.       | Pedro    | Córdoba              |
| Evergreen Enterprises  | Laura    | Córdoba              |
| Creative Solutions     | Sofia    | Villa Carlos Paz     |
| Golden Gate Imports    | Diego    | Mendoza              |
| Peak Performance Inc.  | Luisa    | Mendoza              |
| Blue Ocean Enterprises | Miguel   | San Rafael           |
| Redwood Retailers      | Carmen   | San Rafael           |
+------------------------+----------+----------------------+
</pre>
5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre
de sus representantes junto con la ciudad de la oficina a la que pertenece el
representante.
~~~~mysql
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
~~~~
## Resultado:
<pre>
+----------------------------+----------+----------------------+
| nombre_cliente             | empleado | Ciudad_Representante |
+----------------------------+----------+----------------------+
| Sunset Resorts             | Ana      | La Plata             |
| Harbor Heights Hospitality | Diego    | Mendoza              |
| Sunny Side Services        | Roberto  | Montevideo           |
| Momentum Marketing         | Elena    | Montevideo           |
| Tech Titanics              | Oscar    | Punta del Este       |
| Silver Screen Solutions    | Julia    | Punta del Este       |
| Pacific Partners Inc.      | Andres   | Asunción             |
| Mountain View Merchants    | Ana      | Asunción             |
| Urban Oasis                | Raul     | Encarnación          |
| Sapa                       | Marta    | Encarnación          |
| Perro                      | Marta    | Encarnación          |
+----------------------------+----------+----------------------+
</pre>
6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
~~~~mysql
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
~~~~
## Resultado:
<pre>
+--------+---------------+---------------------+------------------------+
| Ciudad | Codec_Oficina | Direccion           | Cliente                |
+--------+---------------+---------------------+------------------------+
| Madrid | MAD123        | Oficina 21, Calle U | Blue Ocean Enterprises |
| Madrid | MAD456        | Oficina 22, Calle V | Blue Ocean Enterprises |
+--------+---------------+---------------------+------------------------+
</pre>
7. Devuelve el nombre de los clientes y el nombre de sus representantes junto
con la ciudad de la oficina a la que pertenece el representante.
~~~~mysql
SELECT  CL.nombre_cliente AS Cliente,
        CONCAT(EM.nombre, ' ', COALESCE(EM.apellido1, ''),' ', COALESCE(EM.apellido2, '')) AS Representante,
        CIU.nombre AS Ciudad_Representante,
        OFI.codigo_Oficina AS Codec_Oficina_Representante
FROM cliente AS CL
INNER JOIN empleado AS EM ON CL.codigo_empleado_rep_ventas = EM.codigo_empleado
INNER JOIN oficina AS OFI ON EM.`codigo_Oficina` = OFI.`codigo_Oficina`
INNER JOIN ciudad AS CIU ON OFI.`idCiudad` = CIU.`idCiudad`;
~~~~
## Resultado:
<pre>
+----------------------------+---------------------------+----------------------+-----------------------------+
| Cliente                    | Representante             | Ciudad_Representante | Codec_Oficina_Representante |
+----------------------------+---------------------------+----------------------+-----------------------------+
| Global Solutions Inc.      | Carlos Martinez Hernandez | La Plata             | LP123                       |
| Sunset Resorts             | Ana Rodriguez Diaz        | La Plata             | LP123                       |
| Fresh Foods Ltd.           | Pedro Sanchez Lopez       | Córdoba              | CO123                       |
| Evergreen Enterprises      | Laura Gomez Fernandez     | Córdoba              | CO123                       |
| Creative Solutions         | Sofia Reyes Santos        | Villa Carlos Paz     | VCP123                      |
| Golden Gate Imports        | Diego Hernandez Gutierrez | Mendoza              | ME123                       |
| Harbor Heights Hospitality | Diego Hernandez Gutierrez | Mendoza              | ME123                       |
| Peak Performance Inc.      | Luisa Torres Martin       | Mendoza              | ME123                       |
| Blue Ocean Enterprises     | Miguel Flores Gomez       | San Rafael           | SR123                       |
| Redwood Retailers          | Carmen Diaz Ruiz          | San Rafael           | SR123                       |
| Sunny Side Services        | Roberto Jimenez Soto      | Montevideo           | MTV123                      |
| Momentum Marketing         | Elena Alvarez Lopez       | Montevideo           | MTV123                      |
| Tech Titanics              | Oscar Gonzalez Navarro    | Punta del Este       | PDE123                      |
| Silver Screen Solutions    | Julia Molina Gomez        | Punta del Este       | PDE123                      |
| Pacific Partners Inc.      | Andres Ruiz Fernandez     | Asunción             | ASU123                      |
| Mountain View Merchants    | Ana Lopez Perez           | Asunción             | ASU123                      |
| Urban Oasis                | Raul Santos Gonzalez      | Encarnación          | ENC123                      |
| Sapa                       | Marta Fernandez Rodriguez | Encarnación          | ENC123                      |
| Perro                      | Marta Fernandez Rodriguez | Encarnación          | ENC123                      |
+----------------------------+---------------------------+----------------------+-----------------------------+
</pre>
8. Devuelve un listado con el nombre de los empleados junto con el nombre
de sus jefes.
~~~~mysql
SELECT 
    CONCAT(EM.nombre, ' ', COALESCE(EM.apellido1, ''), ' ', COALESCE(EM.apellido2, '')) AS Representante,
    CONCAT(JF.nombre, ' ', COALESCE(JF.apellido1, ''), ' ', COALESCE(JF.apellido2, '')) AS Jefe
FROM empleado AS EM
INNER JOIN empleado AS JF ON EM.codigo_jefe = JF.codigo_empleado;
~~~~
## Resultado:
<pre>
+---------------------------+---------------------------+
| Representante             | Jefe                      |
+---------------------------+---------------------------+
| Maria Garcia Lopez        | Juan Perez Gonzalez       |
| Carlos Martinez Hernandez | Maria Garcia Lopez        |
| Ana Rodriguez Diaz        | Carlos Martinez Hernandez |
| Pedro Sanchez Lopez       | Ana Rodriguez Diaz        |
| Laura Gomez Fernandez     | Pedro Sanchez Lopez       |
| Javier Ramirez Perez      | Laura Gomez Fernandez     |
| Sofia Reyes Santos        | Javier Ramirez Perez      |
| Luisa Torres Martin       | Diego Hernandez Gutierrez |
| Carmen Diaz Ruiz          | Miguel Flores Gomez       |
| Elena Alvarez Lopez       | Roberto Jimenez Soto      |
| Julia Molina Gomez        | Oscar Gonzalez Navarro    |
| Ana Lopez Perez           | Andres Ruiz Fernandez     |
| Marta Fernandez Rodriguez | Raul Santos Gonzalez      |
+---------------------------+---------------------------+
</pre>
9. Devuelve un listado que muestre el nombre de cada empleados, el nombre
de su jefe y el nombre del jefe de sus jefe.
~~~~mysql
SELECT 
    CONCAT(EM.nombre, ' ', COALESCE(EM.apellido1, ''), ' ', COALESCE(EM.apellido2, '')) AS Empleado,
    CONCAT(JF.nombre, ' ', COALESCE(JF.apellido1, ''), ' ', COALESCE(JF.apellido2, '')) AS Jefe,
    CONCAT(JFF.nombre, ' ', COALESCE(JFF.apellido1, ''), ' ', COALESCE(JFF.apellido2, '')) AS Jefe_De_los_Jefes
FROM empleado AS EM
INNER JOIN empleado AS JF ON EM.codigo_jefe = JF.codigo_empleado
INNER JOIN empleado AS JFF ON JF.codigo_jefe = JFF.codigo_empleado;
~~~~
## Resultado:
<pre>
+---------------------------+---------------------------+---------------------------+
| Empleado                  | Jefe                      | Jefe_De_los_Jefes         |
+---------------------------+---------------------------+---------------------------+
| Carlos Martinez Hernandez | Maria Garcia Lopez        | Juan Perez Gonzalez       |
| Ana Rodriguez Diaz        | Carlos Martinez Hernandez | Maria Garcia Lopez        |
| Pedro Sanchez Lopez       | Ana Rodriguez Diaz        | Carlos Martinez Hernandez |
| Laura Gomez Fernandez     | Pedro Sanchez Lopez       | Ana Rodriguez Diaz        |
| Javier Ramirez Perez      | Laura Gomez Fernandez     | Pedro Sanchez Lopez       |
| Sofia Reyes Santos        | Javier Ramirez Perez      | Laura Gomez Fernandez     |
+---------------------------+---------------------------+---------------------------+
</pre>
10. Devuelve el nombre de los clientes a los que no se les ha entregado a
tiempo un pedido.

~~~~mysql
SELECT  CL.nombre_cliente AS Cliente,
        PE.fecha_entrega AS Fecha_Entrega_Mora
FROM cliente AS CL
INNER JOIN pedido AS PE ON CL.codigo_cliente = PE.codigo_cliente
WHERE PE.fecha_entrega > PE.fecha_esperada; 
~~~~
## Resultado:
<pre>
+------------------------+--------------------+
| Cliente                | Fecha_Entrega_Mora |
+------------------------+--------------------+
| Tech Titanics          | 2024-08-30         |
| Evergreen Enterprises  | 2024-06-01         |
| Blue Ocean Enterprises | 2024-06-07         |
+------------------------+--------------------+
</pre>
11. Devuelve un listado de las diferentes gamas de producto que ha comprado
cada cliente.
~~~~mysql
SELECT CL.nombre_cliente AS Cliente,
        GP.gama AS Gama
FROM gama_producto AS GP
INNER JOIN producto AS PR ON GP.gama = PR.gama
INNER JOIN detalle_pedido AS EP ON PR.codigo_producto = EP.codigo_producto
INNER JOIN pedido AS PD ON EP.codigo_pedido = PD.codigo_pedido
INNER JOIN cliente AS CL ON PD.codigo_cliente= CL.codigo_cliente;
~~~~
## Resultado:
<pre>
+------------------------+--------------+
| Cliente                | Gama         |
+------------------------+--------------+
| Creative Solutions     | Aromáticas   |
| Evergreen Enterprises  | Aromáticas   |
| Blue Ocean Enterprises | Aromáticas   |
| Dynamic Designs Co.    | Aromáticas   |
| Peak Performance Inc.  | Aromáticas   |
| Golden Gate Imports    | Aromáticas   |
| Fresh Foods Ltd.       | Aromáticas   |
| Tech Innovations LLC   | Frutales     |
| Evergreen Enterprises  | Frutales     |
| Blue Ocean Enterprises | Frutales     |
| Tech Innovations LLC   | Herbaceas    |
| Golden Gate Imports    | Herbaceas    |
| Acme Corporation       | Herbaceas    |
| Creative Solutions     | Herramientas |
| Redwood Retailers      | Herramientas |
| Blue Ocean Enterprises | Herramientas |
| Dynamic Designs Co.    | Herramientas |
| Peak Performance Inc.  | Herramientas |
| Golden Gate Imports    | Herramientas |
| Acme Corporation       | Herramientas |
| Creative Solutions     | Ornamentales |
| Redwood Retailers      | Ornamentales |
| Global Solutions Inc.  | Ornamentales |
| Dynamic Designs Co.    | Ornamentales |
| Tech Innovations LLC   | Ornamentales |
| Evergreen Enterprises  | Ornamentales |
| Acme Corporation       | Ornamentales |
| Redwood Retailers      | Ornamentales |
| Global Solutions Inc.  | Ornamentales |
| Fresh Foods Ltd.       | Ornamentales |
+------------------------+--------------+
</pre>
# Consultas multitabla (Composición externa)
1. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pago.
~~~~mysql
SELECT CL.nombre_cliente , CL.codigo_cliente
FROM cliente AS CL
LEFT JOIN pago AS PA 
ON CL.codigo_cliente = PA.codigo_cliente
WHERE PA.codigo_cliente IS NULL;

~~~~
## Resultado:
<pre>
+----------------------------+----------------+
| nombre_cliente             | codigo_cliente |
+----------------------------+----------------+
| Sunset Resorts             |              4 |
| Sunny Side Services        |             13 |
| Momentum Marketing         |             14 |
| Tech Titanics              |             15 |
| Silver Screen Solutions    |             16 |
| Pacific Partners Inc.      |             17 |
| Mountain View Merchants    |             18 |
| Urban Oasis                |             19 |
| Harbor Heights Hospitality |             20 |
| Sapa                       |             21 |
| Perro                      |             22 |
+----------------------------+----------------+
</pre>
2. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pedido.
~~~~mysql
SELECT CL.nombre_cliente , CL.codigo_cliente
FROM cliente AS CL
LEFT JOIN pedido AS PA 
ON CL.codigo_cliente = PA.codigo_cliente
WHERE PA.codigo_cliente IS NULL;
~~~~
## Resultado:
<pre>
+----------------------------+----------------+
| nombre_cliente             | codigo_cliente |
+----------------------------+----------------+
| Sunset Resorts             |              4 |
| Sunny Side Services        |             13 |
| Momentum Marketing         |             14 |
| Silver Screen Solutions    |             16 |
| Pacific Partners Inc.      |             17 |
| Mountain View Merchants    |             18 |
| Urban Oasis                |             19 |
| Harbor Heights Hospitality |             20 |
| Sapa                       |             21 |
| Perro                      |             22 |
+----------------------------+----------------+
</pre>
3. Devuelve un listado que muestre los clientes que no han realizado ningún
pago y los que no han realizado ningún pedido.
~~~~mysql
SELECT CL.nombre_cliente, CL.codigo_cliente
FROM cliente AS CL
LEFT JOIN pago AS PA ON CL.codigo_cliente = PA.codigo_cliente
LEFT JOIN pedido AS PE ON CL.codigo_cliente = PE.codigo_cliente
WHERE PA.codigo_cliente IS NULL AND PE.codigo_cliente IS NULL;
~~~~
## Resultado:
<pre>
+----------------------------+----------------+
| nombre_cliente             | codigo_cliente |
+----------------------------+----------------+
| Sunset Resorts             |              4 |
| Sunny Side Services        |             13 |
| Momentum Marketing         |             14 |
| Silver Screen Solutions    |             16 |
| Pacific Partners Inc.      |             17 |
| Mountain View Merchants    |             18 |
| Urban Oasis                |             19 |
| Harbor Heights Hospitality |             20 |
| Sapa                       |             21 |
| Perro                      |             22 |
+----------------------------+----------------+
</pre>
4. Devuelve un listado que muestre solamente los empleados que no tienen
una oficina asociada.
~~~~mysql
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
~~~~
## Resultado:
<pre>
+----------------------+-----------------+---------------------------+
| Empleado             | codigo_empleado | Asignacion_OFI            |
+----------------------+-----------------+---------------------------+
| Maria Garcia Lopez   |               2 | No tiene Oficina asignada |
| Javier Ramirez Perez |               7 | No tiene Oficina asignada |
+----------------------+-----------------+---------------------------+
</pre>
5. Devuelve un listado que muestre solamente los empleados que no tienen un
cliente asociado.
~~~~mysql
SELECT CONCAT(EM.nombre, ' ', COALESCE(EM.apellido1, ''), ' ', COALESCE(EM.apellido2, '')) AS Empleado,
    CASE 
        WHEN CL.codigo_empleado_rep_ventas IS NOT NULL THEN CL.codigo_empleado_rep_ventas
        ELSE 'No tiene Cliente asignado' 
    END AS Asignacion_CL
FROM empleado AS EM
LEFT JOIN cliente AS CL
ON CL.codigo_empleado_rep_ventas = EM.codigo_empleado
WHERE CL.codigo_empleado_rep_ventas IS NULL;
~~~~
## Resultado:
<pre>
+---------------------+---------------------------+
| Empleado            | Asignacion_CL             |
+---------------------+---------------------------+
| Juan Perez Gonzalez | No tiene Cliente asignado |
| Maria Garcia Lopez  | No tiene Cliente asignado |
+---------------------+---------------------------+
</pre>
6. Devuelve un listado que muestre solamente los empleados que no tienen un
cliente asociado junto con los datos de la oficina donde trabajan.
~~~~mysql
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
~~~~
## Resultado:
<pre>
+---------------------+---------------------------+-----------+--------------+
| Empleado            | Asignacion_CL             | CODEC_OFI | Ciudad       |
+---------------------+---------------------------+-----------+--------------+
| Juan Perez Gonzalez | No tiene Cliente asignado | BA123     | Buenos Aires |
+---------------------+---------------------------+-----------+--------------+
</pre>
7. Devuelve un listado que muestre los empleados que no tienen una oficina
asociada y los que no tienen un cliente asociado.
~~~~mysql
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
~~~~
## Resultado:
<pre>
+--------------------+---------------------------+------------------+
| Empleado           | Asignacion_CL             | OFI_Asignada     |
+--------------------+---------------------------+------------------+
| Maria Garcia Lopez | No tiene Cliente asignado | No tiene Oficina |
+--------------------+---------------------------+------------------+
</pre>
8. Devuelve un listado de los productos que nunca han aparecido en un
pedido.
~~~~mysql
SELECT  PR.nombre AS Nombre_Producto,
        PR.codigo_producto AS CODEC
FROM producto AS PR
LEFT JOIN detalle_pedido AS DP ON PR.codigo_producto = DP.codigo_producto
WHERE DP.codigo_producto IS NULL;
~~~~
## Resultado:
<pre>
+-----------------+-------+
| Nombre_Producto | CODEC |
+-----------------+-------+
| Naranjo         |     9 |
+-----------------+-------+
</pre>
9. Devuelve un listado de los productos que nunca han aparecido en un
pedido. El resultado debe mostrar el nombre, la descripción y la imagen del
producto.
~~~~mysql
SELECT  PR.nombre AS Nombre_Producto,
        PR.codigo_producto AS CODEC,
        PR.descripcion AS DESC_Producto
FROM producto AS PR
LEFT JOIN detalle_pedido AS DP ON PR.codigo_producto = DP.codigo_producto
WHERE DP.codigo_producto IS NULL;
~~~~
## Resultado:
<pre>
+-----------------+-------+--------------------------+
| Nombre_Producto | CODEC | DESC_Producto            |
+-----------------+-------+--------------------------+
| Naranjo         |     9 | Árbol frutal de naranja  |
+-----------------+-------+--------------------------+
</pre>
10. Devuelve las oficinas donde no trabajan ninguno de los empleados que
hayan sido los representantes de ventas de algún cliente que haya realizado
la compra de algún producto de la gama Frutales.
~~~~mysql
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
~~~~
## Resultado:
<pre>
+---------------------+---------------------------+-----------+--------------+
| Empleado            | Asignacion_CL             | CODEC_OFI | Ciudad       |
+---------------------+---------------------------+-----------+--------------+
| Juan Perez Gonzalez | No tiene Cliente asignado | BA123     | Buenos Aires |
+---------------------+---------------------------+-----------+--------------+
</pre>
11. Devuelve un listado con los clientes que han realizado algún pedido pero no
han realizado ningún pago.
~~~~mysql
SELECT CL.nombre_cliente, CL.codigo_cliente
FROM cliente AS CL
LEFT JOIN pago AS PA ON CL.codigo_cliente = PA.codigo_cliente
INNER JOIN pedido AS PE ON CL.codigo_cliente = PE.codigo_cliente
WHERE PA.codigo_cliente IS NULL;
~~~~
## Resultado:
<pre>
+----------------+----------------+
| nombre_cliente | codigo_cliente |
+----------------+----------------+
| Tech Titanics  |             15 |
+----------------+----------------+
</pre>
12. Devuelve un listado con los datos de los empleados que no tienen clientes
asociados y el nombre de su jefe asociado.
~~~~mysql
SELECT 
    CONCAT(EM.nombre, ' ', COALESCE(EM.apellido1, ''), ' ', COALESCE(EM.apellido2, '')) AS Empleado,
    CONCAT(JF.nombre, ' ', COALESCE(JF.apellido1, ''), ' ', COALESCE(JF.apellido2, '')) AS Jefe
FROM empleado AS EM
LEFT JOIN cliente AS CL ON EM.codigo_empleado = CL.codigo_empleado_rep_ventas
INNER JOIN empleado AS JF ON EM.codigo_jefe = JF.codigo_empleado
WHERE CL.codigo_empleado_rep_ventas IS NULL;
~~~~
## Resultado:
<pre>
+--------------------+---------------------+
| Empleado           | Jefe                |
+--------------------+---------------------+
| Maria Garcia Lopez | Juan Perez Gonzalez |
+--------------------+---------------------+
</pre>

# Consultas resumen

1. ¿Cuántos empleados hay en la compañía?
~~~~mysql
SELECT COUNT(*) AS Total_Registro_Empleado
FROM empleado;
~~~~
## Resultado:
<pre>
+-------------------------+
| Total_Registro_Empleado |
+-------------------------+
|                      20 |
+-------------------------+
</pre>
2. ¿Cuántos clientes tiene cada país?
~~~~mysql
SELECT COUNT(CIU.idCiudad) AS Cliente_Pais, PA.nombrePais AS Pais
FROM pais AS PA
INNER JOIN region AS RE ON PA.idPais = RE.idPais
INNER JOIN ciudad AS CIU ON RE.idRegion = CIU.`idRegion`
INNER JOIN cliente AS CL ON CIU.idCiudad = CL.idCiudad
GROUP BY Pais;
~~~~
## Resultado:
<pre>
+--------------+----------------+
| Cliente_Pais | Pais           |
+--------------+----------------+
|            6 | Argentina      |
|            2 | Uruguay        |
|            2 | Paraguay       |
|            2 | España         |
|            2 | Francia        |
|            3 | Italia         |
|            5 | Estados Unidos |
+--------------+----------------+
</pre>
3. ¿Cuál fue el pago medio en 2009?

~~~~mysql
SELECT FORMAT(AVG(total), 1) AS Media_2009
FROM pago
WHERE YEAR(fecha_pago) = '2009';
~~~~
## Resultado:
<pre>
+------------+
| Media_2009 |
+------------+
| 325.0      |
+------------+
</pre>
4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma
descendente por el número de pedidos.
~~~~mysql
SELECT  COUNT(ES.idEstadoPedido) AS Cant_EstadoXPedido , ES.`estadoNombrePedido` AS EstadoXPedido
from estadopedido AS ES
INNER JOIN pedido AS PE ON ES.`idEstadoPedido`= PE.`idEstadoPedido`
GROUP BY EstadoXPedido;
~~~~
## Resultado:
<pre>
+--------------------+------------------------------+
| Cant_EstadoXPedido | EstadoXPedido                |
+--------------------+------------------------------+
|                  3 | Pendiente                    |
|                  1 | Rechazado                    |
|                  1 | En espera de pago            |
|                  1 | Enviado                      |
|                  1 | Entregado                    |
|                  1 | Cancelado por falta de stock |
|                  1 | En revisión                  |
|                  1 | Reembolsado                  |
|                  1 | Devuelto                     |
|                  2 | Rechazado por exceso de pago |
+--------------------+------------------------------+
</pre>
5. Calcula el precio de venta del producto más caro y más barato en una
misma consulta.
~~~~mysql
SELECT 
    (SELECT nombre FROM producto WHERE precio_venta = (SELECT MAX(precio_venta) FROM producto)) AS ProMax,
    MAX(precio_venta) AS Max_Precio,
    (SELECT nombre FROM producto WHERE precio_venta = (SELECT MIN(precio_venta) FROM producto)) AS ProMin,
    MIN(precio_venta) AS Min_Precio
FROM 
    producto;
~~~~
## Resultado:
<pre>
+---------+------------+--------+------------+
| ProMax  | Max_Precio | ProMin | Min_Precio |
+---------+------------+--------+------------+
| Naranjo |      50.99 | Menta  |       8.99 |
+---------+------------+--------+------------+
</pre>
6. Calcula el número de clientes que tiene la empresa.
~~~~mysql
SELECT COUNT(*) AS Numero_Clientes
FROM cliente;
~~~~
## Resultado:
<pre>
+-----------------+
| Numero_Clientes |
+-----------------+
|              22 |
+-----------------+
</pre>
7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
~~~~mysql
SELECT COUNT(DC.idCliente) AS Cliente
FROM ciudad AS CI
INNER JOIN cliente AS CL ON CI.idCiudad = CL.idCiudad
INNER JOIN direccioncliente AS DC ON CL.codigo_cliente = DC.idCliente
WHERE CI.nombre = 'Madrid';
~~~~
## Resultado:
<pre>
+---------+
| Cliente |
+---------+
|       1 |
+---------+
</pre>
8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan
por M?
~~~~mysql
SELECT COUNT(CI.codigo_cliente) AS Cliente , CL.nombre as CiudadX_M
FROM cliente AS CI
INNER JOIN ciudad AS CL ON CI.idCiudad = CL.idCiudad
WHERE  CL.nombre LIKE 'M%'
GROUP BY CiudadX_M;
~~~~
## Resultado:
<pre>
+---------+------------+
| Cliente | CiudadX_M  |
+---------+------------+
|       1 | Mendoza    |
|       1 | Montevideo |
|       1 | Madrid     |
|       1 | Marsella   |
|       1 | Milán      |
+---------+------------+
</pre>
9. Devuelve el nombre de los representantes de ventas y el número de clientes
al que atiende cada uno.
~~~~mysql
SELECT 
    CONCAT(EM.nombre, ' ', COALESCE(EM.apellido1, ''), ' ', COALESCE(EM.apellido2, '')) AS Empleado, COUNT(CL.codigo_empleado_rep_ventas) AS CLientes_X_empleado
    FROM empleado AS EM
INNER JOIN cliente AS CL ON EM.codigo_empleado = CL.codigo_empleado_rep_ventas
GROUP BY Empleado;
~~~~
## Resultado:
<pre>
+---------------------------+---------------------+
| Empleado                  | CLientes_X_empleado |
+---------------------------+---------------------+
| Carlos Martinez Hernandez |                   1 |
| Ana Rodriguez Diaz        |                   1 |
| Pedro Sanchez Lopez       |                   1 |
| Laura Gomez Fernandez     |                   1 |
| Javier Ramirez Perez      |                   1 |
| Sofia Reyes Santos        |                   1 |
| Diego Hernandez Gutierrez |                   2 |
| Luisa Torres Martin       |                   1 |
| Miguel Flores Gomez       |                   1 |
| Carmen Diaz Ruiz          |                   1 |
| Roberto Jimenez Soto      |                   1 |
| Elena Alvarez Lopez       |                   1 |
| Oscar Gonzalez Navarro    |                   1 |
| Julia Molina Gomez        |                   1 |
| Andres Ruiz Fernandez     |                   1 |
| Ana Lopez Perez           |                   1 |
| Raul Santos Gonzalez      |                   1 |
| Marta Fernandez Rodriguez |                   2 |
+---------------------------+---------------------+
</pre>
10. Calcula el número de clientes que no tiene asignado representante de
ventas.
~~~~mysql
SELECT 
    COUNT(EM.codigo_empleado) AS CLientes_X_empleado
    FROM empleado AS EM
LEFT JOIN cliente AS CL ON EM.codigo_empleado = CL.codigo_empleado_rep_ventas
WHERE CL.codigo_empleado_rep_ventas IS NULL;
~~~~
## Resultado:
<pre>
+---------------------+
| CLientes_X_empleado |
+---------------------+
|                   2 |
+---------------------+
</pre>
11. Calcula la fecha del primer y último pago realizado por cada uno de los
clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
~~~~mysql
SELECT  MAX(PR.fecha_pago) AS Fecha_MAX, 
        MIN(PR.fecha_pago) AS Fecha_MIN,
        CL.nombre_cliente AS Cliente
FROM pago AS PR
LEFT JOIN cliente AS CL ON PR.codigo_cliente = CL.codigo_cliente
GROUP BY Cliente;
~~~~
## Resultado:
<pre>
+------------+------------+------------------------+
| Fecha_MAX  | Fecha_MIN  | Cliente                |
+------------+------------+------------------------+
| 2023-05-29 | 2023-05-29 | Acme Corporation       |
| 2022-07-29 | 2022-07-29 | Tech Innovations LLC   |
| 2021-01-15 | 2021-01-15 | Global Solutions Inc.  |
| 2013-09-01 | 2013-09-01 | Redwood Retailers      |
| 2009-07-19 | 2009-07-19 | Fresh Foods Ltd.       |
| 2017-10-04 | 2017-10-04 | Evergreen Enterprises  |
| 2002-09-15 | 2002-09-15 | Dynamic Designs Co.    |
| 1988-05-13 | 1988-05-13 | Creative Solutions     |
| 2009-05-15 | 2009-05-15 | Golden Gate Imports    |
| 2008-05-15 | 2008-05-15 | Peak Performance Inc.  |
| 2008-11-23 | 2008-11-23 | Blue Ocean Enterprises |
+------------+------------+------------------------+
</pre>
12. Calcula el número de productos diferentes que hay en cada uno de los
pedidos.

~~~~mysql
SELECT 
    P.codigo_pedido,
    COUNT(DISTINCT DP.codigo_producto) AS numero_productos
FROM 
    pedido AS P
INNER JOIN 
    detalle_pedido AS DP ON P.codigo_pedido = DP.codigo_pedido
GROUP BY 
    P.codigo_pedido;
~~~~
## Resultado:
<pre>
+---------------+------------------+
| codigo_pedido | numero_productos |
+---------------+------------------+
|         12335 |                3 |
|         12343 |                3 |
|         12945 |                2 |
|         16347 |                3 |
|         18346 |                3 |
|         45612 |                3 |
|         45616 |                2 |
|         45912 |                3 |
|         48612 |                3 |
|         49612 |                2 |
|         95618 |                3 |
+---------------+------------------+
</pre>
13. Calcula la suma de la cantidad total de todos los productos que aparecen en
cada uno de los pedidos.
~~~~mysql
SELECT 
    P.codigo_pedido,
    SUM(DP.cantidad) AS cantidad_total
FROM 
    pedido AS P
INNER JOIN 
    detalle_pedido AS DP ON P.codigo_pedido = DP.codigo_pedido
GROUP BY 
    P.codigo_pedido;
~~~~
## Resultado:
<pre>
+---------------+----------------+
| codigo_pedido | cantidad_total |
+---------------+----------------+
|         12335 |             17 |
|         12343 |             11 |
|         12945 |             10 |
|         16347 |             35 |
|         18346 |             19 |
|         45612 |             16 |
|         45616 |             14 |
|         45912 |             17 |
|         48612 |             28 |
|         49612 |              8 |
|         95618 |             19 |
+---------------+----------------+
</pre>
14. Devuelve un listado de los 20 productos más vendidos y el número total de
unidades que se han vendido de cada uno. El listado deberá estar ordenado
por el número total de unidades vendidas.
~~~~mysql
SELECT 
    DP.codigo_producto,
    P.nombre,
    SUM(DP.cantidad) AS total_unidades_vendidas
FROM 
    detalle_pedido AS DP
INNER JOIN 
    producto AS P ON DP.codigo_producto = P.codigo_producto
GROUP BY 
    DP.codigo_producto, P.nombre
ORDER BY 
    total_unidades_vendidas DESC
LIMIT 20;
~~~~
## Resultado:
<pre>
+-----------------+-----------------+-------------------------+
| codigo_producto | nombre          | total_unidades_vendidas |
+-----------------+-----------------+-------------------------+
|               1 | Herbacea Verde  |                      36 |
|               4 | Manzano         |                      27 |
|              10 | Tulipán         |                      24 |
|               6 | Herbacea Azul   |                      22 |
|               2 | Pala Multiuso   |                      21 |
|               3 | Menta           |                      19 |
|               5 | Rosa            |                      17 |
|               8 | Lavanda         |                      16 |
|               7 | Tijeras de Poda |                      12 |
+-----------------+-----------------+-------------------------+
</pre>
15. La facturación que ha tenido la empresa en toda la historia, indicando la
base imponible, el IVA y el total facturado. La base imponible se calcula
sumando el coste del producto por el número de unidades vendidas de la
tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la
suma de los dos campos anteriores.
~~~~mysql
SELECT 
    SUM(cantidad * `precioUnidad`) AS base_imponible,
    SUM(cantidad * `precioUnidad`) * 0.21 AS IVA,
    SUM(cantidad * `precioUnidad`) * 1.21 AS total_facturado
    

FROM 
    detalle_pedido;
~~~~
## Resultado:
<pre>
+----------------+----------+-----------------+
| base_imponible | IVA      | total_facturado |
+----------------+----------+-----------------+
|        4415.88 | 927.3348 |       5343.2148 |
+----------------+----------+-----------------+
</pre>
/*
16. La misma información que en la pregunta anterior, pero agrupada por
código de producto.
*/
~~~~mysql
SELECT 
    SUM(cantidad * `precioUnidad`) AS base_imponible,
    SUM(cantidad * `precioUnidad`) * 0.21 AS IVA,
    SUM(cantidad * `precioUnidad`) * 1.21 AS total_facturado,
    codigo_producto AS Produc_Codec
FROM 
    detalle_pedido
GROUP BY Produc_Codec;
~~~~
## Resultado:
<pre>
+----------------+----------+-----------------+--------------+
| base_imponible | IVA      | total_facturado | Produc_Codec |
+----------------+----------+-----------------+--------------+
|         650.78 | 136.6638 |        787.4438 |            1 |
|         395.18 |  82.9878 |        478.1678 |            2 |
|         441.33 |  92.6793 |        534.0093 |            3 |
|         636.34 | 133.6314 |        769.9714 |            4 |
|         517.97 | 108.7737 |        626.7437 |            5 |
|         755.78 | 158.7138 |        914.4938 |            6 |
|         302.90 |  63.6090 |        366.5090 |            7 |
|         396.84 |  83.3364 |        480.1764 |            8 |
|         318.76 |  66.9396 |        385.6996 |           10 |
+----------------+----------+-----------------+--------------+
</pre>
18. Lista las ventas totales de los productos que hayan facturado más de 300
euros. Se mostrará el nombre, unidades vendidas, total facturado y total
facturado con impuestos (21% IVA).
~~~~mysql
SELECT SUM(DP.precioUnidad * DP.cantidad) AS FacturadoX_producto,
        SUM(DP.precioUnidad * DP.cantidad) * 0.21 AS FacturadoX_producto_IVA,
        PR.nombre,
        DP.cantidad AS Unidade_Vendidas
FROM detalle_pedido AS DP
INNER JOIN producto AS PR ON DP.codigo_producto = PR.codigo_producto
GROUP BY PR.nombre, Unidade_Vendidas
HAVING SUM(DP.precioUnidad * DP.cantidad) > 300;
~~~~
## Resultado:
<pre>
+---------------------+-------------------------+---------------+------------------+
| FacturadoX_producto | FacturadoX_producto_IVA | nombre        | Unidade_Vendidas |
+---------------------+-------------------------+---------------+------------------+
|              324.50 |                 68.1450 | Rosa          |               11 |
|              415.87 |                 87.3327 | Herbacea Azul |               13 |
|              305.28 |                 64.1088 | Lavanda       |                6 |
+---------------------+-------------------------+---------------+------------------+
</pre>
19. Muestre la suma total de todos los pagos que se realizaron para cada uno
de los años que aparecen en la tabla pagos.
~~~~mysql
SELECT 
    YEAR(fecha_pago) AS año,
    SUM(total) AS total_pagado
FROM 
    pago
GROUP BY 
    YEAR(fecha_pago);
~~~~
## Resultado:
<pre>
+------+--------------+
| año  | total_pagado |
+------+--------------+
| 2023 |       150.00 |
| 2022 |       200.00 |
| 2021 |       175.50 |
| 2013 |       300.00 |
| 2009 |       650.00 |
| 2017 |       180.00 |
| 2002 |       220.75 |
| 1988 |       175.00 |
| 2008 |       625.00 |
+------+--------------+
</pre>