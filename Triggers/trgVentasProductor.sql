--1 CALCULA LAS VENTA DE CADA PRODUCTO QUE HAYA VENDIDO EL PRODUCTOR Y LO AGREGA A SALDO PRODUCTOR-- LISTISIMO
create trigger trgVentasProductor on Factura for insert
as
	declare @facturaid int, @totalfactura float, @productoid int, @loteid int, @productorid int
	declare crsInsertar cursor for
	select FacturaID from inserted
	open crsInsertar; fetch next from crsInsertar into @facturaid
	while @@FETCH_STATUS=0
		begin
			select @totalfactura = Total from Factura
			
			select @productoid= fd.ProductoID from FacturaDetalle as fd inner join Factura as f on fd.FacturaID=f.FacturaID
			inner join Lote as l on fd.ProductoID=l.ProductoID
			where f.FacturaID=@facturaid
			group by fd.ProductoID

			select @productorid= f.ProductorID from Finca as f inner join Lote as l on f.FincaID=l.FincaID
			inner join Productor as p on f.ProductorID=p.ProductorID
			where l.ProductoID=@productoid

			update SaldoProductor set VentaTotal = @totalfactura where ProductorID=@productoid
		end
		close crsInsertar; deallocate crsInsertar
go








