/*
Funcion para saber la cantidad de productos vendidos
*/
create function dbo.CantidadProductosVendidos (@ReciboID int) returns float 
as
	begin
		declare @Solicitud float = 0
		 select @Solicitud = cast(REC.Subtotal/PRO.PrecioVenta as numeric(11,2))*1.00
			from Recibo REC
			inner join producto PRO on REC.ProductoID = PRO.ProductoID
			where REC.ReciboID = @ReciboID

		return @solicitud
	end
go 
print dbo.CantidadProductosVendidos(1) --as 'Cantidad de Productos Vendidos'
