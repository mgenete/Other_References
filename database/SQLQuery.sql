select * from demo.SalesOrderDetail
select * from demo.Product
select * from demo.ProductCategory

select *
into demo.Product
from Product.Product

select *
into demo.ProductCategory
from Product.ProductCategory

select a.ProductID, a.Name, sum(b.Total) as TotalSales, a.ProductCategoryID
from demo.Product a
inner join demo.SalesOrderDetail b
on a.ProductID = b.ProductID
inner join demo.ProductCategory c
on a.ProductCategoryID = c.ProductCategoryID
group by a.ProductID, a.Name, a.ProductCategoryID

select a.ProductID, a.Name, sum(b.Total) as TotalSales
from demo.Product a
inner join demo.SalesOrderDetail b
on a.ProductID = b.ProductID
group by a.ProductID, a.Name
having sum(b.Total) >50 and sum(b.Total)<80


select a.ProductID, a.Name, sum(b.Total) as TotalSales
from demo.Product a
inner join demo.SalesOrderDetail b
on a.ProductID = b.ProductID
where a.ProductID in (1001,1002,1003)
group by a.ProductID, a.Name

select a.ProductID, a.Name, sum(b.Total) as TotalSales
from demo.Product a
inner join demo.SalesOrderDetail b
on a.ProductID = b.ProductID
where b.LastModifiedDate is null
group by a.ProductID, a.Name

select a.ProductID, a.Name, sum(b.Total) as TotalSales
from demo.Product a
inner join demo.SalesOrderDetail b
on a.ProductID = b.ProductID
where b.LastModifiedDate is null
group by a.ProductID, a.Name

select ProductID, Name
from demo.Product
where name like 'a%'

select SalesOrderID, ProductID, UnitPrice, Total
from demo.SalesOrderDetail
where UnitPrice between 5 and 6

select * from demo.Product
select * from demo.ProductCategory

select *
from demo.Product
cross join demo.ProductCategory
order by ProductID asc

select * 
from demo.Product b
left outer join demo.ProductCategory a
on a.ProductCategoryID = b.ProductCategoryID

create view
viewOne
as
select a.ProductID, a.Name, sum(b.Total) as TotalSales
from demo.Product a
inner join demo.SalesOrderDetail b
on a.ProductID = b.ProductID
where b.LastModifiedDate is null
group by a.ProductID, a.Name

select * from dbo.viewOne


select * from demo.ProductCategory
insert into demo.ProductCategory values (505,'New Papers',GETDATE())

select ProductCategoryID, Name
from demo.ProductCategory
--union
--union all
--intersect
except

select ProductCategoryID, Name
from Product.ProductCategory


select * from demo.SalesOrderDetail
select * from demo.Product
select * from demo.ProductCategory

create function getSalesData(@ProductID int)
returns table
as
return ( select * 
		from demo.SalesOrderDetail
		where ProductID = @ProductID
		)

select * from dbo.getSalesData(1001)