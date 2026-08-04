use july2026


create table Product (PID int primary key, Pname varchar(30), City varchar(30), Quantity int, Sales_unit int)

insert into Product values 
(101,'Laptop','Vadodara',20,10),
(102,'Iphone','Ahmedabad',15,20),
(103,'Purse','Mumbai',30,45),
(104,'Bag','Vadodara',25,5),
(105,'Lipstick','Surat',15,40),
(106,'Lip gloss','Ahmedabad',35,50),
(107,'Chocolate','Vadodara',35,15),
(108,'Candy','Mumbai',55,20),
(109,'Pen','Surat',20,70),
(110,'Earring','Pune',70,65)


--1. Find all products that have a Quantity greater than the average quantity of all products.

select * from Product P where Quantity > (select avg(quantity) from Product)


--2. Display the ProductName of products sold in the same city as 'Laptop'.

select pname from Product where City = (select City from Product where Pname = 'Laptop')


--3. Find the details of the products with the maximum Quantity.

select * from Product where Quantity = (select max(quantity) from Product)


--4. List products whose salesUnit is higher than the salesUnit of ProductID 5.

select * from Product where Sales_unit > (select Sales_unit from Product where PID = 105)


--5. Find products that have a lower Quantity than the minimum Quantity found in 'Vadodara'.

select * from Product where Quantity < (select min(quantity) from Product where City = 'Vadodara')


--6. Display products whose salesUnit is greater than the average salesUnit of products in 'Mumbai'.

select * from Product where Sales_unit > (select avg(sales_unit) from Product where City = 'Mumbai')


--7. Find the product name with the lowest salesUnit.

select Pname from Product where Sales_unit = (select min(sales_unit) from Product)


--8. List all products sold in cities that have more than 50 total Quantity across all their products.

select * from Product where city in (select City from Product group by City having sum(quantity) > 50)


--9. Show products whose Quantity is exactly equal to the salesUnit of 'Smartphone'.

select * from Product where Quantity = (select Sales_unit from Product where Pname = 'Iphone')


--10. Find the city which has the product with the highest salesUnit.

select city from Product where Sales_unit = (select max(sales_unit) from Product)


--11. Find all products sold in cities where at least one product has a Quantity of zero.

select * from Product where Pname in (select City from Product where Quantity = 0)


--12. List products whose salesUnit is greater than the salesUnit of all products in 'Surat'.

select * from Product where Sales_unit > all (select Sales_unit from Product where City = 'Surat')


--13. Find products that belong to cities where the average salesUnit is greater than 10.

select * from Product where city in (select City from Product group by City having avg(sales_unit) > 10)


--14. Display products that have a Quantity greater than any product's Quantity in 'Pune'.

select * from Product where Quantity > any (select Quantity from Product where City = 'Pune')


--15. Find all products whose ProductName is the same as any product sold in 'Ahmedabad'.

select * from Product where Pname = any (select Pname from Product where City = 'Ahmedabad')


--16. Select products where the Quantity is greater than the average Quantity of their own city.

select * from Product where Quantity > (select avg(Quantity) from Product where City = Product.City)


--17. Find cities where the total salesUnit is higher than the total salesUnit of 'Vadodara'.

select city from Product group by city having sum(sales_unit) > (select sum(sales_unit) from Product where City = 'Vadodara')


--18. List products that are sold in the city that has the maximum variety (count) of products.

select * from Product where City = (select top 1 City from Product group by City order by count(*) desc)


--19. Find the second highest Quantity from the Product table using a subquery.

select max(quantity) as Second_highest_quantity from Product where Quantity < (select max(Quantity) from Product)


--20. Display the ProductName and a calculated column showing the difference between its Quantity and the global average Quantity.

select Pname,Quantity - (select avg(quantity) from product) as Difference from Product