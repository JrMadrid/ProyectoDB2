--Insertar productor--
create procedure spInsertarProductor @nombre varchar(50), @direccion varchar(50), @telefono int, @BancoID int
as
	declare @productorid int
	select @productorid= isnull(max(ProductorID),0) +1 from Productor
	insert into Productor(ProductorID, Nombre, Direccion, Telefono,BancoID) values (@productorid, @nombre, @direccion, @telefono,@BancoID)

	select * from Productor
go

execute spInsertarProductor 'Rony Ventura', 'SPS', 96875896,2
execute spInsertarProductor 'Jhonny Morales', 'Yoros', 32569847,1
execute spInsertarProductor 'Elizabeth Morales', 'Sta.Barbara', 89253614,3

select * from Productor