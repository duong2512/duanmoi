create table subjects(
subjects_id int primary key,
subjects_name varchar (50)
);

create table student(
student_id int primary key,
student_name varchar(50),
age int,
email varchar (100)
); 

create table mark(
mark int,
student_id int,
subjects_id int,
foreign key (student_id) references student (student_id),
foreign key (subjects_id) references subjects (subjects_id)
);

create table classes(
class_id int primary key,
class_name varchar(50)
);

create table classstudent(
student_id int,
class_id int ,
foreign key (student_id) references student (student_id),
foreign key (class_id) references classes (class_id)
);

insert into student values (1,'nguyen quang an',18,'an@yahoo.com');
insert into student values (2,'nguyen cong vinh',20,'vinh@gmail.com');
insert into student values (3,'nguyen van quyen',19,'quyen');
insert into student values (4,'pham thanh binh',25,'binh@com');
insert into student values (5,'nguyen van tai em',30,'taiem@sport.vn');

insert into classes values (1,'c0706l');
insert into classes values (2,'c0708g');

insert into classstudent values (1,1);
insert into classstudent values (2,1);
insert into classstudent values (3,2);
insert into classstudent values (4,2);
insert into classstudent values (5,2);

insert into subjects values (1,'sqp');
insert into subjects values (2,'java');
insert into subjects values (3,'c');
insert into subjects values (4,'visual basic');

insert into mark values (8,1,1);
insert into mark values (4,1,2);
insert into mark values (9,1,1);
insert into mark values (7,3,1);
insert into mark values (3,4,1);
insert into mark values (5,5,2);
insert into mark values (8,3,3);
insert into mark values (1,5,3);
insert into mark values (3,4,2);

select * from student;
select * from subjects; 
select avg (mark) from mark;
select  subjects_name from Subjects where subjects_id = (select subjects_id from mark where mark = (select max(mark) from mark ));
alter table subjects modify column subjects_name varchar (255) not null ;
--  update subjects set subjects_name = 'day la mon hoc'+subjects.subjects_name;
alter table student add constraint check (age > 15 and age < 50);
alter table classstudent drop constraint classstudent_ibfk_1;
alter table classstudent drop constraint classstudent_ibfk_2;
alter table mark drop constraint mark_ibfk_1 , drop constraint mark_ibfk_2;






