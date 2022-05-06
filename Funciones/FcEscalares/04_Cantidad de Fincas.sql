--Mostrar cuanta extension de fincas tiene a su disposicion un productor seleccionado
create function dbo.FcCantidadfincasExtension (@productorID int) returns int
as
	begin
		
	declare @cantidadExtension int

	select @cantidadExtension = sum(f.Extension) from Finca f
	where ProductorID = @productorID
	return @cantidadExtension 
	
	end
go
select dbo.FcCantidadfincasExtension(2) as 'Extension a su disposicion' 