use test0228;
insert into department values(1, "수학");
insert into department values(2, "국문학");
insert into department values(3, "정보통신공학");
insert into department values(4, "모바일공학");
insert into student values(1, "가길동", 177, 1);
insert into student values(2, "나길동", 178, 1);
insert into student values(3, "다길동", 179, 1);
insert into student values(4, "라길동", 180, 2);
insert into student values(5, "마길동", 170, 2);
insert into student values(6, "바길동", 172, 3);
insert into student values(7, "사길동", 166, 4);
insert into student values(8, "아길동", 192, 4);
insert into professor values(1, "가교수", 1);
insert into professor values(2, "나교수", 2);
insert into professor values(3, "다교수", 3);
insert into professor values(4, "빌게이츠", 4);
insert into professor values(5, "스티브잡스", 3);
insert into course values (1, "교양영어", 1, "2016/9/2", "2016/11/30");
insert into course values (2, "데이터베이스 입문", 3, "2016/8/20", "2016/10/30");
insert into course values (3, "회로이론", 2, "2016/10/20", "2016/12/30");
insert into course values (4, "공업수학", 4, "2016/11/2", "2017/1/28");
insert into course values (5, "객체지향프로그래밍", 3, "2016/11/1", "2017/1/30");
insert into student_course values (1, 1);
insert into student_course values (2, 1);
insert into student_course values (3, 2);
insert into student_course values (4, 3);
insert into student_course values (5, 4);
insert into student_course values (6, 5);
insert into student_course values (7, 5);
select * from student;

# 문제1
select student_id, student_name, height, student.department_id, department_name from student left join department on student.department_id = department.department_id;

# 문제2
select professor_id, department_id from professor where professor_name="가교수";

# 문제3
select department.department_id, department_name, count(professor_id) from department inner join professor on department.department_id=professor.department_id group by department_name;

# 문제4
select student_id, student_name, height, student.department_id, department_name from student left join department on student.department_id = department.department_id where department_name="정보통신공학";

# 문제5
select professor_id, professor_name, professor.department_id, department_name from professor left join department on professor.department_id = department.department_id where department_name="정보통신공학";

# 문제6
select student_name, department_name from student left join department on student.department_id = department.department_id where student_name like "아%";

# 문제7
select count(height) from student where height between 180 and 190;

# 문제8
select department_name, max(height), round(avg(height)) from department d left join student s on d.department_id = s.department_id group by department_name;

# 문제9
select student_name from department d left join student s on d.department_id = s.department_id where s.department_id=1;
# 서브쿼리 1개의 sql 문장 안에 select가 2개 이상
select student_name from student where department_id=(select department_id from student where student_name="다길동");

# 문제10
select student_name, course_name from student s left join student_course sc on s.student_id = sc.student_id left join course on sc.course_id = course.course_id where start_date like "2016/11%";

# 문제 11
select student_name from student s left join student_course sc on s.student_id = sc.student_id left join course on sc.course_id = course.course_id where course_name = "데이터베이스 입문";

# 문제 12
select count(student_name) from student s left join student_course sc on s.student_id = sc.student_id left join course on sc.course_id = course.course_id left join professor on course.professor_id = professor.professor_id where professor_name="빌게이츠";
# 서브쿼리
select course_id from professor p left join course c on p.professor_id=c.professor_id where professor_name="빌게이츠"; #course_id=4
select count(*) from student s left join student_course sc on s.student_id=sc.student_id where course_id=(select course_id from professor p left join course c on p.professor_id=c.professor_id where professor_name="빌게이츠");


