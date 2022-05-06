/*
Funcion para averiguar la cantidad de transacciones de un banco
*/
create function dbo.FcTranBanco (@BancoID int) returns int 
as
	begin
		declare @Solicitud int = 0,
				@TCheque int = 0, @TDeposito int = 0

		 select @TCheque = count(che.BancoID)
		 from Banco bc
			inner join Cheque che on bc.BancoID = che.BancoID
			where bc.BancoID = @BancoID

		select @TDeposito = COUNT(depo.BancoID)
		from Banco bc
			inner join Deposito depo on bc.BancoID = depo.BancoID
			where bc.BancoID = @BancoID


		select @solicitud = @TCheque + @TDeposito
		return @solicitud
	end
go 
print dbo.FcTranBanco(1)


