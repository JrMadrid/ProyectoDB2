--TABLAS VENTAS--

--Lista
create table Cliente(
ClienteID int not null primary key,
Nombre varchar(50),
Direccion varchar(100),
Telefono int,
)

--Lista
create table Factura(
FacturaID int not null primary key,
ClienteID int not null,
Fecha datetime,
Estado varchar(20),
Subtotal float,
Impuesto float,
Total float
)

--Lista
create table FacturaDetalle(
FacturaID int not null,
ProductoID int not null,
Cantidad int,
Impuesto float,
Descuento float
)

--Lista
create table Recibo(
ReciboID int not null primary key,
ClienteID int not null,
ProductoID int not null,
Fecha datetime,
Nombre varchar(50),
Cantidad int,
Subtotal float,
Impuesto float,
Total float
)

--Llaves foraneas--

--Lista
alter table Factura add constraint fkFacturaCliente foreign key (ClienteID) references Cliente

--Lista
alter table FacturaDetalle add constraint fkFacturaDetalle foreign key (FacturaID) references Factura

--Lista
alter table Recibo add constraint fkReciboCliente foreign key (ClienteID) references Cliente

--Lista
alter table Recibo add constraint fkReciboProducto foreign key (ProductoID) references Producto