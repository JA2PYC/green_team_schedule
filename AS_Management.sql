CREATE DATABASE AS_Management; -- DB AS_Management 생성

USE AS_Management; -- AS_scheduler DB사용
CREATE TABLE customer -- customer 고객 테이블 생성
( RNUM          int auto_increment primary key, -- 고객 접수번호 (자동생성)
  RDATE 		datetime NOT NULL, -- 고객접수일자
  CNAME			varchar(10) NOT NULL, -- 고객 이름
  CPHONE		varchar(20) NOT NULL, -- 고객 휴대전화번호
  ADDRESS		varchar(50) NOT NULL, -- 고객 주소
  CONTENT       varchar(100) NOT NULL, -- 내용
  VISITDATE	    datetime NOT NULL-- AS방문일자 
);
select * from customer; -- customer 테이블 생성확인용
DESCRIBE customer; -- 테이블 구조 확인
DROP TABLE customer; -- (if 잘못 테이블 생성 시 삭제용)

INSERT INTO customer (RDATE, CNAME, CPHONE, ADDRESS, CONTENT, VISITDATE)
VALUES('2024-12-05 10:00', '김아름', '010-1234-5678', '울산 남구 삼산동 그린컴퓨터아카데미 4F', '수리','2024-12-17 12:00');
INSERT INTO customer (RDATE, CNAME, CPHONE, ADDRESS, CONTENT, VISITDATE)
VALUES('2024-12-06 11:00', '양정훈', '010-1234-6789', '울산 동구 방어진 회센터1F','수리', '2024-12-18 14:00');
INSERT INTO customer (RDATE, CNAME, CPHONE, ADDRESS, CONTENT, VISITDATE)
VALUES('2024-12-07 09:00', '도천수', '010-2589-1234', '울산 동구 성끝길 2', '수리','2024.12.20 16:00');
INSERT INTO customer (RDATE, CNAME, CPHONE, ADDRESS, CONTENT, VISITDATE)
VALUES('2024-12-10 13:00', '정경훈', '010-9874-1256', '울산 동구 화정동 12번지','수리' '2024.12.11 09:00');
INSERT INTO customer (RDATE, CNAME, CPHONE, ADDRESS, CONTENT, VISITDATE)
VALUES('2024-12-20 14:00', '신채아', '010-8791-1234', '울산 북구 산성로 16 효문동','수리', '2024.12.22 10:00');
select * from customer; -- customer 테이블 입력 결과 확인용



CREATE TABLE employee -- employee AS직원 테이블 생성
( ENAME 		varchar(10) NOT NULL, -- AS기사 이름
  EPHONE		varchar(20) NOT NULL -- AS기사 휴대전화번호
);
select * from employee; -- customer 테이블 생성확인용
DESCRIBE employee; -- 테이블 구조 확인
-- DROP TABLE employee;  -- (if 잘못 테이블 생성 시 삭제용)

UPDATE customer -- 고객 테이블 수정(추가)
SET ENAME = '임영웅', EPHONE = '010-1111-2222'
WHERE RNUM = 1; -- 특정 접수번호에 기사 정보 추가
