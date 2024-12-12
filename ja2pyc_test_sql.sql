USE as_management;

DESC customer;
SELECT * FROM customer;

-- DELETE FROM customer WHERE rnum=59 LIMIT 10;

ALTER TABLE customer
ADD COLUMN PROCESS_STATUS VARCHAR(20);

alter table customer
	ADD COLUMN empno VARCHAR(8);

alter table customer
      add constraint key_empno foreign key (EMPNO) references employee(EMPNO);

DESCRIBE employee;
SELECT * FROM employee;

INSERT INTO employee (empno, id, ename, ephone, job, hiredate, deptno) VALUES ('00000003', 'test3333', '허도혁', '010-1234-5678', 'AS기사', '2024-09-02 12:05:00', '55555555');
INSERT INTO employee (empno, id, ename, ephone, job, hiredate, deptno) VALUES ('00000004', 'test4444', '오범우', '010-2345-6789', 'AS기사', '2024-09-05 15:21:00', '55555555');
INSERT INTO employee (empno, id, ename, ephone, job, hiredate, deptno) VALUES ('00000005', 'test5555', '장광수', '010-3456-7890', 'AS기사', '2024-09-07 11:31:00', '55555555');
INSERT INTO employee (empno, id, ename, ephone, job, hiredate, deptno) VALUES ('00000006', 'test6666', '손기환', '010-4567-8901', 'AS기사', '2024-09-11 10:11:00', '55555555');

-- DELETE FROM employee WHERE empno=3 LIMIT 1;
SELECT * FROM board;

DELETE FROM board WHERE bnum>=76 LIMIT 5;