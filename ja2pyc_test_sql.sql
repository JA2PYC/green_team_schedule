USE as_management;

DESC customer;
SELECT * FROM customer;

DELETE FROM customer WHERE cname='' LIMIT 10;

ALTER TABLE customer
ADD COLUMN PROCESS_STATUS VARCHAR(20);

alter table customer
	ADD COLUMN empno VARCHAR(8);

alter table customer
      add constraint key_empno foreign key (EMPNO) references employee(EMPNO);

DESCRIBE employee;
SELECT * FROM employee;

INSERT INTO employee (empno, id, ename, ephone, job, hiredate, deptno) VALUES ('00000003', 'test3333', '허도혁', '010-1234-5678', 'AS기사', '2024-09-02 12:05:00', '55555555');

-- DELETE FROM employee WHERE empno=3 LIMIT 1;
SELECT * FROM board;