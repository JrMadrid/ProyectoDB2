create view v_Fincas
as
	select p.Nombre as Duenio,l.LoteID as lote,Pro.Nombre as Producto
	from Finca as f
	inner join Productor as p on f.ProductorID=p.ProductorID
	inner join lote as l on l.FincaID=f.FincaID
	inner join Cosecha as c on l.LoteID=c.LoteID
	inner join Producto as Pro on c.ProductoID=Pro.ProductoID
go
select * from v_Fincas