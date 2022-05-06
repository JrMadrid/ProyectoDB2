--4 AL ELIMINAR FACTURADETALLE SE ELIMINA TAMBIEN LA FACTURA-- LISTISIMO
create trigger trgEliminarFactura on FacturaDetalle for Delete
as
	declare @factura int
	declare crsFacturaDetalle cursor for
	select  FacturaID from deleted
	open crsFacturaDetalle; fetch next from crsFacturaDetalle into @factura
	while @@FETCH_STATUS=0
		begin

		select @factura=facturaid from Factura where FacturaID=@factura
				delete from Factura  where FacturaID=@factura

			fetch next from crsFacturaDetalle into @factura
			end
		close crsFacturaDetalle; deallocate crsFacturaDetalle
go

select * from Factura
select * from FacturaDetalle

delete from FacturaDetalle where FacturaID=3
delete from Factura


insert into Factura (FacturaID, ClienteID, Fecha, Estado, Impuesto) values (3, 2, '2021-08-15', 'Pagada', 0.15)
insert into FacturaDetalle (FacturaID, ProductoID, Cantidad, Descuento) values (3, 1, 5, 0)
