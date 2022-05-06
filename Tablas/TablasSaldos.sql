create table SaldoProductor (
SaldoProductorID int not null IDENTITY(1,1),
ProductorID int not null,
Produccion float,--Existencias de Bodega* precio de compra Productor trigger cuando actualice bodega YAAA
VentaTotal float,--ProductoID de Factura * precioVenta de Producto trigger cuando Inserte factura
CompraTotalInsumos float -- Hacer un trigger  sum (Total) de VentaProductor al insertar en VentaProductor
--Otro trigger cuand finalice la cosecha cobre los insumos 
--Cuando inserte productor agregarlo a la tabla esta 
)

--Hacer un trigger cuando ingrese factura detalle se actualice el total y subtotal

alter table SaldoProductor add constraint fkSaldoProductor foreign key (ProductorID) references Productor
--HACIA FALTA ESTA LLAVE, INSERTALA--
alter table producto add constraint fkProductoBodega foreign key (BodegaID) references Bodega
--HACIA FALTA ESTA LLAVE, INSERTALA---
alter table facturadetalle add constraint fkFacturaProducto foreign key (ProductoID) references Producto


create table SaldoProveedor (
SaldoProveedorID int not null primary key,
CompraProveedorID int not null,
CompraTotal float --Trigger insertar compraproveedor hacer un sum(total) y ponerselo a este campo
--Otro trigger que al final del año cobre los insumos 
)