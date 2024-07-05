INSERT INTO gama_producto (gama, descripcion_texto, descripcion_html, imagen) VALUES 
('Alta', 'Productos de alta calidad', 'Productos de alta calidad', 'img1'),
('Frutal', 'Productos de calidad frutal', 'Productos de calidad frutal', 'img2'),
('Ornamental', 'Productos de calidad Ornamental', 'Productos de calidad Ornamental', 'img3'),
('Premium', 'Productos premium', 'Productos premium', 'img4'),
('Económico', 'Productos económicos', 'Productos económicos', 'img5'),
('Lujo', 'Productos de lujo', 'Productos de lujo', 'img6');

INSERT INTO oficina (codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2) VALUES
('OF01', 'Madrid', 'España', 'Madrid', '28001', '6352021', 'Calle Mayor 1', 'Piso 2'),
('OF02', 'Barcelona', 'España', 'Cataluña', '08001', '6355050', 'Calle Gran Via 2', 'Piso 3'),
('OF03', 'Valencia', 'España', 'Valencia', '46001', '9612345', 'Calle Colon 3', 'casa 18'),
('OF04', 'Sevilla', 'España', 'Andalucía', '31001', '6254135', 'Calle Sierpes 4', 'Piso 1'),
('OF05', 'Bilbao', 'España', 'País Vasco', '48001', '944123456', 'Gran Vía 5', 'casa 11'),
('OF06', 'Bucaramanga', 'Colombia', 'Conucos', '60001', '976123456', 'Calle Alfonso 6', 'piso 8'),
('OF07', 'madrid', 'España', 'Fuenlabrada', '46002', '9612340', 'Calle Colon 7', 'casa 20');

INSERT INTO empleado (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto) VALUES
(1, 'Mauricio', 'Pérez', 'García', '101', 'Mauricio.perez@emp.com', 'OF01', 2, 'Gerente'),
(2, 'Ana', 'Martínez', 'López', '102', 'ana.martinez@emp.com', 'OF02', NULL, 'Jefe de la empresa'),
(3, 'Luis', 'González', 'Fernández', '103', 'luis.gonzalez@emp.com', 'OF03', 7, 'Representante de ventas'),
(4, 'María', 'Rodríguez', 'Sánchez', '104', 'maria.rodriguez@emp.com', NULL, 2, 'Administrativo'),
(5, 'Carlos', 'López', 'Martínez', '105', 'carlos.lopez@emp.com', 'OF05', 3, 'Representante de ventas'),
(6, 'Laura', 'García', 'Pérez', '106', 'Laura.garcia@emp.com', 'OF06', 4, 'Contable'),
(7, 'Carlos', 'López', 'Martínez', '105', 'carlos.lopez@emp.com', 'OF05', 3, 'Representante de ventas'),
(11, 'Valentina', 'García', 'Pérez', '106', 'Laura.garcia@emp.com', 'OF06', 4, 'Contable'),
(30, 'Luis', 'García', 'Pérez', '106', 'Mario.garcia@emp.com', 'OF07', 1, 'Jefe ventas');

INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito) VALUES
(1, 'Empresa A', 'Carlos', 'Sánchez', '915678910', '915678911', 'Calle Ejemplo 1', 'Piso 1', 'Madrid', 'Madrid', 'España', '28001', 11, 20000),
(2, 'Empresa B', 'Ana', 'García', '935678912', '935678913', 'Calle Ejemplo 2', '', 'Barcelona', 'Cataluña', 'España', '08001', 30, 70000),
(3, 'Empresa C', 'Luis', 'Martínez', '965678914', '965678915', 'Calle Ejemplo 3', 'Piso 3', 'Valencia', 'Valencia', 'España', '46001', 3, 30000),
(4, 'Empresa D', 'María', 'López', '955678916', '955678917', 'Calle Ejemplo 4', 'Piso 4', 'Sevilla', 'Andalucía', 'España', '41001', 4, 20000),
(5, 'Empresa E', 'Mauricio', 'González', '945678918', '945678919', 'Calle Ejemplo 5', 'Piso 5', 'Bilbao', 'País Vasco', 'España', '48001', 5, 10000),
(6, 'Empresa F', 'Laura', 'Rodríguez', '975678920', '975678921', 'Calle Ejemplo 6', 'Piso 6', 'Bucaramanga', 'Conucos', 'Colombia', '60001', 6, 70000);

INSERT INTO producto (codigo_producto, nombre, gama, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES
('P001', 'Producto 1', 'Alta', '10x10x10', 'Proveedor 1', 'Descripción del producto 1', 100, 50.00, 25.00),
('P002', 'Producto 2', 'Frutal', '20x20x20', 'Proveedor 2', 'Descripción del producto 2', 200, 80.00, 30.00),
('P003', 'Producto 3', 'Ornamental', '30x30x30', 'Proveedor 3', 'Descripción del producto 3', 300, 30.00, 20.00),
('P004', 'Producto 4', 'Premium', '40x40x40', 'Proveedor 4', 'Descripción del producto 4', 400, 40.00, 35.00),
('P005', 'Producto 5', 'Ornamental', '50x50x50', 'Proveedor 5', 'Descripción del producto 5', 500, 20.00, 15.00),
('P006', 'Producto 6', 'Lujo', '60x60x60', 'Proveedor 6', 'Descripción del producto 6', 600, 70.00, 70.00);

INSERT INTO pedido (codigo_pedido, fecha_pedido, fecha_esparada, fecha_entrega, estado, comentarios, codigo_cliente) VALUES
(1, '2009-01-01', '2009-01-05', '2009-01-02', 'Rechazado', 'Sin comentarios', 1),
(2, '2024-01-01', '2024-01-05', '2024-01-02', 'Entregado', 'Sin comentarios', 2),
(3, '2024-03-01', '2024-03-05', '2024-03-02', 'Cancelado', 'Sin comentarios', 3),
(4, '2024-04-01', '2024-04-05', '2024-04-02', 'Pendiente', 'Sin comentarios', 4),
(5, '2009-05-01', '2009-05-05', '2009-05-02', 'Rechazado', 'Sin comentarios', 5),
(6, '2024-06-01', '2024-06-05', '2024-06-02', 'Pendiente', 'Sin comentarios', 6);

INSERT INTO detalle_pedido (codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea) VALUES
(1, 'P001', 10, 50.00, 1),
(2, 'P002', 20, 40.00, 1),
(3, 'P003', 30, 30.00, 1),
(4, 'P004', 40, 60.00, 1),
(5, 'P005', 50, 20.00, 1),
(6, 'P006', 60, 70.00, 1);

INSERT INTO pago (codigo_cliente, forma_pago, id_transaccion, fecha_pago, total) VALUES
(1, 'Tarjeta de Crédito', '2024-01-01', '2024-01-06', 500.00),
(2, 'Paypal', '2008-02-01', '2008-02-06', 800.00),
(3, 'Transferencia Bancaria', '2024-03-01', '2024-03-06', 600.00),
(4, 'Efectivo', '2024-04-01', '2024-04-06', 400.00),
(5, 'Tarjeta de Crédito', '2024-05-01', '2024-05-06', 1000.00),
(6, 'Paypal', '2008-06-01', '2008-06-06', 300.00);


