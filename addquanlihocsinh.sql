use quanlisinhvien;
insert into class values(1,'a1','2008-12-20',1);
insert into class values(2,'a2','2008-12-22',1);
insert into class values(3,'a3',current_date(),0);

insert into student values (1,'hung','hanoi',0912113113,1,1);
insert into student values (2,'hoa','haiphong',0,1,1);
insert into student values (3,'manh','hcm',0123123123,0,2);

insert into subject values(1,'cf',5,1);
insert into subject values(2,'c',6,1);
insert into subject values(3,'hdj',5,1);
insert into subject values(4,'rdbms',10,1);

insert into mar(sub_id,student_id,mark,examtimes) values (1,1,8,1);
insert into mar(sub_id,student_id,mark,examtimes)  values (2,2,10,2);
insert into mar(sub_id,student_id,mark,examtimes)  values (3,3,12,1);