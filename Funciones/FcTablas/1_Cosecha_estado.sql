/*Hacer una función que reciba como parámetro el número de la cosecha
y devuelva el estado de esta. 
Que se puede decidir al momento de llamar la función si se desea ver solo los terminados, en proceso o todos. 
*/
create function dbo.FcCosecha_estado (@CosechaID int, @Filtro varchar) returns @CosechaEstado table
(
	CosechaID int, Estado varchar(50)
)
as
	begin
		if (@Filtro = 'A')
			insert into @CosechaEstado
			select C.CosechaID, C.Estado 
			from Cosecha C
			where c.CosechaID  = @CosechaID 

		else if (@Filtro = 'E')
			insert into @CosechaEstado
			select C.CosechaID, C.Estado 
			from Cosecha C
			where c.CosechaID  = @CosechaID and c.Estado = 'En proceso'

		else if (@Filtro = 'T')
			insert into @CosechaEstado
			select C.CosechaID, C.Estado 
			from Cosecha C
			where c.CosechaID  = @CosechaID and c.Estado = 'Terminado'
		
		
		return
	end
go

select * from dbo.FcCosecha_estado(2,'E')
/*
select * from cosecha
*/