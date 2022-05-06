--7 CUANDO EL ESTADO DE LA COSECHA PASA A TERMINADO, INGRESA EL PRODUCTO A BODEGA Y ACTUALZA LAS EXISTENCIAS-- LISTISIMO
create trigger trgCosechaTerminada on Cosecha for update 
as 
declare @cosechaid int, @estado varchar(50), @existencias int, @bodegaid int
declare crsActualizarExistencias cursor for 
	select distinct CosechaID from inserted 
		union 
	select distinct CosechaID from deleted 
	
	open crsActualizarExistencias; fetch next from crsActualizarExistencias into @cosechaid
	while @@FETCH_STATUS = 0 
		begin 

		select @estado=ISNULL(Estado,'DESCONOCIDO') from Cosecha where CosechaID=@cosechaid

		select @existencias=l.CantidadCosechas from Cosecha as c inner join Lote as l on c.LoteID=l.LoteID where CosechaID=@cosechaid
		--bien--
		
		select @bodegaid=b.BodegaID from Producto as p inner join Bodega as b on p.BodegaID=b.BodegaID
		inner join Cosecha as c on p.ProductoID=c.ProductoID
		where c.CosechaID=@cosechaid

		if @estado ='Terminado'
		begin
		update Bodega set Existencia=@existencias where BodegaID=@bodegaid
		end
		fetch next from  crsActualizarExistencias into @cosechaid
		end 

	close crsActualizarExistencias; deallocate crsActualizarExistencias
	
go 


update Cosecha set Estado='Terminado' where CosechaID=3




