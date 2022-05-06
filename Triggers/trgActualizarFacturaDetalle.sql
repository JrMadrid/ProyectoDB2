--6 ACTUALIZA EL SUBTOTAL Y TOTAL DE FACTURA CUANDO SE ACTUALIZA FACTURADETALLE-- LISTISIMO
create trigger trgFacturaDetalle on FacturaDetalle for insert
as
	declare @facturaid int, @productoid int, @precio float, @cantidad int, @descuento float, @subtotal float
	declare crsInsertar cursor for
	select FacturaID, ProductoID, Cantidad, Descuento from inserted
	open crsInsertar; fetch next from crsInsertar into @facturaid, @productoid,  @cantidad, @descuento
	while @@FETCH_STATUS=0
		begin
			select @productoid = ProductoID from inserted

			print @productoid

			select @cantidad = Cantidad from inserted

			select @descuento =Descuento from inserted

			select @precio= PrecioVenta from Producto where ProductoID=@productoid

			select @subtotal=@precio*@cantidad

			update Factura set Subtotal = @subtotal where FacturaID=@facturaid

			update Factura set Total = @subtotal + @subtotal* Impuesto where FacturaID=@facturaid

			fetch next from  crsInsertar into @facturaid, @productoid,  @cantidad, @descuento
		end
		close crsInsertar; deallocate crsInsertar
go

--Datos para probar
select * from Factura
select * from FacturaDetalle

delete from FacturaDetalle
delete from Factura


insert into Factura (FacturaID, ClienteID, Fecha, Estado, Impuesto) values (3, 2, '2021-08-15', 'Pagada', 0.15)
insert into FacturaDetalle (FacturaID, ProductoID, Cantidad, Descuento) values (3, 1, 5, 0)

