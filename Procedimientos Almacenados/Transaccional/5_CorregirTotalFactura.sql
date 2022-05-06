/*
	Procedimeinto almacenado transaccional que corrija el total de factura
*/
alter procedure spUpdateTotalFactura  @facturaID int
as
begin transaction

	declare @error1 as int

		update Factura set Total = Subtotal+Subtotal*Impuesto 
		where facturaID=@facturaID


	if @@ERROR=0
		commit
	else
		rollback
go
select * from factura
execute spUpdateTotalFactura 2
select * from factura