create database SaleManager;
use SaleManager;
create table Customer
(
    cId  int primary key auto_increment,
    name varchar(25),
    cAge tinyint
);

create table Orde
(
    oId         int primary key auto_increment,
    cId         int  not null,
    foreign key (cId) references customer (cId),
    oDate       date not null,
    oTotalPrice int
);

create table Product
(
    pId    int primary key auto_increment,
    pName  varchar(24) not null,
    pPrice int         not null
);

create table OrderDetail
(
    oId   int not null,
    foreign key (oId) references Orde (oId),
    pId   int not null,
    foreign key (pId) references Product (pId),
    odQty int not null
);

# thêm dữ liệu customer
insert into customer (name, cAge) VALUE ('Minh Quan', 10),
    ('Ngoc Anh', 20),
    ('Hong Ha', 50);

# thêm dữ liệu Order
INSERT INTO salemanager.orde (cId, oDate, oTotalPrice)
VALUES (1, '2006-03-21', null),
       (2, '2006-03-23', null),
       (1, '2006-03-16', null);

# thêm dữ liệu Product
insert into product (pName, pPrice)
    VALUE ('May Giat', 3),
    ('Tu Lanh', 5),
    ('Dieu Hoa', 7),
    ('Quat', 1),
    ('Bep Dien', 2);

# thêm dữ liệu orderTail
INSERT INTO salemanager.orderdetail (oId, pId, odQty)
VALUES (1, 1, 3);
INSERT INTO salemanager.orderdetail (oId, pId, odQty)
VALUES (1, 3, 7);
INSERT INTO salemanager.orderdetail (oId, pId, odQty)
VALUES (1, 4, 2);
INSERT INTO salemanager.orderdetail (oId, pId, odQty)
VALUES (2, 1, 1);
INSERT INTO salemanager.orderdetail (oId, pId, odQty)
VALUES (3, 1, 8);
INSERT INTO salemanager.orderdetail (oId, pId, odQty)
VALUES (2, 5, 4);
INSERT INTO salemanager.orderdetail (oId, pId, odQty)
VALUES (2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select * from SaleManager.orde;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select oId as order_number,name from customer join Orde O on Customer.cId = O.cId group by name;
select p.pId,pName from product p join OrderDetail OD on p.pId = OD.pId join Orde O on O.oId = OD.oId group by pName;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select oId as order_number,name from customer left join orde o on Customer.cId = o.cId where o.oId IS NULL group by name;
where c.cid not in (select cid
					from oder);
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.oId,od.oDate,o.odQty*p.pPrice as 'giá hóa đơn' from orderdetail o join Orde od on o.oId = od.oId join product p on o.pId = p.pId;
