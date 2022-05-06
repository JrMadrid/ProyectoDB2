--5 CUANDO INGRESE PRODUCTO A INVENTARIO ACTUALIZARA LA PRODUCCION QUE TUVO EN ESA COSECHA DETERMIANDO PRODUCTOR -- LISTISIMO
create trigger trgActualizarProduccion on Bodega for update 
as 
declare @bodegaid int, @existencias int, @preciocompra float, @produccion float, @lote int, @productorid int
declare crsActualizar cursor for 
	select distinct BodegaID from inserted 
		union 
	select distinct BodegaID from deleted 

	open crsActualizar; fetch next from crsActualizar into @bodegaid
	while @@FETCH_STATUS = 0 
		begin 

		select @existencias = BodegaId from Bodega where BodegaID=@bodegaid

		select @preciocompra=PrecioCompra from Producto where BodegaID=@bodegaid
	
		select @produccion=@existencias*@preciocompra 
		
		select @lote=l.LoteID from Producto as p inner join Bodega as b on p.BodegaID=b.BodegaID
		inner join Lote as l on p.ProductoID= l.ProductoID where p.BodegaID=@bodegaid

		select @productorid=f.ProductorID from Finca as f inner join Lote as l on f.FincaID=l.FincaID
		inner join Productor as p on f.ProductorID=p.ProductorID where l.LoteID=@lote

		update SaldoProductor set Produccion=@produccion where ProductorID=@productorid

		fetch next from  crsActualizar into @bodegaid
		end 

	close crsActualizar; deallocate crsActualizar
	
go 
select * from Cosecha

update Cosecha set Estado = 'Terminado' where CosechaID=3

update Cosecha set Estado = 'En proceso'

update SaldoProductor set CompraTotalInsumos =100


select * from SaldoProductor

select * from SaldoProductor
insert into SaldoProductor(ProductorID, Produccion, VentaTotal, CompraTotalInsumos) values (3,0,0,0)


