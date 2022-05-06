/*
	Procedimeinto almacenado transaccional que corrigen el recibo
*/
create procedure spVerficarFFinalCosecha  @CosechaID int = 0
as
begin transaction
	declare @error1 as int, @DiaA int, @MesA int, @AnnoA int, @DiaF int, @MesF int, @AnnoF int 
	select @AnnoA = year(GETDATE())
	select @mesA = month(GETDATE())
	select @DiaA = day(GETDATE())

	select @AnnoF = YEAR(FechaFinal) from Cosecha where cosecha.CosechaID = @CosechaID
	select @MesF = Month(FechaFinal) from Cosecha where cosecha.CosechaID = @CosechaID
	select @DiaF = DAY(FechaFinal) from Cosecha where cosecha.CosechaID = @CosechaID
		
		if((@AnnoA*365 + @MesA*31 + @DiaA) - (@AnnoF*365 + @MesF*31 + @DiaF)>(0))
			begin
			update Cosecha set Estado = 'Terminado'
			where cosecha.CosechaID = @CosechaID
			end
		
		else 
			begin
			update Cosecha set Estado = 'En Proceso'
			where cosecha.CosechaID = @CosechaID
			end

	if @@ERROR=0
		commit
	else
		rollback
go
select * from Cosecha
execute spVerficarFFinalCosecha 2
select * from Cosecha