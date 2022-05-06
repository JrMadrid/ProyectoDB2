--1. Hacer una función que reciba como parámetro el número de productoID y devuelve la diferencia de costos del producto
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
