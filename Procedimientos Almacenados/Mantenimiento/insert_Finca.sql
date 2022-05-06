--Insertar Finca--
create procedure spInsertarFincas @productor int, @Nombre varchar(50),@ubicacion varchar(50), @extension int
as
	declare @NFinca int
	select @NFinca= isnull(max(FincaID),0) +1 from Finca
    
	insert into Finca(FincaID,ProductorID,Nombre,Ubicacion,Extension) values(@NFinca ,@productor, @Nombre, @ubicacion, @extension);
	select * from Finca
go
execute spInsertarFincas 1,'Mañanales','Progreso',8500
execute spInsertarFincas 2,'Magnolias','Sta.Barbara',7000
execute spInsertarFincas 3,'LunaNueva','SPS',9000
select * from Finca