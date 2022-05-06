/*
Funcion que al ingresar un bancoID este de los datos de cheque y deposito

*/
alter function dbo.FcBancoCoD (@BancoID int) returns @info table
(
	Banco varchar(50), Beneficiario varchar(50), Descripcion varchar(50),TIPO varchar(50), Valor int, Estado varchar(50) 
)
as
	begin
		insert into @info 
		select bc.Institucion, depo.Beneficiario, depo.Descripcion,'DEPOSITO', depo.Valor, depo.Estado
		from Deposito depo
		inner join Banco bc on depo.BancoID = bc.BancoID
		where bc.BancoID = @BancoID
		union
		select bc.Institucion, che.Beneficiario, che.Descripcion,'CHEQUE', che.Valor, che.Estado
		from Cheque che
		inner join Banco bc on che.BancoID = bc.BancoID
		where bc.BancoID = @BancoID
		return
	end
go
select * from dbo.FcBancoCoD (3)