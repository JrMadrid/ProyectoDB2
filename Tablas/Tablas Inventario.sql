--TABLAS INVENTARIO--

--Lista
create table Proveedor(
ProveedorID int not null primary key,
RTN int,
Nombre varchar(50),
Direccion varchar(100),
Telefono int,
FechaVencimiento datetime,
BancoID int not null
)
--Lista
create table Insumo(
InsumoID int not null primary key,
Nombre varchar(50),
Tipo varchar(50),
Precio int not null,
BodegaID int not null
)
--Lista
create table Bodega(
BodegaID int not null primary key,
Almacen varchar(20),
Existencia int
)
--Lista
create table CompraProveedor(
CompraProveedorID int not null primary key,
ProveedorID int not null,
InsumoID int not null,
Fecha datetime,
Documento varchar(20),
Estado varchar(20),
Cantidad int,
Total float
)
--Kista
create table VentaProductor(
VentaProductorID int not null,
ProductorID int not null,
InsumoID int not null,
Fecha datetime,
Documento varchar(20),
Estado varchar(20),
Cantidad int, 
Impuesto float,
Total float
)

--Llaves foraneas--

--Lista
alter table Insumo add constraint fkInsumoBodega foreign key (BodegaID) references Bodega

--Lista
alter table CompraProveedor add constraint fkCCompraProveedor foreign key (ProveedorID) references Proveedor

--Lista
alter table CompraProveedor add constraint fkCompraInsumo foreign key (InsumoID) references Insumo

--Lista
alter table VentaProductor add constraint fkVentaProductor foreign key (ProductorID) references Productor

--Lista
alter table VentaProductor add constraint fkVentaInsumo foreign key (InsumoID) references Insumo

--Lista
alter table Proveedor add constraint fkProveedorBanco foreign key (BancoID) references Banco