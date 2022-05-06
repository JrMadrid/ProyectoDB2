--Insertar cosecha--

alter procedure spInsertarcosechas @LoteID int,@ProductoID int,@Estado varchar(50),@FechaInicial datetime,@FechaFinal datetime
as
	
	declare @cosechaID int
	select @cosechaID= isnull(max(CosechaID),0) +1 from Cosecha
	insert into Cosecha(CosechaID,LoteID,ProductoID,Estado,FechaInicial,FechaFinal) 
				values (@cosechaID ,@LoteID,@ProductoID,@Estado,@FechaInicial,@FechaFinal)
	select CosechaID,LoteID,ProductoID,Estado,CONVERT(varchar,FechaInicial,3) as FechaInicial,CONVERT(varchar,FechaFinal,3) as FechaFinal from Cosecha

go

execute spInsertarcosechas 1,3,'Terminado','1/1/6','1/2/6'
execute spInsertarcosechas 2,1,'En Proceso','1/4/21','1/9/22'
execute spInsertarcosechas 1,2,'Terminado','1/4/9','1/8/9'
execute spInsertarcosechas 2,2,'En Proceso','2/5/9','4/8/9'