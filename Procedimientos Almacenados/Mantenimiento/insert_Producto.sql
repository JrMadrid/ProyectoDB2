--Insertar producto--
create procedure spInsertarProducto @nombre varchar(50), @unidad varchar(50), @PrecioCompra float, @PrecioVenta float, @bodegaID int
as
	declare @productoid int
	select @productoid= isnull(max(ProductoID),0) +1 from Producto
	insert into Producto(ProductoID,nombre, unidad, PrecioCompra ,PrecioVenta ,bodegaID) values (@productoid,@nombre , @unidad , @PrecioCompra, @PrecioVenta, @bodegaID)

	select * from Producto
	
go

execute spInsertarProducto 'Manzanas','Libras',10,12,1
execute spInsertarProducto 'naranjos','Arroba',7,9,2
execute spInsertarProducto 'Bananos','Libra',15,20,3

select * from Producto