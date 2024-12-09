CREATE DATABASE AS_Management; -- DB AS_Management생성
DROP DATABASE AS_Management; -- (if DATABASE 잘못 생성 시 삭제용)
USE AS_Management; -- AS_Management DB사용
CREATE TABLE customer -- customer 고객 테이블 생성
( RNUM          int auto_increment primary key, -- 고객 접수번호 (자동생성)
  RDATE 		DATETIME DEFAULT CURRENT_TIMESTAMP, -- 고객접수일자
  CNAME			varchar(10) NOT NULL, -- 고객 이름
  CPHONE		varchar(20) NOT NULL, -- 고객 휴대전화번호
  ADDRESS		varchar(50) NOT NULL, -- 고객 주소
  CATEGORY      varchar(10) NOT NULL, -- 제품 분류
  MODEL         varchar(30), -- 보일러 모델명
  ISSUE         varchar(10), -- 고장 증상
  DETAIL        varchar(100), -- 내용
  VISITDATE	    datetime NOT NULL,-- AS방문일자 
  PINFORMATION  BOOLEAN NOT NULL DEFAULT FALSE -- 개인정보동의 여부 (기본값: 비동의)
);
select * from customer; -- customer 테이블 생성확인용
DESCRIBE customer; -- 테이블 구조 확인
-- DROP TABLE customer; -- (if 잘못 테이블 생성 시 삭제용)

DELETE FROM customer
WHERE CNAME = '도천수';

INSERT INTO customer (RDATE, CNAME, CPHONE, ADDRESS, CATEGORY, MODEL, ISSUE, DETAIL, VISITDATE, PINFORMATION)
VALUES('2024-12-05 10:00', '김아름', '010-1234-5678', '울산 남구 삼산동 그린컴퓨터아카데미 4F', '가스보일러', 'NCB353','전원 고장','전원을 눌러도 보일러가 안켜짐','2024-12-17 12:00', 1);
INSERT INTO customer (RDATE, CNAME, CPHONE, ADDRESS, CATEGORY, MODEL, ISSUE, DETAIL, VISITDATE, PINFORMATION)
VALUES('2024-12-06 11:00', '양정훈', '010-1234-6789', '울산 동구 방어진 회센터1F','가스보일러','NCB552','온수 고장', '온수 작동이 안됩니다.','2024-12-18 14:00', 1);
INSERT INTO customer (RDATE, CNAME, CPHONE, ADDRESS, CATEGORY, MODEL, ISSUE, DETAIL, VISITDATE, PINFORMATION)
VALUES('2024-12-07 09:00', '도천수', '010-2589-1234', '울산 동구 성끝길 2', '기름보일러','NCB562','그 외', '온수 누수가 발생합니다.', '2024.12.20 16:00',1);
INSERT INTO customer (RDATE, CNAME, CPHONE, ADDRESS, CATEGORY, MODEL, ISSUE, DETAIL, VISITDATE, PINFORMATION)
VALUES('2024-12-10 13:00', '정경훈', '010-9874-1256', '울산 동구 화정동 12번지','가스보일러','RC600', '전원 고장', '전원버튼을 눌러도 작동이 안됩니다.','2024.12.11 09:00', 1);
INSERT INTO customer (RDATE, CNAME, CPHONE, ADDRESS, CATEGORY, MODEL, ISSUE, DETAIL, VISITDATE, PINFORMATION)
VALUES('2024-12-20 14:00', '신채아', '010-8791-1234', '울산 북구 산성로 16 효문동','그 외', 'ECO','그 외', '누수발생합니다.','2024.12.22 10:00',1);
select * from customer; -- customer 테이블 입력 결과 확인용

ALTER TABLE customer
ADD COLUMN VISITDATE_END DATETIME NOT NULL DEFAULT NOW();
UPDATE customer
SET VISITDATE_END = DATE_ADD(VISITDATE, INTERVAL 1 HOUR);
DELIMITER //
CREATE TRIGGER set_VISITDATE_END BEFORE INSERT ON customer
FOR EACH ROW
BEGIN
    -- end_time을 start_time에서 1시간 더한 값으로 설정
    SET NEW.VISITDATE_END = DATE_ADD(NEW.VISITDATE, INTERVAL 1 HOUR);
END//
DELIMITER ;

select * from customer; -- customer 테이블 생성확인용

CREATE TABLE employee -- employee AS직원 테이블 생성
( ENAME 		varchar(10) NOT NULL, -- AS기사 이름
  EPHONE		varchar(20) NOT NULL -- AS기사 휴대전화번호
);
select * from employee; -- customer 테이블 생성확인용
DESCRIBE employee; -- 테이블 구조 확인
-- DROP TABLE employee;  -- (if 잘못 테이블 생성 시 삭제용)

INSERT INTO employee (ENAME, EPHONE)
VALUES('임영웅', '010-1111-8282');

select * from employee; -- customer 테이블 생성확인용