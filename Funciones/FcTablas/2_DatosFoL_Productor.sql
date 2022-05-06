/*
Hacer una función que reciba como parámetro el número del productor 
y el devuelva una tabla con la información de sus fincas y lotes. 

*/
create function dbo.FcTDatosFoL_Productor (@productorID int) returns @info table
(
	ProductorID int, Nombre_Productor varchar(50), FincaID int, 
	Nombre_Finca varchar(50), LoteID int, Extencion int

)
as
	begin
		insert into @info 
		select P.ProductorID, P.Nombre, F.FincaID,F.Nombre,L.LoteID, L.Extension
		from Productor as P
		full join Finca as F on P.ProductorID = F.ProductorID
		full join Lote as L on F.FincaID = L.FincaID
 
		where p.ProductorID = @productorID

		return
	end
go
select * from dbo.FcTDatosFoL_Productor (1)
/*
select * from Productor
select * from finca
select * from Lote
*/