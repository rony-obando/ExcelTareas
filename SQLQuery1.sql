Create Procedure Recaudacion @anio int
as
select distinct YEAR(OrderDate) as año,MONTH(OrderDate) as mes,MAX(UnitPrice*od.Quantity-(UnitPrice*od.Quantity*od.Discount)) as Recaudacion,
e.EmployeeID,FirstName
from [Order Details] od inner join
Orders o on od.OrderID = o.OrderID
inner join Employees e on o.EmployeeID = e.EmployeeID
group by OrderDate,e.EmployeeID,FirstName
having YEAR(OrderDate) = @anio
order by FirstName

Exec Recaudacion 1996
Drop Procedure Recaudacion