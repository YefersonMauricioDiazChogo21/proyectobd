# Examen final base de datos

### Consultas sobre una tabla

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

   ```sql
   SELECT codigo_oficina, ciudad 
   FROM oficina;
   ```
  
2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

   ```sql
   SELECT ciudad, telefono
   FROM oficina
   WHERE pais = "España";
   ```

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
    jefe tiene un código de jefe igual a 7.

    ```sql
    SELECT nombre, apellido1, apellido2, email
    FROM empleado
    WHERE codigo_jefe =7;
    ```

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
    empresa.

    ```sql
    SELECT puesto, nombre, apellido1, apellido2, email
    FROM empleado 
    WHERE puesto= "Jefe de la empresa";
    ```

5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
    empleados que no sean representantes de ventas.

    ```sql
    SELECT nombre, apellido1, apellido2,puesto
    FROM empleado
    WHERE puesto != "Representante de ventas";
    ```

6. Devuelve un listado con el nombre de los todos los clientes españoles.

   ```sql
   SELECT nombre_cliente 
   FROM cliente
   WHERE pais = "España";
   ```

7. Devuelve un listado con los distintos estados por los que puede pasar un
    pedido.

    ```sql
    SELECT DISTINCT estado
    FROM pedido;
    ```

8. Devuelve un listado con el código de cliente de aquellos clientes que
    realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
    aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
    • Utilizando la función YEAR de MySQL.
    • Utilizando la función DATE_FORMAT de MySQL.
    • Sin utilizar ninguna de las funciones anteriores.

    ```sql
    SELECT DISTINCT codigo_cliente, 
    FROM pedido
    WHERE 
    
    revisar
    ```

9. Devuelve un listado con el código de pedido, código de cliente, fecha
    esperada y fecha de entrega de los pedidos que no han sido entregados a
    tiempo.

    ```sql
    SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
    FROM pedido
    WHERE fecha_entrega>fecha_esperada;
    
    revisar
    ```

10. Devuelve un listado con el código de pedido, código de cliente, fecha
    esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
    menos dos días antes de la fecha esperada.
    • Utilizando la función ADDDATE de MySQL.
    • Utilizando la función DATEDIFF de MySQL.
    • ¿Sería posible resolver esta consulta utilizando el operador de suma + o
    resta -?

    ```sql
    SELECT 
    
    revisar
    ```

    

11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

    ```sql
    SELECT codigo_pedido, estado
    FROM pedido
    WHERE estado="Rechazado" AND ;
    
    revisar
    ```

12. Devuelve un listado de todos los pedidos que han sido entregados en el
    mes de enero de cualquier año.

    ```SQL
    SELECT codigo_pedido, estado
    FROM pedido
    WHERE estado ="Entregado" AND fecha_entrega=;
    
    revisar
    ```

13. Devuelve un listado con todos los pagos que se realizaron en el
    año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

    ```sql
    SELECT codigo_cliente, forma_pago, fecha_pago, total
    FROM pago
    WHERE forma_pago="Paypal" AND fecha_pago=
    ORDER BY total DESC;
    
    revisar
    ```

14. Devuelve un listado con todas las formas de pago que aparecen en la
    tabla pago. Tenga en cuenta que no deben aparecer formas de pago
    repetidas.

    ```sql
    SELECT DISTINCT forma_pago
    FROM pago;
    ```

15. Devuelve un listado con todos los productos que pertenecen a la
    gama Ornamentales y que tienen más de 100 unidades en stock. El listado
    deberá estar ordenado por su precio de venta, mostrando en primer lugar
    los de mayor precio.

    ```sql
    SELECT codigo_producto, nombre, cantidad_en_stock, precio_venta
    FROM producto
    WHERE cantidad_en_stock>=100
    ORDER BY precio_venta DESC;
    ```

16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
    cuyo representante de ventas tenga el código de empleado 11 o 30.

    ```sql
    SELECT codigo_cliente, ciudad, codigo_empleado_rep_ventas AS "Cod Rep. Ventas"
    FROM cliente
    WHERE ciudad="Madrid" AND( codigo_empleado_rep_ventas IN (11,30));
    ```

    

### Consultas multitabla (Composición interna)

**Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con**
**sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.**

1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
    representante de ventas.

    ```SQL
    SELECT c.nombre_cliente, e.nombre AS "Rep Ventas", e.apellido1 AS "Apellido Rep"
    FROM cliente c
    INNER JOIN empleado e ON c.codigo_empleado_rep_ventas= e.codigo_empleado;
    ```
    
2. Muestra el nombre de los clientes que hayan realizado pagos junto con el
    nombre de sus representantes de ventas.

    ```SQL
    SELECT c.nombre, e.nombre AS "Rep Ventas", p.fecha_pago
    FROM cliente c
    INNER JOIN empleado e ON c.codigo_empleado_rep_ventas= e.codigo_empleado
    INNER JOIN pago p ON c.codigo_cliente = p.codigo_cliente;
    
    revisar
    ```


3. Muestra el nombre de los clientes que no hayan realizado pagos junto con
    el nombre de sus representantes de ventas.

    ```SQL
    SELECT c.nombre, e.nombre AS "Representante Ventas"
    FROM cliente c
    INNER JOIN empleado e ON c.codigo_empleado_rep_ventas= e.codigo_empleado
    INNER JOIN pago p ON c.codigo_cliente = p.codigo_cliente;
    
    revisar
    ```


4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
    representantes junto con la ciudad de la oficina a la que pertenece el
    representante.

    ```SQL
    SELECT c.nombre, e.nombre AS "Representante Ventas", p.fecha_pago, o.ciudad AS "Ciudad oficina"
    FROM cliente c
    INNER JOIN empleado e ON c.codigo_empleado_rep_ventas= e.codigo_empleado
    INNER JOIN pago p ON c.codigo_cliente = p.codigo_cliente
    INNER JOIN oficina o  ON e.codigo_oficina =o.codigo_oficina;
    
    revisar con la 2
    ```


5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre
    de sus representantes junto con la ciudad de la oficina a la que pertenece el
    representante.

    ```SQL
    SELECT c.nombre, e.nombre AS "Representante Ventas", p.fecha_pago, o.ciudad AS "Ciudad oficina"
    FROM cliente c
    INNER JOIN empleado e ON c.codigo_empleado_rep_ventas= e.codigo_empleado
    INNER JOIN pago p ON c.codigo_cliente = p.codigo_cliente
    INNER JOIN oficina o  ON e.codigo_oficina =o.codigo_oficina;
    
    revisar con la 3
    ```


6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

    ```SQL
    SELECT o.linea_direccion1, o.linea_direccion2, c.region AS "Region cliente"
    FROM oficina o
    INNER JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
    INNER JOIN cliente c ON c.codigo_empleado_rep_ventas = e.codigo_empleado
    WHERE c.region ="Fuenlabrada";
    ```


7. Devuelve el nombre de los clientes y el nombre de sus representantes junto
    con la ciudad de la oficina a la que pertenece el representante.

    ```SQL
    SELECT c.nombre, e.nombre AS "Representante Ventas", o.ciudad AS "Ciudad oficina"
    FROM cliente c
    INNER JOIN empleado e ON c.codigo_empleado_rep_ventas= e.codigo_empleado
    INNER JOIN oficina o  ON e.codigo_oficina =o.codigo_oficina;
    ```


8. Devuelve un listado con el nombre de los empleados junto con el nombre
     de sus jefes.

     ```SQL
     SELECT e.nombre, j.nombre AS "Nombre jefe"
     FROM empleado e
     INNER JOIN empleado j ON j.codigo_empoleado=e.codigo_jefe;
     ```

9. Devuelve un listado que muestre el nombre de cada empleados, el nombre
     de su jefe y el nombre del jefe de sus jefe.

     ```SQL
     SELECT e.nombre, j.nombre AS "Nombre jefe", jj.nombre AS "Nombre del jefe del jefe"
     FROM empleado e
     INNER JOIN empleado j ON j.codigo_empleado=e.codigo_jefe
     INNER JOIN empleado jj ON jj.codigo_empleado=j.codigo_jefe;
     ```

10. Devuelve el nombre de los clientes a los que no se les ha entregado a
     tiempo un pedido.

     ```SQL
     SELECT DISTINCT c.nombre_cliente 
     FROM cliente c
     INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
     WHERE p.fecha_esperada>=p.fecha_entrega;
     ```

11. Devuelve un listado de las diferentes gamas de producto que ha comprado
      cada cliente.

      ```sql
      SELECT GROUP_CONCAT(g.gama ORDER BY g.gama SEPARATOR ", "), c.cliente 
      FROM gama g 
      RIGHT JOIN cliente c
      GROUP BY c.cliente;
      ```

      #### **Consultas multitabla (Composición externa)**

      **Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL**
      **LEFT JOIN y NATURAL RIGHT JOIN.**

12. Devuelve un listado que muestre solamente los clientes que no han
         realizado ningún pago.

      ```SQL
      SELECT DISTINCT c.nombre, p.fecha_pago
      FROM cliente c
      LEFT JOIN pago p
      WHERE p.fecha_pago!=Null;
      ```

13. Devuelve un listado que muestre solamente los clientes que no han
         realizado ningún pedido.

      ```SQL
      SELECT DISTINCT c.nombre, p.fecha_pedido
      FROM cliente c
      LEFT JOIN pedido p WHERE p.fecha_pedido!=Null;
      ```
    
14. Devuelve un listado que muestre los clientes que no han realizado ningún
         pago y los que no han realizado ningún pedido.

      ```SQL
      SELECT DISTINCT c.nombre, pe.fecha_pedido , p.fecha_pago
      FROM cliente c
      LEFT JOIN pedido pe WHERE pe.fecha_pedido!=Null; AND pago p WHERE p.fecha_pago!=Null;
      ```
    
15. Devuelve un listado que muestre solamente los empleados que no tienen
         una oficina asociada.

      ```SQL
      
      ```

16. Devuelve un listado que muestre solamente los empleados que no tienen un
         cliente asociado.

      ```SQL
      
      ```

17. Devuelve un listado que muestre solamente los empleados que no tienen un
         cliente asociado junto con los datos de la oficina donde trabajan.

      ```SQL
      
      ```

18. Devuelve un listado que muestre los empleados que no tienen una oficina
         asociada y los que no tienen un cliente asociado.

      ```SQL
      
      ```

19. Devuelve un listado de los productos que nunca han aparecido en un
         pedido.

      ```SQL
      
      ```

20. Devuelve un listado de los productos que nunca han aparecido en un
         pedido. El resultado debe mostrar el nombre, la descripción y la imagen del
         producto.

      ```SQL
      
      ```

21. Devuelve las oficinas donde no trabajan ninguno de los empleados que
      hayan sido los representantes de ventas de algún cliente que haya realizado
      la compra de algún producto de la gama Frutales.

      ```SQL
      
      ```

22. Devuelve un listado con los clientes que han realizado algún pedido pero no
      han realizado ningún pago.

      ```SQL
      
      ```

23. Devuelve un listado con los datos de los empleados que no tienen clientes
      asociados y el nombre de su jefe asociado.
      Consultas resumen

      ```SQL
      
      ```

24. ¿Cuántos empleados hay en la compañía?

      ```SQL
      
      ```

25. ¿Cuántos clientes tiene cada país?

      ```SQL
      
      ```

26. ¿Cuál fue el pago medio en 2009?

      ```SQL
      
      ```

27. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma
         descendente por el número de pedidos.

  ```SQL
  
  ```

28. Calcula el precio de venta del producto más caro y más barato en una
      misma consulta.

    ```SQL
    
    ```

29. Calcula el número de clientes que tiene la empresa.

    ```SQL
    
    ```

30. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

    ```SQL
    
    ```

31. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan
      por M?

    ```SQL
    
    ```

32. Devuelve el nombre de los representantes de ventas y el número de clientes
      al que atiende cada uno.

    ```SQL
    
    ```

33. Calcula el número de clientes que no tiene asignado representante de
    ventas.

    ```SQL
    
    ```

34. Calcula la fecha del primer y último pago realizado por cada uno de los
    clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

    ```SQL
    
    ```

35. Calcula el número de productos diferentes que hay en cada uno de los
    pedidos.

    ```SQL
    
    ```

36. Calcula la suma de la cantidad total de todos los productos que aparecen en
    cada uno de los pedidos.

    ```SQL
    
    ```

37. Devuelve un listado de los 20 productos más vendidos y el número total de
    unidades que se han vendido de cada uno. El listado deberá estar ordenado
    por el número total de unidades vendidas.

    ```SQL
    
    ```

38. La facturación que ha tenido la empresa en toda la historia, indicando la
    base imponible, el IVA y el total facturado. La base imponible se calcula
    sumando el coste del producto por el número de unidades vendidas de la
    tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la
    suma de los dos campos anteriores.

    ```SQL
    
    ```

39. La misma información que en la pregunta anterior, pero agrupada por
    código de producto.

    ```SQL
    
    ```

40. La misma información que en la pregunta anterior, pero agrupada por
    código de producto filtrada por los códigos que empiecen por OR.

    ```SQL
    
    ```

41. Lista las ventas totales de los productos que hayan facturado más de 3000
    euros. Se mostrará el nombre, unidades vendidas, total facturado y total
    facturado con impuestos (21% IVA).

    ```SQL
    
    ```

42. Muestre la suma total de todos los pagos que se realizaron para cada uno
    de los años que aparecen en la tabla pagos.

    ```SQL
    
    ```

### Consultas variadas

1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos
    pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no
    han realizado ningún pedido.

    ```SQL
    
    ```

2. Devuelve un listado con los nombres de los clientes y el total pagado por
    cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han
    realizado ningún pago.

    ```SQL
    
    ```

3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008
    ordenados alfabéticamente de menor a mayor.

    ```SQL
    
    ```

4. Devuelve el nombre del cliente, el nombre y primer apellido de su
representante de ventas y el número de teléfono de la oficina del
representante de ventas, de aquellos clientes que no hayan realizado ningún
pago.

    ```SQL
    
    ```

5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el
nombre y primer apellido de su representante de ventas y la ciudad donde
está su oficina.

    ```SQL
    
    ```

6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
empleados que no sean representante de ventas de ningún cliente.

    ```SQL
    
    ```

7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el
   número de empleados que tiene.

    ```SQL
    SELECT
    ```