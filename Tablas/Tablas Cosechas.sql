--TABLAS COSECHAS--

--Lista
create table Productor (
ProductorID int not null primary key,
Nombre varchar(50),
Direccion varchar(100),
Telefono varchar(20),
BancoID int not null
)
--Lista
create table Finca(
FincaID int not null primary key,
ProductorID int not null,
Nombre varchar(50),
Ubicacion varchar(50),
Extension int,
)
--Lista
create table Producto(
ProductoID int not null primary key,
Nombre varchar(50),
Unidad varchar(10),
PrecioCompra float,
PrecioVenta float,
BodegaID int not null
)
--Lista
create table Lote (
LoteID int not null primary key,
FincaID int not null,
ProductoID int not null,
Extension int,
TipoSuelo varchar(50),
TipoRiego varchar(50),
CantidadCosechas int,
)
--Lista
create table Cosecha(
CosechaID int not null primary key,
LoteID int not null, 
ProductoID int not null,
Estado varchar(50),
FechaInicial datetime,
FechaFinal datetime
)

--Llave foraneas--

--Lista
alter table Finca add constraint fkProveedorFinca foreign key (ProductorID) references Productor
--Lista
alter table Lote add constraint fkLoteFinca foreign key (FincaID) references Finca
--Lista
alter table Lote add constraint fkLoteProducto foreign key (ProductoID) references Producto
--Lista
alter table Cosecha add constraint fkCosechaLote foreign key (LoteID) references Lote
--Lista
alter table Cosecha add constraint fkCosechaProducto foreign key (ProductoID) references Producto

--Lista
alter table Productor add constraint fkProductorBanco foreign key (BancoID) references Banco