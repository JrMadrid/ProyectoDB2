-------insertar en banco
alter procedure spInsertarBanco @Institucion varchar(50), @NumeroCuenta int,@Tipo varchar(50)
as
	declare @BancoID int
	select @BancoID= isnull(max(BancoID),0) +1 from Banco
 
	insert into Banco(BancoID,Institucion,NumeroCuenta,Tipo) values(@BancoID,@Institucion,@NumeroCuenta,@Tipo);
	select * from Banco
go
execute spInsertarBanco 'Trabajadores',142536,'Corriente'
execute spInsertarBanco 'Ficosa',475869,'Ahorro'
execute spInsertarBanco 'Lafise',253648,'Corriente'
select * from Banco

