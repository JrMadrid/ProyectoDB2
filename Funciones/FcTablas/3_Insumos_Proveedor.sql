/*
Funcion que al ingresa proveedorId diga los insumos adquiridos en tal fecha

*/
alter function dbo.FcInsumosProveedor (@proveedorID int) returns @info table
(
	Proveedor_Nombre varchar(50), Documento_Proveedor varchar(50), Nombre_Insumo varchar(50), Fecha_Compra datetime
)
as
	begin
		insert into @info 
		select prov.Nombre,comprov.Documento,ins.Nombre,comprov.Fecha
		from Proveedor as Prov
		inner join CompraProveedor as comprov on prov.ProveedorID = comprov.ProveedorID
		inner join Insumo as ins on comprov.InsumoID = ins.InsumoID
 
		where prov.proveedorID = @proveedorID

		return
	end
go
select * from dbo.FcInsumosProveedor (1)
