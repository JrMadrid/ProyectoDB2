create view v_ExistenciasBodega
as
	select b.BodegaID as Bodega,p.Nombre,b.Existencia 
	from Bodega as b
	inner join Producto as p on b.BodegaID=p.BodegaID
go
select * from v_ExistenciasBodega
