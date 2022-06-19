create table Class(
class_id int not null primary key auto_increment,
class_name varchar(60) not null,
startdate datetime not null,
status Bit
);

create table Student(
student_id int not null primary key auto_increment,
student_name varchar(30) not null,
address varchar (50),
phone varchar (20),
Status Bit,
class_id int not null,
foreign key (class_id) references Class (class_id) 
);

create table Subject(
sub_id int not null primary key auto_increment,
sub_name varchar(30) not null,
credit tinyint not null default 1 check(credit >=1),
status bit default 1
);

create table Mar(
mark_id int not null primary key auto_increment,
sub_id int not null unique,
student_id int not null unique,
mark float default 0 check (mark between 0 and 100),
foreign key (sub_id) references Subject (sub_id),
foreign key (student_id) references Student (student_id)
);