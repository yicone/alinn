-------test
create table students
(
stuid int  identity (1,1),
name varchar(20),
sex varchar(20),
score int
)
insert into students(name,sex,score)
values('111','1',99)
insert into students(name,sex,score)
values('222','2',100)
insert into students(name,sex,score)
values('333','1',100)
insert into students(name,sex,score)
values('444','2',99)

select top 2 name,max(score) from students group by sex ,name
select top 2 name,max(score) from students group by sex,name

select top 2 name,max(score) from  students group by sex ,name


create table #tmp 
(
	stuid int,
    name varchar(10),
    sex  varchar(6),
    score int 
)
insert into #tmp values(1,'张三','男',99)
insert into #tmp values(2,'李四','女',100)
insert into #tmp values(3,'王五','男',100)
insert into #tmp values(4,'赵六','女',99)
  select top 2 name,max(score) from  #tmp group by sex ,name