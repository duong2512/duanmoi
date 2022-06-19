create table HocSinh(
MaHs varchar (45) primary key,
name varchar (45) ,
ngaySinh datetime,
lop varchar (45) ,
gt varchar (45)
);

create table MonHoc(
MaMH varchar (45) primary key,
tenMH varchar (45) ,
MaGV varchar (45) 
);

create table BangDiem(
MaHs varchar (45),
MaMH varchar (45),
diemThi int ,
ngayKT datetime,
primary key (MaHs,MaMH),
foreign key (MaHs) references HocSinh (MaHs),
foreign key (MaMH) references MonHoc (MaMH)
);

create table GiaoVien(
MaGV varchar (20) primary key ,
TenGV varchar (45) ,
SDT varchar (10) 
);

drop table GiaoVien,BangDiem,MonHoc,HocSinh;

alter table MonHoc add MaGV varchar(20);
alter table MonHoc add constraint fk_Magv foreign key (MaGV) references GiaoVien(MaGv);