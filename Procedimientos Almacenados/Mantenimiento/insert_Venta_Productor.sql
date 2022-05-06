--Insertar VentaProductor--
--
alter procedure spInsertarVenProd @ProductorID int, @InsumoID int, @Fecha datetime ,@Documento varchar(50)
									,@Estado varchar(50), @Cantidad int,@Impuesto float
as
	declare @VentaProductorID int,@Total float=0
	select @VentaProductorID= isnull(max(VentaProductorID),0) +1 from VentaProductor
	insert into VentaProductor(VentaProductorID,ProductorID,InsumoID,Fecha,Documento,Estado,Cantidad,Impuesto,Total) 
	values (@VentaProductorID,@ProductorID,@InsumoID,@Fecha,upper(@Documento),@Estado,@Cantidad,@Impuesto,@Total)

	select @Total = (venP.Cantidad*I.Precio+venP.Cantidad*I.Precio*@Impuesto) 
	from VentaProductor venP
	inner join Insumo I on venP.InsumoID = I.InsumoID

	update VentaProductor set Total=@Total where VentaProductorID=@VentaProductorID

	select VentaProductorID,ProductorID,InsumoID,CONVERT(varchar,Fecha,3) as Fecha,Documento,Estado,Cantidad,Impuesto,Total from VentaProductor
go
execute spInsertarVenProd 1,1,'5/7/2021','28f9a7b8','Completo',1,0.15
execute spInsertarVenProd 2,2,'8/8/2021','1b5a9c8h','Cuota',2,0.12
execute spInsertarVenProd 3,3,'2/11/2021','6h8c9a4b','Completo',3,0.2
