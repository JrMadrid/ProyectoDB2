--Reciba CosechaID y mostrara los dias la cantidad de dias que se tienen previsto para que termine o los dias que se tardo
create function dbo.FcCantidad_tiempo (@CosechaID int) returns int
as
	begin
		
	declare @tiempoi int = 0,@tiempof int=0

	select @tiempoi= day(FechaInicial)+31*(MONTH(FechaInicial))+365*(year(FechaInicial)) from Cosecha where CosechaID = @CosechaID
	select @tiempof= day(FechaFinal)+31*(MONTH(FechaFinal))+365*(year(FechaFinal)) from Cosecha where CosechaID = @CosechaID
	
	return @tiempof-@tiempoi
	
	end
go
select dbo.FcCantidad_tiempo (2) as 'Dias demorados'
