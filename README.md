# DBGardenGomez
Base de datos, Jardineria
~~~~ mysql
SELECT C.nombre AS Nombre_Oficina, O.codigo_Oficina
FROM ciudad AS C
INNER JOIN Oficina AS O
ON C.idCiudad = O.idCiudad;
~~~~
