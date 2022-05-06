--Insertar Lote--
--
create procedure spInsertarLote @FincaID int, @ProductoID int, @Extension int, 
							   @TipoSuelo varchar(50), @TipoRiego varchar(50), @CantidadCosechas int 
as

	declare @LoteID int
	select @LoteID= isnull(max(LoteID),0) +1 from Lote
	insert into Lote(LoteID,FincaID,ProductoID,Extension,TipoSuelo,TipoRiego,CantidadCosechas) 
	values (@LoteID,@FincaID,@ProductoID,@Extension,@TipoSuelo,@TipoSuelo,@CantidadCosechas)
	select * from Lote
go

execute spInsertarLote 1,2,500,'Limonoso','Goteo',5
execute spInsertarLote 2,2,500,'Arcilloso','Aspersion',4
execute spInsertarLote 1,1,500,'Limono','Aspersion',3
