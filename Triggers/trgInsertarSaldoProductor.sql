--3 CUANDO SE INGRESE UN NUEVO PRODUCTOR, SE AGREGARA A LA TABBLA DE SALDOS PARA REGISTRAR SUS OPERACION EN LA COMERCIALIZADORA-- LISTISIMO
create trigger trgInsertarSaldoProductor on Productor for insert
as
	declare @productorid int
	declare crsInsertar cursor for
	select ProductorID from inserted
	open crsInsertar; fetch next from crsInsertar into @productorid
	while @@FETCH_STATUS=0
		begin
			insert into SaldoProductor (ProductorID, Produccion, VentaTotal, CompraTotalInsumos) values (@productorid, 0, 0, 0)
			fetch next from crsInsertar into @productorid
		end
		close crsInsertar; deallocate crsInsertar
go
--BUENISIMO--