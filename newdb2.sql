create table departments(
    dep_id number primary key,
    dep_name varchar2(10),
    loc varchar2(10)
);


create table employees(
    emp_id number primary key,
    emp_name varchar2(10),
    emp_job varchar2(10),
    mgr number,
    hire_date DATE DEFAULT SYSDATE,
    sal number,
    commi number,
    dep_id number
        constraint dep_emp_fk references departments(dep_id)
    );
desc employees;
select * from employees;

----------------------------------------------

create table Professor(
    ssn VARCHAR2(50) PRIMARY KEY,
    prof_name VARCHAR2(50),
    prof_age VARCHAR2(50),
    prof_rank VARCHAR2(50),
    prof_speciality VARCHAR2(50)
);

create table Dept(
    dno NUMBER PRIMARY KEY,
    ssn VARCHAR2(50)
        CONSTRAINT Professor_Dept_FK REFERENCES Professor(ssn),
    dept_dname VARCHAR2(50),
    dept_office VARCHAR2(50)
);


create table Projects(
    pid NUMBER PRIMARY KEY,
    ssn VARCHAR2(50)
        CONSTRAINT Professor_Projects_FK REFERENCES Professor(ssn),
    proj_sponsor VARCHAR2(50),
    start_date DATE,
    end_date DATE,
    proj_budget VARCHAR2(50)
);


create table WorkIn(
    workin_id NUMBER PRIMARY KEY,
    ssn VARCHAR2(50)
        CONSTRAINT Professor_WorkIn_FK REFERENCES Professor(ssn),
    pid NUMBER
        CONSTRAINT Projects_WorkIn_FK REFERENCES Projects(pid)
);

create table Workprog(
    workpr_id NUMBER PRIMARY KEY,
    ssn VARCHAR2(50)
        CONSTRAINT Graduate_WorkProg_FK REFERENCES Graduate(ssn),
    pid NUMBER
        CONSTRAINT Projects_WorkProg_FK REFERENCES Projects(pid)
);

create table WorkDept(
    workdep_id NUMBER PRIMARY KEY,
    ssn VARCHAR2(50)
        CONSTRAINT Professor_WorkDept_FK REFERENCES Professor(ssn),
    dno NUMBER
        CONSTRAINT Dept_WorkDept_FK REFERENCES Dept(dno),
    pct_time DATE
);


create table Graduate(
    ssn VARCHAR2(50) PRIMARY KEY,
    dno NUMBER
        CONSTRAINT Dept_Graduate_fk REFERENCES Dept(dno),
    grad_name VARCHAR2(50),
    grad_age NUMBER,
    deg_prog VARCHAR2(50),
    grad_graduatessn VARCHAR2(50)
        CONSTRAINT Graduate_Gradutate_FK REFERENCES Graduate(ssn)
);

----------------------------------------------------

drop table imported_book;
drop table orders;
drop table customers;
drop table books;
drop table publishers;



CREATE TABLE publishers(
    pub_id NUMBER PRIMARY KEY,
    pub_name VARCHAR2(50),
    mar_name VARCHAR2(50),
    phone VARCHAR2(50)
    );
CREATE TABLE books(
    book_id NUMBER PRIMARY KEY,
    book_title VARCHAR2(50),
    price NUMBER,
    pub_id NUMBER
        CONSTRAINT pub_book_fk REFERENCES publishers(pub_id)
    );
CREATE TABLE customers(
    cust_id NUMBER PRIMARY KEY,
    cust_name VARCHAR2(50),
    address VARCHAR2(50),
    phone VARCHAR2(50)
    );
CREATE TABLE orders(
    order_id NUMBER PRIMARY KEY,
    cust_id NUMBER CONSTRAINT cust_ord_kf REFERENCES customers(cust_id),
    book_id NUMBER CONSTRAINT book_ord_kf REFERENCES books(book_id),
    order_price NUMBER,
    order_date DATE DEFAULT SYSDATE  
    );
    

insert into publishers values(1,'굿스포츠', '김구', '010-1111-1111');
insert into publishers values(2,'나무수', '윤봉길', '010-1222-2211');
insert into publishers values(3,'대한미디어', '유관순', '010-3322-2211');
insert into publishers values(4,'이상미디어', '이상', '010-5522-5211');
insert into publishers values(5,'삼성당', '이봉창', '010-5772-5211');
insert into publishers values(6,'Person', 'James', '010-5788-5211');

insert into books values(1,'축구의 역사',  7000, 1);
insert into books values(2,'축구 아는 여자',13000,2);
INSERT into books values(3, '축구의 이해', 22000, 3);
insert into books values(4, '골프 바이블',  22000, 3);
INSERT INTO Books VALUES(5, '피겨 교본', 8000, 1);
insert into Books VALUES (6, '역도 단계별기술', 8000, 1);
insert into books values(7, '야구의 추억', 13000, 4);
INSERT INTO books VALUES(8, '야구를 부탁해', 13000, 4);
insert into books values(9, '올림픽 이야기',7500, 5);
INSERT INTO books VALUES(10, 'Olympic Champions', 13000,6);

INSERT into customers values(1, '박시성', '영국 맨체스터', '000-5000-0001');
insert into customers values(2,'김연아','대한민국 서울','000-6000-0001');
INSERT into customers values(3, '장미란', '대한민국 강원도', '000-7000-0001');
insert into customers values(4, '추신수', '미국 클리블랜드', '000-5000-0001');
INSERT INTO customers VALUES(5, '박세리', '대한민국 대전', NULL);

inSErt into orders values(1, 1, 1, 6000, TO_DATE('2020-07-01','yyyy-mm-dd'));
insert into orders values (2,1,3,21000,to_date('2020-07-03','yyyy-mm-dd'));
INSERT into orders values(3, 2, 5, 8000, to_date('2020-07-03', 'yyyy-mm-dd'));
insert into orders values(4, 3, 6, 6000, TO_DATE('2020-07-04', 'yyyy-mm-dd'));
INSERT INTO Orders VALUES(5, 4, 7, 20000, TO_DATE('2020-07-05', 'yyyy-mm-dd'));
INSERT INTO orders VALUES(6, 1, 2, 12000, TO_DATE('2020-07-07', 'yyyy-mm-dd'));
insert into orders values(7,4,8,13000, TO_DATE('2020-07-07','yyyy-mm-dd'));
INSERT INTO orders VALUES(8, 3, 10,  12000, TO_DATE('2020-07-09','yyyy-mm-dd'));
insert into orders values(9, 2, 10, 7000, to_date('2020-07-10', 'yyyy-mm-dd'));
insert into orders values(10, 3, 8, 13000, to_date('2020-07-10', 'yyyy-mm-dd'));

create table imported_Book (
    bookid NUMBER PRIMARY KEY,
    bookname VARCHAR2(50),
    publisher VARCHAR2(50),
    price NUMBER(8)
);

insert into imported_book values(21, 'Zen Golf', 'Person', 12000);
insert into imported_book values(22, 'Soccer Skills', 'Human Kinetics', 15000);

select * from tab;