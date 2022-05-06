/*
Funcion para los totales de un cliente eligiendo entre factura y recibo
*/
create function dbo.FAC_o_REC (@ClienteID int,@Dataso varchar(50)=' ') returns float 
as
	begin
		declare @Solicitud float = 0

		if (@Dataso = 'FAC')
		begin 
			select @Solicitud = sum(fac.Total)
			from Cliente CL
			inner join Factura fac on cl.ClienteID = Fac.ClienteID
			where cl.ClienteID = @ClienteID
		end

		if (@Dataso = 'REC')
		begin 
			select @Solicitud = sum(rec.Total)
			from Cliente CL
			inner join Recibo rec on cl.ClienteID = rec.ClienteID
			where cl.ClienteID = @ClienteID
		end


		return @solicitud
	end
go 
print dbo.FAC_o_REC(2,'REC')
