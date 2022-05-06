--Recibe el productoID y muestre las posibles ganancias 
create function dbo.FcCantidad_ganancias (@productoID int) returns float
as
	begin
		
	declare @existencias int, @valor int

	select @valor= PrecioVenta from Producto where productoID = @productoID
	select @existencias= Bo.Existencia from Producto pro
	inner join Bodega Bo on pro.BodegaID = bo.BodegaID
	where productoID = @productoID

	return @valor*@existencias
	
	end
go

select dbo.FcCantidad_ganancias(2) as 'Ganancias'
--select * from Bodega
--select * from Producto