use MyFirstWeb;
create database MyFirstWeb;
drop table user;
drop table if exists M_member;
create table M_member (
	user_id varchar(20) primary key,
    user_pw varchar(20) not null,
    user_name varchar(12) not null,
    user_email varchar(50) not null,
    user_reg_date datetime default current_timestamp
);

use myfirstweb;
select * from M_member;
desc M_member;

insert into m_member (user_id, user_pw, user_name, user_email) 
values('mong1234', 'aaa1234!', '김다솔', 'mong@naver.com'); 


drop table if exists board;
create table board (
	board_id INT PRIMARY KEY AUTO_INCREMENT,
    board_name VARCHAR(30) NOT NULL,
    board_title VARCHAR(60) NOT NUll,
    board_content VARCHAR(300),
    board_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    board_hit INT DEFAULT 0
);

INSERT INTO board(board_name, board_title, board_content) VALUES ('김다몽', '테스트용 게시물입니다.', '가나다라마바사아자차카타파하');
INSERT INTO board(board_name, board_title, board_content) VALUES ('이승재', '테스트용 게시물입니다.', '가나다라마바사아자차카타파하');
INSERT INTO board(board_name, board_title, board_content) VALUES ('김다솔', '테스트용 게시물입니다.', '가나다라마바사아자차카타파하');
INSERT INTO board(board_name, board_title, board_content) VALUES ('김몽쉘', '테스트용 게시물입니다.', '가나다라마바사아자차카타파하');
INSERT INTO board(board_name, board_title, board_content) VALUES ('김다몽', '테스트용 게시물입니다.', '가나다라마바사아자차카타파하');
INSERT INTO board(board_name, board_title, board_content) VALUES ('김다몽', '테스트용 게시물입니다.', '가나다라마바사아자차카타파하');
INSERT INTO board(board_name, board_title, board_content) VALUES ('이승재', '테스트용 게시물입니다.', '가나다라마바사아자차카타파하');
INSERT INTO board(board_name, board_title, board_content) VALUES ('김다솔', '테스트용 게시물입니다.', '가나다라마바사아자차카타파하');
INSERT INTO board(board_name, board_title, board_content) VALUES ('김몽쉘', '테스트용 게시물입니다.', '가나다라마바사아자차카타파하');
INSERT INTO board(board_name, board_title, board_content) VALUES ('김다몽', '테스트용 게시물입니다.', '가나다라마바사아자차카타파하');

