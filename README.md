# DBGardenGomez
## Base de datos: Jardinería

## Consulta SQL

```sql
SELECT C.nombre AS Nombre_Oficina, O.codigo_Oficina
FROM ciudad AS C
INNER JOIN Oficina AS O
ON C.idCiudad = O.idCiudad;
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
