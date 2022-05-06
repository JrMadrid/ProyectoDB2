--1. Hacer una funci�n que reciba como par�metro el n�mero de productoID y devuelve la diferencia de costos del producto
create function dbo.FcDiferencia_Precios (@identidad int) returns int
as
	begin
		
declare @pcompra int, @pventa int

	select @pcompra = sum(PrecioCompra) from Producto where ProductoID = @identidad

	select @pventa = sum(PrecioVenta) from Producto where ProductoID = @identidad

	return @pventa - @pcompra
	
end
go

print dbo.FcDiferencia_Precios (2)
