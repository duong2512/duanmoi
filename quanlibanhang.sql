create table customer(
cid int primary key,
cName varchar (50),
cage int
);

create table oder(
oid int primary key,
cid int,
odate date,
ototalprice float,
foreign key (cid) references customer (cid)
);

create table product(
pid int primary key,
pname varchar(50),
pprice float
);

create table oderdetail(
oid int,
pid int,
odQTY varchar(50),
primary key (oid,pid),
foreign key(oid) references oder (oid),
foreign key (pid) references product (pid)
);