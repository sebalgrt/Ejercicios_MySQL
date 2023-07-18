/*1. Lista el nombre de todos los productos que hay en la tabla producto.*/
select nombre from producto;
/*2. Lista los nombres y los precios de todos los productos de la tabla producto.*/
select nombre, precio from producto;
/*3. Lista todas las columnas de la tabla producto.*/
select * from producto;
/*4. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio. */
select nombre, round(precio) from producto;
/*5. Lista el código de los fabricantes que tienen productos en la tabla producto. */
select codigo_fabricante from producto group by codigo;
/*6. Lista el código de los fabricantes que tienen productos en la tabla producto, sin mostrar los repetidos.*/
select codigo_fabricante from producto group by codigo_fabricante;
/*7. Lista los nombres de los fabricantes ordenados de forma ascendente.*/
select nombre from fabricante order by nombre asc;
/*8. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por
el precio de forma descendente.*/
insert into producto (codigo, nombre, precio, codigo_fabricante) values (24, 'Disco SSD 1 TB', 140, 8); /*Inserté esta línea para comprobar el ordenamientode precios*/
select nombre, precio from producto order by nombre asc, precio desc;
/*9. Devuelve una lista con las 5 primeras filas de la tabla fabricante.*/
select * from fabricante limit 5;
/*10. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)*/
select nombre, precio from producto order by precio asc limit 1;
/*11. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT) */
select nombre, precio from producto order by precio desc limit 1;
/*12. Lista el nombre de los productos que tienen un precio menor o igual a $120.*/
select nombre from producto where precio <= 120;
/*13. Lista todos los productos que tengan un precio entre $60 y $200. Utilizando el operador BETWEEN. */
select * from producto where precio between 60 and 200;
/*14. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.*/
select * from producto where codigo_fabricante in (1, 3, 5); 
/*15. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre. */
select nombre from producto where nombre like '%Portatil%';

/*Consultas Multitabla  
1. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante,
de todos los productos de la base de datos.*/
select producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre from producto
inner join fabricante on producto.codigo_fabricante = fabricante.codigo;
/*2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
Ordene el resultado por el nombre del fabricante, por orden alfabético.*/
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante 
on producto.codigo_fabricante = fabricante.codigo order by fabricante.nombre asc;
/*3. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.*/
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante
on producto.codigo_fabricante = fabricante.codigo order by producto.precio asc limit 1;
/*4. Devuelve una lista de todos los productos del fabricante Lenovo.*/
select producto.nombre, fabricante.nombre from producto inner join fabricante 
on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Lenovo';
/*5. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que $200.*/
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante
on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre = 'Crucial' and producto.precio > 200;
/*6. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard. Utilizando el operador IN.*/
select producto.nombre, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo
where fabricante.nombre in ('Asus', 'Hewlett-Packard');
/*7. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio
mayor o igual a $180. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre
(en orden ascendente)*/
 select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante
 on producto.codigo_fabricante = fabricante.codigo where producto.precio >= 180 order by producto.precio desc, producto.nombre asc;
 