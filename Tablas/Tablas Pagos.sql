--TABLAS PAGOS--

--Lista
create table Banco (
BancoID int not null primary key,
Institucion varchar(50),
NumeroCuenta int not null,
Tipo varchar(20)
)

--Lusta
create table Cheque(
ChequeID int not null primary key,
Fecha datetime,
Beneficiario varchar(50),
Descripcion varchar(100),
Valor float,
Estado varchar(20),
BancoID int not null
)

--Lista
create table Deposito(
DepositoID int not null primary key,
Fecha datetime,
Beneficiario varchar(50),
Descripcion varchar(100),
Valor float,
Estado varchar(20),
BancoID int not null
)

--Llave foraneas--

--Lista
alter table Cheque add constraint fkChequeBanco foreign key (BancoID) references Banco

--Lista
alter table Deposito add constraint fkDepositoBanco foreign key (BancoID) references Banco

