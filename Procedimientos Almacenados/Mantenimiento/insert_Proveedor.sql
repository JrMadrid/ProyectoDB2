--insertar Proveedor
create procedure spInsertarProveedor @RTN int ,@Nombre varchar(50) ,@Direccion varchar(50),
									 @Telefono int ,@FechaVencimiento datetime ,@BancoID int
as

	declare @ProveedorID int
	select @ProveedorID= isnull(max(ProveedorID),0) +1 from Proveedor
	insert into Proveedor(ProveedorID,RTN,Nombre,Direccion,Telefono,FechaVencimiento,BancoID) 
	values (@ProveedorID,@RTN,@Nombre,@Direccion,@Telefono,@FechaVencimiento,@BancoID)
	select * from Proveedor
go
execute spInsertarProveedor 142536987,'Juan Perez','SPS',89253614,'1/05/21',2
execute spInsertarProveedor 856932147,'Arnold Rivera','Yoro',96368525,'1/11/21',1
execute spInsertarProveedor 142536987,'Oscar Molina','Sta.Barbara',32659878,'7/07/21',3