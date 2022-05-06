--Datos resto tablas--
-------------------------------------
/*
insert into Deposito(DepositoID,Fecha, Beneficiario,Descripcion, Valor, Estado, BancoID) values
(1, '2021-08-10', 'Samuel Perez', 'Ganacia cosecha 247', 40500, 'Terminado', 2)

insert into Deposito(DepositoID,Fecha, Beneficiario,Descripcion, Valor, Estado, BancoID) values
(2, '2021-08-15', 'Gisell Hernandez', 'Desembolso insumos caducados', 125000, 'En Proceso', 3)
*/
select * from Deposito


-------------------------------------
/*
insert into Cheque(ChequeID,Fecha, Beneficiario,Descripcion, Valor, Estado, BancoID) values
(1, '2021-08-15', 'Gisell Hernandez', 'Desembolso insumos caducados', 125000, 'En Proceso', 3)

insert into Cheque(ChequeID,Fecha, Beneficiario,Descripcion, Valor, Estado, BancoID) values
(2, '2021-07-30', 'Martha Contreras', 'Cierre de cosecha zanahorias', 280000, 'Pagado', 1)
*/
select * from Cheque


--------------------------------------
/*
insert into Cliente(ClienteID, Nombre, Direccion, Telefono) values
(1, 'Fernando Mesa', 'SPS', 36749581)

insert into Cliente(ClienteID, Nombre, Direccion, Telefono) values
(2, 'Martin Lutero', 'Tegucigalpa', 97367892)
*/
select * from Cliente


-------------------------------------
/*
insert into Factura (FacturaID, ClienteID, Fecha, Estado, Subtotal, Impuesto, Total) values 
(1,2, '2021-04-14', 'Pagada',956.25, 0.15, 987.54 )

insert into Factura (FacturaID, ClienteID, Fecha, Estado, Subtotal, Impuesto, Total) values 
(2,1, '2021-06-17', 'Terminada',10987.00, 0.15, 10206.00 )
*/
select * from Factura


--------------------------------------
/*  
insert into Recibo(ReciboID, ClienteID,ProductoID, Fecha, Nombre, Cantidad, Subtotal, Impuesto, Total) values 
(3,2,3, '2021-05-15', 'Maria Solis',10, 72.32,0, 72.32 )

insert into Recibo(ReciboID, ClienteID,ProductoID, Fecha, Nombre, Cantidad, Subtotal, Impuesto, Total) values 
(4,1,2, '2021-05-24', 'Cindy Sabillon',2, 556.0,0.15, 610.24 )
*/

--select * from Banco
--select * from Cheque
--select * from Deposito

--select * from Cliente
--select * from Factura
select * from Recibo
select * from Producto