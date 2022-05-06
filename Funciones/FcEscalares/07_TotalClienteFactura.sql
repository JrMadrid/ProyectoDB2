/*
Funcion que segun el ID del cliente da la suma completa de el total
*/
create function dbo.FcTotalCliente (@ClienteID int) returns int 
as
	begin
		declare @Solicitud int = 0
		
		select @Solicitud = sum(fac.Total)
		from Factura fac
		inner join Cliente cl on fac.ClienteID = cl.ClienteID

		where cl.ClienteID = @ClienteID

		return @solicitud
	end
go
select dbo.FcTotalCliente(1) as 'TOTAL'
print dbo.FcTotalCliente(1)