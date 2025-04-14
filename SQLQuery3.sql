use northwind
go
sp_help products;
drop table Categories;
create table Categories(CategoryID int primary key, CategoryName varchar(50), Description text);
insert into Categories(CategoryID) values(3),(4),(5),(6),(7),(8);

alter table products add constraint FK_Products_Categories123 foreign key (CategoryID) references Categories(CategoryID);
select * from Products;

alter table products
set foreign_key_checks = 0;

sp_help Categories;