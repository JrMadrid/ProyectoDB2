/*
	Procedimiento almacenado transaccional que corrige el total de ventaproductor
*/
create procedure spUpdateTotalVenPro  @venproID int 
as
begin transaction

	declare @error1 as int

		declare @arreglar int, @todos int = 0
		select @arreglar = ins.Precio
		from insumo ins
		inner join VentaProductor venpro on ins.InsumoID = venpro.InsumoID
		where venpro.VentaProductorID = @venproID

		update VentaProductor set Total = (Cantidad*@arreglar+Cantidad*@arreglar*Impuesto)
		where(VentaProductorID = @venproID)
		

	if @@ERROR=0
		commit
	else
		rollback
go
execute spUpdateTotalVenPro 3
--select * from VentaProductor
--select * from insumo