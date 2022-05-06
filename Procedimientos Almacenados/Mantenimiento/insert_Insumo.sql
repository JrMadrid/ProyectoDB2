--Insertar insumo--
--
create procedure spInsertarInsumo @Nombre varchar(50),@Tipo varchar(50),@Precio int,@BodegaID int
as

	declare @InsumoID int
	select @InsumoID = isnull(max(InsumoID),0) +1 from Insumo
	insert into Insumo(InsumoID,Nombre,Tipo,Precio,BodegaID) 
	values (@InsumoID,@Nombre,@Tipo,@Precio,@BodegaID)
	select * from Insumo
go

execute spInsertarInsumo 'Guantes','Vestimenta',30,1
execute spInsertarInsumo 'Mangueras','Herramienta',100,3
execute spInsertarInsumo 'Semillas','Siembra',5,2
execute spInsertarInsumo 'Plaguicidas','Herramienta',10,1
execute spInsertarInsumo 'Abono','Siembre',7,3
