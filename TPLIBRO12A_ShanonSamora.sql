/* 
NO HACER EL C

Shanon Samora 1º2ºA BE
------------------------------------------------------------------------------------
A – Básicas

1. Indicar cuáles son los títulos y autores de los libros cuyo tipo sea ‘no’ y sus precios
originales superen los $21. 

SELECT TITULO,AUTOR
FROM LIBRO
WHERE
TIPO = 'no' AND PRECIO_ORI > 21

2. ¿Cuáles son los números, precios originales y ediciones de los libros cuyo tipo sea ‘no’
o que sus precios originales superen $21 y las ediciones sean posteriores a 1985?

SELECT NRO_LIBRO,PRECIO_ORI,EDICION
FROM LIBRO
WHERE
TIPO = 'no' OR PRECIO_ORI > 21 AND EDICION > 1985

3. Obtener la lista autores y ediciones de los libros cuyos nombres de autores comiencen
con la letra L

SELECT *
FROM LIBRO
WHERE AUTOR LIKE 'L%'

4. Obtener la lista de autores y ediciones de los libros cuyos nombres de autores no
comiencen con la letra G. 

SELECT *
FROM LIBRO
WHERE AUTOR NOT LIKE 'G%'

5. Obtener la lista de autores, precios originales y ediciones de los libros cuyos autores
tengan la hilera "RR" en algún lugar del nombre

SELECT * FROM LIBRO
WHERE AUTOR LIKE '%RR%'

6. Obtener la lista de títulos y ediciones de aquellos libros cuyos precios originales no
estén comprendidos entre $12 y $25.

SELECT TITULO, EDICION, PRECIO_ORI FROM LIBRO
WHERE PRECIO_ORI > 25 OR PRECIO_ORI < 12

7. Obtener todos los tipos y ediciones DISTINTAS(en tipo y Edición) de los libros,
ordenado por Edición y año de edición ascendente.

SELECT TITULO, TIPO, EDICION FROM LIBRO
ORDER BY EDICION

8. Listar los números, ediciones, tipos, precios originales, precios actuales y diferencias
de precios para todos los libros clasificado por tipo y por dicha diferencia en forma
ascendente, en ese orden.

SELECT NRO_LIBRO, EDICION, TIPO, PRECIO_ORI, PRECIO_ACT, (PRECIO_ACT - PRECIO_ORI) AS DIFF
FROM LIBRO
ORDER BY (PRECIO_ACT - PRECIO_ORI) ASC

9. Listar los números, ediciones, tipos, precios originales, precios actuales y diferencias
de precios para todos los libros de estudio.

SELECT NRO_LIBRO, EDICION, TIPO, PRECIO_ORI, PRECIO_ACT, (PRECIO_ACT - PRECIO_ORI) AS DIFF
FROM LIBRO
WHERE TIPO = 'es'

10. ¿Cuáles son los números, precios originales y ediciones de los libros cuyas ediciones
son posteriores a 1985 y además o bien el tipo es ‘no’ o el precio original supera $21?

SELECT TITULO,NRO_LIBRO,PRECIO_ORI,EDICION,TIPO FROM LIBRO
WHERE EDICION > 1985 AND (TIPO = 'no' OR PRECIO_ORI > 21)

11. ¿Cuáles son los títulos y nombres de los autores de los libros cuyo tipo sea ‘no’ o
aquellos cuyos precios de origen superan $21?

SELECT TITULO,AUTOR,PRECIO_ORI FROM LIBRO
WHERE TIPO = 'no' OR PRECIO_ORI > 21

12. Obtener la lista de títulos y precios originales de los libros que se editaron en 1948,
1978 y 1985

SELECT TITULO,PRECIO_ORI FROM LIBRO
WHERE EDICION = 1948 OR EDICION = 1978 OR EDICION = 1985

13. Obtener los títulos y ediciones de los libros cuyos precios originales estén dentro del
rango de $12 a $25 inclusive

SELECT TITULO,EDICION,PRECIO_ORI FROM LIBRO
WHERE PRECIO_ORI BETWEEN 12 AND 25

14. Obtener la lista de títulos, precios originales y ediciones de aquellos libros cuyos títulos
tengan las letras "R" y "S" en algún lugar y en ese orden.

SELECT TITULO,PRECIO_ORI,EDICION FROM LIBRO
WHERE TITULO LIKE '%R%' AND TITULO LIKE '%S%'

15. Obtener la lista de títulos, precios originales y ediciones de aquellos libros que tengan
la letra "A" en la segunda posición del título.

SELECT TITULO,PRECIO_ORI,EDICION FROM LIBRO
WHERE TITULO LIKE '% A%'

16. Ordenar en secuencia ascendente por año de edición los títulos de los libros cuyo tipo
sea ‘no’. Listar también la edición.

SELECT TITULO,EDICION FROM LIBRO
WHERE TIPO = 'no'
ORDER BY EDICION ASC

17. Listar los números, ediciones y tipos de libros cuyos precios originales superen los $20.
Clasificar por edición en forma descendente y por número de libro ascendente en ese
orden.

SELECT NRO_LIBRO,EDICION,TIPO,PRECIO_ORI FROM LIBRO
WHERE PRECIO_ORI > 20
ORDER BY EDICION DESC, NRO_LIBRO ASC

18. Listar los números, ediciones, tipos, precios originales, precios actuales y diferencias
de precios para todos los libros cuyas diferencias de precio sean superiores a $10.

SELECT NRO_LIBRO,EDICION,TIPO,PRECIO_ORI, PRECIO_ACT, (PRECIO_ACT - PRECIO_ORI) AS DIFF
FROM LIBRO
WHERE (PRECIO_ACT - PRECIO_ORI) > 10

19. Listar los números, ediciones, tipos, precios originales, precios actuales y diferencias
de precios para todos los libros cuyas diferencias de precio sean superiores a $10,
clasificado por dicha diferencia en forma descendente. 

SELECT NRO_LIBRO,EDICION,TIPO,PRECIO_ORI,PRECIO_ACT, (PRECIO_ACT - PRECIO_ORI) AS DIFF
FROM LIBRO
WHERE (PRECIO_ACT - PRECIO_ORI) > 10
ORDER BY (PRECIO_ACT - PRECIO_ORI) DESC

------------------------------------------------------------------------------------
B - Funciones de Agregación, Having

1. Obtener la suma y el promedio de los precios originales y el mínimo y el máximo de los
precios actuales para todos los libros cuyo año de edición sea mayor a 1970

SELECT
sum(precio_ori) as suma_PreciosOri,
avg(precio_ori) as promedio_PreciosOri,
min(precio_act) as min_PrecioAct,
max(precio_act) as max_PrecioAct
FROM LIBRO
WHERE EDICION > 1970

2. Obtener de la suma total de la suma de los precios originales más los actuales, el
promedio de dicha suma y el mínimo y el máximo de las diferencias de precios para
todos los libros cuyo año de edición sea superior a 1970.

SELECT
sum(precio_ori+precio_act) as sumaTotal,
avg(precio_ori+precio_act) as promTotal,
min(precio_ori+precio_act) as difMin,
max(precio_ori+precio_act) as difMax
FROM LIBRO
WHERE EDICION > 1970

3. Listar la cantidad de libros, los distintos tipos de libros, el mínimo y el máximo del
precio original, pero sólo para aquellos libros cuyo precio original supere los $45. 

SELECT tipo, COUNT(*) as cantidad,
min(precio_ori) as precioMin,
max(precio_ori) as precioMax
FROM LIBRO
WHERE PRECIO_ORI > 45
GROUP BY TIPO
HAVING COUNT(*) > 0

4. Listar los tipos de libros, totales de precios originales, promedios de precios actuales,
resumidos por tipo de libro y para los libros cuyas ediciones no sean de 1946, pero sólo
para aquellos tipos de libros cuya sumatoria de precios originales supere $40.

SELECT TIPO,
sum(precio_ori) as total_PrecioOri,
avg(precio_act) as promedio_PrecioAct
FROM LIBRO
WHERE EDICION NOT LIKE 1946
GROUP BY TIPO
HAVING sum(precio_ori) > 40

5. Listar los tipos de libros y promedios de precios originales agrupados por tipos, para
aquellos tipos que tengan el promedio de sus precios originales por arriba del
promedio de precios originales de todos los libros.

SELECT L.TIPO, AVG(L.PRECIO_ORI) as promedio_PreciosOri
FROM LIBRO L
GROUP BY L.TIPO 
HAVING (AVG(L.PRECIO_ORI) > (SELECT AVG(PRECIO_ORI) FROM LIBRO))

6. Listar los tipos de libros, totales de precios originales y promedios de precios actuales,
de aquellos libros que fueron editados entre 1946 y 1975, resumidos por tipo de libro.

SELECT TIPO,
SUM(PRECIO_ORI) as total_PrecioOri,
AVG(PRECIO_ACT) as promedio_PrecioAct
FROM LIBRO
WHERE EDICION BETWEEN 1946 AND 1975
GROUP BY TIPO

7. Listar los tipos de libros, totales de precios originales y promedios de precios actuales,
de aquellos libros que no fueron editados en 1946, resumidos por tipo de libro
clasificado por promedio de precios actuales de menor a mayor.

SELECT L.TIPO,
SUM(L.PRECIO_ORI) as total_PrecioOri,
AVG(L.PRECIO_ACT) as prom_PrecioAct
FROM LIBRO L
GROUP BY L.TIPO
ORDER BY AVG(L.PRECIO_ACT) ASC

8. Listar los tipos de libros, totales de precios originales y promedios de precios actuales,
de aquellos libros que fueron editados entre 1946 y 1975, resumidos por tipo de libro.

SELECT TIPO,
SUM(PRECIO_ORI) as total_PrecioOri,
AVG(PRECIO_ACT) as promedio_PrecioAct
FROM LIBRO
WHERE EDICION BETWEEN 1946 AND 1975
GROUP BY TIPO

9. Listar el salario máximo agrupado por el tipo de trabajo.

SELECT TRABAJO,
MAX(SALARIO) as salarioMax
FROM LECTOR
GROUP BY TRABAJO

10. Listar el salario promedio agrupado por tipo de trabajo de los lectores que viven en
capital.

SELECT TRABAJO,
AVG(SALARIO) salarioProm
FROM LECTOR
WHERE DIRECCION LIKE '%cap%'
GROUP BY TRABAJO

------------------------------------------------------------------------------------
D - Consultas en varias tablas – uso de join (inner join – left join – right join)

1. Listar el Titulo, fecha de Préstamo y la fecha de Devolución de los Libros prestados

SELECT libro.TITULO, PRESTAMO.F_PREST, prestamo.F_DEVOL
FROM LIBRO
inner join PRESTAMO on PRESTAMO.NRO_LIBRO = libro.NRO_LIBRO

2. Listar el Nro de Libro, Titulo, fecha de Préstamo y la fecha de Devolución de los Libros
prestados

SELECT libro.NRO_LIBRO, libro.TITULO, prestamo.F_PREST, prestamo.F_DEVOL
FROM LIBRO
inner join PRESTAMO on PRESTAMO.NRO_LIBRO = libro.NRO_LIBRO

3. Listar el número de lector, su nombre y la cantidad de préstamos realizados a ese
lector.

SELECT LECTOR.NRO_LECTOR, lector.NOMBRE, COUNT(prestamo.F_PREST) as cantPrestamos
FROM LECTOR
left join PRESTAMO on PRESTAMO.NRO_LECTOR = LECTOR.NRO_LECTOR
GROUP BY LECTOR.NRO_LECTOR, lector.NOMBRE
HAVING COUNT(prestamo.F_PREST) > -1

4. Listar el número de libro, el título, el número de copia, y la cantidad de préstamos
realizados para cada copia de cada libro.

SELECT libro.NRO_LIBRO, libro.TITULO, copias.NRO_COPIA, COUNT(prestamo.F_PREST) as cantPrestamos
from LIBRO
inner join COPIAS on COPIAS.NRO_LIBRO = LIBRO.NRO_LIBRO
inner join PRESTAMO on PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO
GROUP BY libro.NRO_LIBRO, libro.TITULO, copias.NRO_COPIA
HAVING COUNT(prestamo.F_PREST) > -1

5. Listar el número de libro, el título, y la cantidad de préstamos realizados para ese libro
a partir del año 2012

SELECT libro.NRO_LIBRO, libro.TITULO, COUNT(prestamo.F_PREST) as cantPrestamos
FROM LIBRO
inner join PRESTAMO on PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO
WHERE prestamo.F_PREST > 2012
GROUP BY libro.NRO_LIBRO, libro.TITULO
HAVING COUNT(prestamo.F_PREST) > -1

6. Listar el número de libro, el título, el número de copia, y la cantidad de préstamos
realizados para cada copia de cada libro, pero sólo para aquellas copias que se hayan
prestado más de 1 vez.

SELECT L.NRO_LIBRO, L.TITULO, P.NRO_COPIA, count(*) as cantidad
FROM LIBRO L
INNER JOIN PRESTAMO P ON P.NRO_LIBRO = L.NRO_LIBRO
GROUP BY L.NRO_LIBRO, L.TITULO, P.NRO_COPIA
HAVING COUNT(*) > 1

7. Listar el Nro de Libro, Titulo, nro de Copia y Fecha de Préstamo, de todas las Copias,
hayan sido prestadas o no.

SELECT LIBRO.NRO_LIBRO, LIBRO.TITULO, COPIAS.NRO_COPIA, PRESTAMO.F_PREST
FROM PRESTAMO
left join COPIAS on PRESTAMO.NRO_COPIA = COPIAS.NRO_COPIA
left join LIBRO on LIBRO.NRO_LIBRO = COPIAS.NRO_LIBRO
ORDER BY LIBRO.TITULO

SELECT LIBRO.NRO_LIBRO, LIBRO.TITULO, COPIAS.NRO_COPIA, PRESTAMO.F_PREST
FROM COPIAS
right join PRESTAMO on PRESTAMO.NRO_COPIA = COPIAS.NRO_COPIA
right join LIBRO on LIBRO.NRO_LIBRO = COPIAS.NRO_LIBRO
ORDER BY LIBRO.TITULO

8. Listar Nro de Lector, Nombre, nro de Libro, Titulo, Descripción del Tipo de Libro , fecha
de préstamo que aquellos Prestamos que hayan sido devueltos y el tipo de Libro sea
Novela o Cuentos.

SELECT LECTOR.NRO_LECTOR, LECTOR.NOMBRE, LIBRO.NRO_LIBRO, LIBRO.TITULO, PRESTAMO.F_PREST, PRESTAMO.F_DEVOL,
LIBRO.TIPO, TIPOLIBRO.DESCTIPO
FROM PRESTAMO
inner join LECTOR on LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR
inner join LIBRO on LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO
inner join TIPOLIBRO on TIPOLIBRO.TIPO = LIBRO.TIPO
WHERE F_DEVOL IS NOT NULL AND ((TIPOLIBRO.DESCTIPO like 'Novela') OR (TIPOLIBRO.DESCTIPO like 'Cuentos'))
ORDER BY TIPOLIBRO.DESCTIPO

9. Obtener la lista de los títulos de los libros prestados y los nombres de los lectores que
los tienen en préstamo

SELECT LIBRO.TITULO, PRESTAMO.F_PREST, PRESTAMO.F_DEVOL, LECTOR.NOMBRE
FROM PRESTAMO
inner join LIBRO on PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO
inner join LECTOR on LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR

10. Listar el Nro de Lector, Nombre y fecha de Préstamo de aquellos Lectores que hayan
realizado un préstamo y no lo hayan devuelto

SELECT LECTOR.NRO_LECTOR, LECTOR.NOMBRE, PRESTAMO.F_PREST, PRESTAMO.F_DEVOL
FROM LECTOR
inner join PRESTAMO on PRESTAMO.NRO_LECTOR = LECTOR.NRO_LECTOR
WHERE F_DEVOL IS NULL

11. Listar Nro de Lector, Nombre, nro de Libro, Titulo, fecha de préstamo de aquellos
Prestamos que hayan sido devueltos.

SELECT LECTOR.NRO_LECTOR, LECTOR.NOMBRE, LIBRO.NRO_LIBRO, LIBRO.TITULO, PRESTAMO.F_PREST, PRESTAMO.F_DEVOL
FROM PRESTAMO
left join LECTOR on LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR
left join LIBRO on LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO
WHERE F_DEVOL IS NOT NULL

12. Listar Nro de Lector, Nombre, nro de Libro, Titulo, fecha de préstamo de aquellos
Prestamos que hayan sido devueltos y el tipo de Libro sea Novela o Cuentos.

SELECT LECTOR.NRO_LECTOR, LECTOR.NOMBRE, LIBRO.NRO_LIBRO, LIBRO.TITULO, PRESTAMO.F_PREST, PRESTAMO.F_DEVOL, LIBRO.TIPO
FROM PRESTAMO
inner join LECTOR on LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR
inner join LIBRO on LIBRO.NRO_LIBRO = PRESTAMO.NRO_LIBRO
WHERE PRESTAMO.F_DEVOL IS NOT NULL AND ((LIBRO.TIPO LIKE 'no') OR (LIBRO.TIPO LIKE 'cu'))

13. Listar el Nro de Lector, Nombre y fecha de Préstamo de Todos los Lectores, hayan
tenido Prestamos o no.

SELECT LECTOR.NRO_LECTOR, LECTOR.NOMBRE, PRESTAMO.F_PREST
FROM LECTOR
left join PRESTAMO on PRESTAMO.NRO_LECTOR = LECTOR.NRO_LECTOR

------------------------------------------------------------------------------------
E – Insert – Update - Delete
1. Agregar un nuevo LIBRO y sus respectivos valores a la tabla COPIAS.

/*INSERT INTO LIBRO
VALUES ('123459','Life 3.0','Max Tegmark','fi','69.20','76.30','2017',null)*/

INSERT INTO COPIAS
VALUES ('123459','5',null)

2. Modificar el precio Actual del Libro LAS MIL Y UNA NOCHES a 35.35

UPDATE LIBRO
SET PRECIO_ACT = '35.35'
WHERE TITULO = 'LAS MIL Y UNA NOCHES'

3. Eliminar los lectores cuyo salario sea menor $ 1000. ¿Cuántos lectores se han
eliminado?

DELETE FROM LECTOR
WHERE SALARIO < 1000
-- SE ELIMINARON 4 LECTORES --

------------------------------------------------------------------------------------
F – PLUS
1. Realizar una sentencia SQL que involucre TODOS los campos de TODAS las tablas
¿Es esto posible?

SELECT *
FROM LECTOR 
inner join PRESTAMO ON (LECTOR.NRO_LECTOR = PRESTAMO.NRO_LECTOR)
inner join LIBRO ON (PRESTAMO.NRO_LIBRO = LIBRO.NRO_LIBRO)
inner join TIPOLIBRO ON (LIBRO.TIPO = TIPOLIBRO.TIPO)
inner join COPIAS ON (LIBRO.NRO_LIBRO = COPIAS.NRO_LIBRO)

*/