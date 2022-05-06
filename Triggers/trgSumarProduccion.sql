--2 CUANDO SE AGREGUE UNA NUEVA PRODUCCION AL PRODUCTOR SE IRAN SUMANDO EL TOTAL DE PRODUCCIONES DE CADA PRODUCTOR EN SALDO PRODUCTOR-- LISTISIMO
create trigger trgSumarProduccion on SaldoProductor for update 
as 
declare @spid int, @totalpasado float, @totalactual float, @produccion float
declare crsSumarProduccion cursor for 
	select distinct SaldoProductorID, Produccion from inserted 
		union 
	select distinct SaldoProductorID,  Produccion from deleted 
	
	
	open crsSumarProduccion; fetch next from crsSumarProduccion into @spid, @produccion
	while @@FETCH_STATUS = 0 
		begin 
		
		select @totalpasado= Produccion from deleted

		select @totalactual = Produccion from inserted
		update SaldoProductor set Produccion = @totalpasado+@totalactual where SaldoProductorID=@spid

		fetch next from  crsSumarProduccion into @spid, @produccion
			
		end 

	close crsSumarProduccion; deallocate crsSumarProduccion
	
go 