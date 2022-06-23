create database TicketFilm;
use TicketFilm;
create table tblphong(
id_phong int primary key auto_increment,
ten_phong varchar (50),
trangthai varchar (50)
);

create table ghe(
id_ghe int primary key auto_increment,
id_phong int,
soghe int,
foreign key (id_phong) references tblphong (id_phong)
);

create table tblphim(
id_phim int primary key auto_increment,
ten_phim varchar (50),
loai_phim varchar (50),
thoigian datetime
);

create table tblve(
id_phim int,
id_ghe int,
ngaychieu date,
trangthai varchar (50),
primary key (id_phim,id_ghe),
foreign key (id_phim) references tblphim (id_phim),
foreign key (id_ghe) references ghe (id_ghe)
);


select * from tblphim order by thoigian;

select tblphim.ten_phim,max(thoigian) from tblphim ;

select tblphim.ten_phim from tblphim where thoigian = (select min(thoigian) from tblphim);

select * from ghe where soghe like ('a%');

alter table tblphong modify column trangthai nvarchar(25);

update tblphong set trangthai = if(trangthai = 0 ,'đang sửa',if(trangthai = 1,'đang sử dụng','Unknow')) where tblphong.id_phong > 0;

select ten_phim from tblphim where length(ten_phim)>15 and length(ten_phim)<25 ;

select concat(tblphong.ten_phong,' ',tblphong.trangthai) as 'Trạng thái phòng chiếu'
 from tblphong ;
 
 create table tblrank(
 stt int,
 ten_phim varchar (50),
 thoigian int
 );
 insert into tblrank (ten_phim,thoigian) select ten_phim,thoigian from tblphim order by ten_phim;
 
 alter table tblphim add column mo_ta nvarchar(255) not null;
 
 update tblphim set mo_ta = concat('đây là loại bộ phim thể loại ',tblphim.loai_phim ) where id_phim > 0;
 
 select * from tblphim;
 
 update tblphim set mo_ta = concat('đây là loại film thể loại ',tblphim.loai_phim ) where id_phim > 0;
 
 alter table ghe drop constraint ghe_ibfk_1;
 alter table tblve drop constraint tblve_ibfk_1 , drop constraint tblve_ibfk_2;
 
delete from ghe where id_ghe >0;

select now() as 'thời gian hiện tại';
 
 


