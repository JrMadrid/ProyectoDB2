--Insertar CompraProveedor--
--
alter procedure spInsertarComProv @ProveedorID int, @InsumoID int, @Fecha datetime ,@Documento varchar(50)
									,@Estado varchar(50), @Cantidad int
as

	declare @CompraProveedorID int, @total float=0
	select @CompraProveedorID= isnull(max(CompraProveedorID),0) +1 from CompraProveedor

	insert into CompraProveedor(CompraProveedorID,ProveedorID,InsumoID,Fecha,Documento,Estado,Cantidad,Total) 
	values (@CompraProveedorID,@ProveedorID,@InsumoID,@Fecha,upper(@Documento),@Estado,@Cantidad,@Total) 

	select @total = (@Cantidad*I.Precio)   
	from CompraProveedor comp
 	inner join Insumo I on @InsumoID = I.InsumoID
	update CompraProveedor set Total=@Total where CompraProveedorID=@CompraProveedorID

	select CompraProveedorID,ProveedorID,InsumoID,CONVERT(varchar,Fecha,3) as Fecha,Documento,Estado,Cantidad,Total from CompraProveedor
go
execute spInsertarComProv  1,2,'5/6/2021','8a9c6b9f','Completo',1
execute spInsertarComProv  2,2,'6/3/2021','6h9f8a7c','Cuota',2
execute spInsertarComProv  3,1,'8/9/2021','1f4h8a5b','Cuota',1
