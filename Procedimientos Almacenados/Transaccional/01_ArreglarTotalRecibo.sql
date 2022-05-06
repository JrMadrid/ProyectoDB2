/*
	Procedimeinto almacenado transaccional que corrigen el recibo
*/
create procedure spUpdateTotal  @ReciboID int = 0
as
begin transaction

	declare @error1 as int

		declare @arreglar int 
		select @arreglar = prod.PrecioVenta
		from Producto prod
		inner join recibo rec on prod.ProductoID = rec.ProductoID
		where rec.ReciboID = @ReciboID

		update Recibo set subTotal = Cantidad*@arreglar
		where(ReciboID = @ReciboID)

		update Recibo set Total = Cantidad*@arreglar+Cantidad*@arreglar*Impuesto
		where (ReciboID = @ReciboID)


	if @@ERROR=0
		commit
	else
		rollback
go
select * from Recibo
execute spUpdateTotal 2
select * from Recibo