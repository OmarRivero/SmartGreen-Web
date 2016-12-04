drop database if exists bd_smartgreen;
create database bd_smartgreen;

use bd_smartgreen;

#CREATE USER 'smartgreen'@'localhost' IDENTIFIED BY 'n0m3l0'; # Comentar despues de crear el usuario por primera vez

#GRANT ALL ON bd_Linebackers.* TO 'smartgreen'@'localhost' IDENTIFIED BY 'n0m3l0'; # Lo mismo de arriba 


create table usuarios(
idUsuario int(4) auto_increment primary key,
tipoUsuario int(2),
nombre varchar(200),
correo varchar(200),
contrasena varchar(200));

create table productos(
idProducto int (10) auto_increment primary key, 
nombre nvarchar(50),
precio float (15,5),
cantidad int (20),
descripcion nvarchar (300),
rutaImagen nvarchar(100));

insert into productos (idProducto, nombre, precio, cantidad, descripcion, rutaImagen) values (null, 'Invernadero Tropical', 2999, 3,'Te hará sentir como en el amazonas', 'tropical.jpg');
insert into productos (idProducto, nombre, precio, cantidad, descripcion, rutaImagen) values (null, 'Invernadero de Interiores', 3999, 3, 'Pensado para que lo puedas tener dentro de tu casa', 'interior.jpg');
insert into productos (idProducto, nombre, precio, cantidad, descripcion, rutaImagen) values (null, 'Invernadero Floral', 2999, 3, 'Siempre tendrás flores en los aniversarios que olvides ;)', 'floral.jpg');
insert into productos (idProducto, nombre, precio, cantidad, descripcion, rutaImagen) values (null, 'Invernadero Silvestre', 2000, 3, 'Por si lo que te gusta es el ambiente salvaje, y claro siempre puedes agarrar para un té de manzanilla', 'silvestre.jpg');

create table carrito(
idPedido int(10) auto_increment primary key,
idUsuario int(4),
idProducto int(10),
cantidad int (20),
foreign key(idUsuario) references usuarios(idUsuario) on delete cascade on update cascade,
foreign key(idProducto) references productos(idProducto) on delete cascade on update cascade
);

create table tipoPlanta(
idTipoPlanta int(3) auto_increment primary key,
tipoPlanta varchar(25),
temperatura int(2),
exposicionSolar boolean,
cantidadDeAgua int(5),
lapsoDeRiego int(5));

create table planta(
idPlanta int(3) auto_increment primary key,
nombrePlanta varchar(20),
idTipoPlanta int(3),
idProducto int(3),
foreign key (idTipoPlanta) references tipoPlanta(idTipoPlanta) on delete cascade on update cascade,
foreign key (idProducto) references productos(idProducto) on delete cascade on update cascade);

delimiter //
create procedure insertarUser(in id int(3), tipo int(3), nom varchar(200), email varchar(200), contra varchar(200))
begin	
	insert into usuarios (idUsuario, tipoUsuario, nombre, correo, contrasena) values(id, tipo, nom, email, md5(contra));
end //

delimiter //
create procedure buscarContraYCorreo(in email varchar(200), contra varchar(200))
begin
	select * from usuarios where correo = email and contrasena = md5(contra);
end //

delimiter ;

delimiter //
create procedure borrarUsuario(email varchar(100))
begin
	delete from usuarios where correo=email;
end //

delimiter //
create procedure modificarProducto(antNom varchar(25), nom varchar(25), prec varchar(15), cant varchar(20), descrip varchar(100), imagen varchar(100))
begin
	update productos set nombre = nom, precio = prec, cantidad = cant, descripcion = descrip, rutaImagen = imagen where nombre = antNom;
end //

delimiter //
create procedure carrito(_idUsuario int(4),_idProducto int (10),_cantidad int (20),tipo int)
begin
declare num int;
declare num2 int;
select cantidad into num from carrito where idProducto= _idProducto && idUsuario=_idUsuario;
select cantidad into num2 from productos where idProducto= _idProducto;

if not exists(select idPedido from carrito where idProducto= _idProducto && idUsuario=_idUsuario) and tipo=1 and _cantidad<=num2 then 

insert into carrito (idUsuario,idProducto,cantidad) values (_idUsuario,_idProducto,_cantidad);
Update productos set cantidad=(num2-_cantidad) where idProducto= _idProducto;

elseif exists(select idPedido from  carrito where idProducto= _idProducto && idUsuario=_idUsuario) and tipo=1 and _cantidad<=num2 then 

update carrito set idUsuario=_idUsuario,idProducto=_idProducto,cantidad=(_cantidad+num) where idProducto= _idProducto && idUsuario=_idUsuario;
Update productos set cantidad=(num2-_cantidad) where idProducto= _idProducto;

elseif exists(select idPedido from  carrito where idProducto= _idProducto && idUsuario=_idUsuario) and tipo=2 and _cantidad<=num2 then 

update carrito set idUsuario=_idUsuario,idProducto=_idProducto,cantidad=(_cantidad-num) where idProducto= _idProducto && idUsuario=_idUsuario;
Update productos set cantidad=(num2 + _cantidad) where idProducto= _idProducto;

elseif tipo = 2 then delete from carrito where idUsuario=_idUsuario;
end if;

end//

delimiter //
create procedure modificarDatos(correoAnte varchar(250), nom varchar(250), contra varchar(250), email varchar(100))
begin
	update usuarios set nombre = nom, correo = email, contrasena = md5(contra) where correo = correoAnte;
end //

delimiter ;

call insertarUser(null, 2, 'Administrador', 'admin@gmail.com', 'admin');
call insertarUser(null, 1, 'Imanol', 'imanol@gmail.com', 'imanol');

use bd_smartgreen;
select * from carrito;