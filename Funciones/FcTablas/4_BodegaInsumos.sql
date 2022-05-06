/*
Funcion que al ingresar el ID de el insumo este diga en que almacen encontrarlo y sus existencias

*/
create function dbo.FcIBodegaInsumos (@InsumoID int) returns @info table
(
	InsumoID int , Nombre_Insumo varchar(50), Tipo_Insumo varchar(50),Nombre_Almacen varchar(50), Existencias int
)
as
	begin
		insert into @info 
		select ins.InsumoID,ins.Nombre,ins.Tipo,bdg.Almacen,bdg.Existencia
		from Insumo as ins
		inner join bodega as bdg on ins.BodegaID = bdg.BodegaID
 
		where ins.InsumoID = @InsumoID

		return
	end
go
select * from dbo.FcIBodegaInsumos (3)