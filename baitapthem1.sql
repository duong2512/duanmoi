create database quanlidiemthi1;

create table khoahoc(
makhoa int primary key ,
namekhoa varchar (10)
);

create table lop (
malop int primary key,
tenlop varchar (10),
makhoa int,
foreign key (makhoa) references khoahoc (makhoa)
);

create table monhoc(
mamonhoc int primary key,
namemonhoc varchar(10),
sotiet int
);



create table sinhvien(
masv int primary key,
hoten varchar (50),
ngaysinh date ,
hocbong varchar (50),
gioitinh varchar (10),
malop int,
foreign key (malop) references lop (malop)
);

create table ketqua(
diemthi int,
mamonhoc int,
masv int,
primary key (mamonhoc,masv),
foreign key (mamonhoc) references monhoc (mamonhoc),
foreign key (masv) references sinhvien (masv)
);

select * from sinhvien where sinhvien.hoten like 'Trần%';
select * from sinhvien where sinhvien.hocbong <> '' and sinhvien.gioitinh = 'nữ';
select * from sinhvien where sinhvien.hocbong <> '' or sinhvien.gioitinh = 'nữ';
select * from sinhvien where year(sinhvien.ngaysinh) between 1978 and 1985;
select * from sinhvien order by sinhvien.masv;
select * from sinhvien order by sinhvien.hocbong desc;
select * from sinhvien join lop on sinhvien.malop = lop.malop join khoahoc on lop.malop = khoahoc.makhoa where sinhvien.hocbong <> '' and khoahoc.namekhoa = 'cntt';
select sinhvien.malop,count(masv) from sinhvien join lop on sinhvien.malop = lop.malop group by sinhvien.malop;
select khoahoc.makhoa,count(masv) from sinhvien join lop on sinhvien.malop = lop.malop join khoahoc on lop.malop = khoahoc.makhoa group by khoahoc.makhoa;
select sinhvien.gioitinh,count(gioitinh) from sinhvien join lop on sinhvien.malop = lop.malop join khoahoc on lop.malop = khoahoc.makhoa where sinhvien.gioitinh = 'nữ' group by khoahoc.makhoa;
select lop.tenlop,sum(sinhvien.hocbong) from lop join sinhvien on lop.makhoa = sinhvien.malop group by lop.tenlop;
select khoahoc.namekhoa,sum(sinhvien.hocbong) from khoahoc join lop on khoahoc.makhoa = lop.makhoa join sinhvien on lop.malop = sinhvien.malop group by khoahoc.namekhoa;
select khoahoc.makhoa,khoahoc.namekhoa,count(sinhvien.masv) from khoahoc join lop on khoahoc.makhoa = lop.makhoa join sinhvien on lop.malop = sinhvien.malop group by khoahoc.namekhoa having count(sinhvien.masv) > 100;
select khoahoc.makhoa,khoahoc.namekhoa,count(sinhvien.masv) from khoahoc join lop on khoahoc.makhoa = lop.makhoa join sinhvien on lop.malop = sinhvien.malop where sinhvien.gioitinh = 'nữ' group by khoahoc.namekhoa having count(sinhvien.masv) > 50; 
select * from sinhvien where hocbong = (select max(hocbong) from sinhvien);
select sinhvien.masv,sinhvien.hoten,max(diemthi) from sinhvien join ketqua on sinhvien.masv = ketqua.masv join monhoc on ketqua.mamonhoc = monhoc.mamonhoc where monhoc.namemonhoc = 'toán';