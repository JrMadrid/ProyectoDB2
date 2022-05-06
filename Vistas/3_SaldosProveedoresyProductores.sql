create view v_SaldosProveedoresProductores
as
	select prov.Nombre,isnull(sum(cprov.Total),0) as Saldo, 'Proveedor' as Entidad
	from Proveedor prov
	inner join CompraProveedor as cprov on prov.ProveedorID=cprov.ProveedorID
	group by prov.nombre
	union
	select prod.Nombre,isnull(sum(vprod.Total),0) as Saldo, 'Productor' as Entidad
	from Productor prod
	inner join VentaProductor as vprod on prod.ProductorID=vprod.ProductorID
	group by prod.nombre
go
select * from v_SaldosProveedoresProductores 

