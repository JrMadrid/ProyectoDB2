/*
	Procedimeinto almacenado transaccional que corrigen el total de compra de compraproveedor
*/
create procedure spUpdateTotalComProv  @comprovID int 
as
begin transaction

	declare @error1 as int

		declare @arreglar int, @todos int = 0
		select @arreglar = ins.Precio
		from insumo ins
		inner join CompraProveedor comprov on ins.InsumoID = comprov.InsumoID
		where comprov.CompraProveedorID = @comprovID

		update CompraProveedor set Total = Cantidad*@arreglar
		where(CompraProveedorID = @comprovID)
		

	if @@ERROR=0
		commit
	else
		rollback
go
execute spUpdateTotalComProv 3
