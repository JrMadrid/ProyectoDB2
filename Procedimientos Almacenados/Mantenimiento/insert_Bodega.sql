--Insertar Bodega--
create procedure spInsertarBodega @Almacen varchar(50),@Existencias int
as
	declare @BodegaID int
	select @BodegaID= isnull(max(BodegaID),0) +1 from Bodega
	insert into Bodega(BodegaID, Almacen, Existencia) 
	values (@BodegaID, @Almacen, @Existencias)

	select * from Bodega

	
go

execute spInsertarBodega 'Laureles',10
execute spInsertarBodega 'Ortiz',9
execute spInsertarBodega 'Villeda',20

select * from Bodega