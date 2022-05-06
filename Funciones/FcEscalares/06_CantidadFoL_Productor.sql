/*
Hacer una funcion que reciba como parametro la identificacion del productor 
y se decida si ver su cantidad de fincas o lotes o todos dejandolo vacio
*/
create function dbo.FcFOL (@ProductorID int, @FoL varchar) returns int 
as
	begin
		declare @SolicitudF int = 0, @SolicitudL int = 0
		
			if (@FoL in (' '))
			begin
			select  @SolicitudF = count(F.FincaID)
			from  Productor P 
			inner join Finca F on P.ProductorID = F.ProductorID
			where P.ProductorID = @ProductorID

			select @SolicitudL = count(L.LoteID)
			from  Productor P 
			inner join Finca F on P.ProductorID = F.ProductorID
			inner join Lote L on F.FincaID = L.FincaID
			where P.ProductorID = @ProductorID 
			end

			if (@FoL = 'F')
			begin
			select  @SolicitudF = count(F.FincaID)
			from  Productor P 
			inner join Finca F on P.ProductorID = F.ProductorID
			where P.ProductorID = @ProductorID
			end

			else if (@FoL = 'L')
			begin
			select @SolicitudL = count(L.LoteID)
			from  Productor P 
			inner join Finca F on P.ProductorID = F.ProductorID
			inner join Lote L on F.FincaID = L.FincaID
			where P.ProductorID = @ProductorID 
			end

		return @solicitudF + @solicitudL
	end
go
print dbo.FcFOL (1,' ') 
