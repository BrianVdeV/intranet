drop database if exists cultivos;
create database cultivos;
use cultivos;

create table productos(
id_producto int auto_increment primary key,
nomprod varchar(20),
cantidad int,
destino varchar(25),
fecha varchar(25));



create table empleados(
id_empleado int auto_increment primary key,
nombre varchar(20),
apellido varchar(50),
correo varchar(50) not null,
contra varchar(25) not null);


create table clientes(
id_cliente varchar(10) primary key,
nombre varchar(20),
apellido varchar(50),
direccion varchar(100),
telefono int,
correo varchar(50)
);

create table pedidos(
id_pedido varchar(10) primary key,
id_cliente varchar(10),
fechaped date,
estado varchar(20),
foreign key (id_cliente) references clientes (id_cliente)
);

create table factura(
id_factura varchar(10) primary key,
id_pedido varchar(10),
fechfac date,
total int,
foreign key (id_pedido) references pedidos(id_pedido)
);

create table pagos(
id_pago varchar(10) primary key,
id_factura varchar(10) references factura,
fechpago date,
monto int,
metpago varchar(25),
foreign key (id_factura) references factura(id_factura)
);

create table detalle_pedidos(
id_det_ped varchar(10) primary key,
id_empleado int,
id_pedido varchar(10),
id_producto int,
cantidad int(11),
precuni int(11),
foreign key (id_empleado) references empleados(id_empleado),
foreign key (id_pedido) references pedidos(id_pedido),
foreign key (id_producto) references productos(id_producto));



-- Procedimientos almacenados

DELIMITER //

CREATE PROCEDURE InsertarEmpleado(
    IN p_nombre VARCHAR(20),
    IN p_apellidos VARCHAR(50),
    IN p_correo VARCHAR(50),
    IN p_contra VARCHAR(25)
)
BEGIN
    INSERT INTO empleados (nombre, apellido, correo, contra)
    VALUES (p_nombre, p_apellidos, p_correo, p_contra);
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertarProducto(
  IN p_nomprod varchar(20),
  IN p_cantidad int,
  IN p_destino varchar(25),
  IN p_fecha varchar(25)
)
BEGIN
  INSERT INTO productos (nomprod, cantidad, destino, fecha)
  VALUES (p_nomprod, p_cantidad, p_destino, p_fecha);
END //
DELIMITER ;

CALL InsertarEmpleado('Cosme', 'Fulanito', 'correo@ejemplo.com', 'contraseña123');
CALL InsertarEmpleado('Jorge', 'Velez de Villa', 'jorgebrianvdv@gmail.com', 'jorge');
CALL InsertarProducto('Producto A', 100, 'Destino A', '2023-07-21');

