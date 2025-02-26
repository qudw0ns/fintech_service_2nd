CREATE database sampleDB;
DROP database sampleDB;
SHOW databases;
create database sampleDB;
use sampledb;
create table customers(id int, name varchar(100), sex varchar(20), phone varchar(20), adress varchar(255));
DROP table customers;
create database maket_db;
use maket_db;
CREATE table hongong1 (toy_id int, toy_name char(4), age int);
SHOW TABLES;
DESC hongong1;
insert into hongong1(toy_id, toy_name, age) values(1, "우디", 25);
select * from hongong1;
insert into hongong1(toy_id, toy_name) values(2, "버즈");
select * from hongong1;
insert into hongong1(toy_name, age, toy_id) values("제시", 20, 3);
insert into hongong1 values(5, "포테이토", 40);
insert into hongong1 values(6, "강아지", null);
use maket_db;
create table hongong2(
	toy_id int AUTO_INCREMENT PRIMARY KEY,
    toy_name char(4),
    age int);

desc hongong2;
insert into hongong2 values (null, "보핍", 25);
select * from hongong2;
insert into hongong2 values (null, "렉스", 21);
select * from hongong2;
alter table hongong2 add country varchar(100);
select * from hongong2;
update hongong2 set country="미국" where toy_id=1;
select * from hongong2;
update hongong2 set age=30 where toy_id=1;
truncate table hongong2;
select * from hongong1;
delete from hongong1 where toy_id=2;
alter table hongong1 add idx int primary key auto_increment;
delete from hongong1 where idx=2;
select * from hongong1;
insert into hongong1 values(7, "렉스", 30, null);
delete from hongong1 where idx=7;
create table 회원테이블(id int PRIMARY KEY, member_id varchar(10), name varchar(10), adress varchar(25));
insert into 회원테이블 values (1, "tess", "나훈아", "경기 부천시 중동");
insert into 회원테이블 values (2, "hero", "임영웅", "서울 은평구 증산동");
insert into 회원테이블 values (3, "iyou", "아이유", "인천 남구 주안동");
insert into 회원테이블 values (4, "jyp", "박진영", "경기 고양시 장항동");
select * from 회원테이블;
create table 제품테이블_product(제품이름 varchar(20) PRIMARY KEY, 가격 varchar(10), 제조일자 varchar(30), 제조회사 varchar(25), 남은수량 varchar(20));
insert into 제품테이블_product values ("바나나", "1500", "2024-07-01", "델몬트", "17");
insert into 제품테이블_product values ("카스", "2500", "2023-12-12", "ob", "3");
insert into 제품테이블_product values ("삼각김밥", "1000", "2025-02-26", "CJ", "22");
select * from 제품테이블_product;

# 제품테이블에 prod_id 컬럼을 추가하고 Auto_increment, Primary Key를 추가하세요.
select * from 제품테이블_product;
alter table 제품테이블_product add prod_id int;
create database mywork;
use mywork;
create table emp_test(emp_no int not null, emp_name varchar(30) not null, hire_date date null, salary int null, primary key(emp_no));
desc emp_test;
insert into emp_test(emp_no, emp_name, hire_date, salary)  values(1005, "퀴리", "2021-03-01", 4000), (1006, "호킹", "2021-03-05", 5000), (1007, "페러데이", "2021-04-01", 2200), (1008, "맥스웰", "2021-04-04", 3300), (1009, "플랑크", "2021-04-05", 4400);
select * from emp_test;

update emp_test set salary=10000 where emp_no=1006;
update emp_test set hire_date="2023-07-11" where emp_no=1007;
delete from emp_test where emp_no=1009;
select * from emp_test;
create table emp_tran1 as select * from emp_test;
DESC emp_test;
DESC emp_tran1;
alter table emp_tran1 add constraint primary key(emp_no);
drop table emp_tran1;
rollback;
select * from emp_test;
insert into emp_test values(1010, "플랑크2", "2024-04-05", 5000);
commit;
rollback;












