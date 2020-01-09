drop database if exists BBS;
create database BBS;
use BBS;

-- 회원관리
drop table if exists user;
create table user (
	userID varchar(20),				 					-- ID
    userPassword varchar(20),							-- pw
    userName varchar(20),								-- 이름
    userGender varchar(20),								-- 성별
    userEmail varchar(50),								-- 이메일
    userEmailHash varchar(64),							-- 이메일해쉬코드
	userEmailChecked tinyint(1),						-- 이메일인증확인
	userCarModel varchar(20),							-- 제조사
    userCarName varchar(20),							-- 차량이름
    userCarType int,									-- 기름 타입
    userCarTotalKmNow double default 0,					-- 총주행거리-지금
    userCarTotalKmOld double default 0,					-- 총주행거리-이전
    userCarGasMoney double,								-- 주유비
    userCarDay varchar(20),								-- 차량관리일
    userCarMileage varchar(20),							-- 연비
    primary key(userID)
);

insert into user(userID,userPassword,userName,userGender,userEmail,userEmailHash,userEmailChecked) values('이승욱', '1234', '이승욱', '남자', 'mmdltmddnr@naver.com', 'b1c9e818f30718d1c2fdba98903574e7c4aec5416239aaf2cfee88740ef9c2ce', 1);

-- update user set userCarModel = '삼성_SM7', userCarType = 1500, userCarTotalKmOld = userCarTotalKmNow, 
-- userCarTotalKmNow = 4000,userCarGasMoney = 50000, userCarDay = curdate(), userCarMileage = (userCarTotalKmNow - userCarTotalKmOld)/(userCarGasMoney/userCarType) where userId like '이승욱';


-- 자유게시판
drop table if exists BBS;
create table BBS (
bbsID int,					-- 게시글번호
bbsTitle varchar(50),		-- 제목
userID varchar(20),			-- ID
bbsDate datetime,			-- 게시날짜
bbsContent varchar(2048),	-- 게시내용
bbsAvailable int,			-- 게시글공개,비공개(관리자가 보는 용도)
primary key(bbsID)
);

insert into bbs values(1, '차량관련 문제로 글을 올립니다.','이승욱','2019-12-8 10:42:00','연비가 얼마나 되어야 좋은 걸까요?',1,0);
insert into bbs values(2, '처음뵙겠습니다.','김다솔','2019-12-9 10:42:00','처음 글 올려봐요 잘 지냅시다.',1,0);
insert into bbs values(3, '이런 경우에는 어떻게 하면 좋을까요?','홍길동','2019-12-10 10:42:00','차에서 이상한 소리가 나네요.',1,0);
insert into bbs values(4, '제네시스 예비 차주 입니다.','손오공','2019-12-11 10:42:00','제네시스 색상 어떤 게 좋을 까요?',1,0);
insert into bbs values(5, '차량관련 문제로 글을 올립니다.','이승욱','2019-12-12 10:42:00','연비가 얼마나 되어야 좋은 걸까요?',1,0);
insert into bbs values(6, '처음뵙겠습니다.','김다솔','2019-12-13 10:42:00','처음 글 올려봐요 잘 지냅시다.',1,0);
insert into bbs values(7, '이런 경우에는 어떻게 하면 좋을까요?','홍길동','2019-12-14 10:42:00','차에서 이상한 소리가 나네요.',1,0);
insert into bbs values(8, '제네시스 예비 차주 입니다.','손오공','2019-12-15 10:42:00','제네시스 색상 어떤 게 좋을 까요?',1,0);
insert into bbs values(9, '차량관련 문제로 글을 올립니다.','이승욱','2019-12-16 10:42:00','연비가 얼마나 되어야 좋은 걸까요?',1,0);
insert into bbs values(10, '처음뵙겠습니다.','김다솔','2019-12-17 10:42:00','처음 글 올려봐요 잘 지냅시다.',1,0);
insert into bbs values(11, '이런 경우에는 어떻게 하면 좋을까요?','홍길동','2019-12-18 10:42:00','차에서 이상한 소리가 나네요.',1,0);
insert into bbs values(12, '제네시스 예비 차주 입니다.','손오공','2019-12-19 10:42:00','제네시스 색상 어떤 게 좋을 까요?',1,0);
insert into bbs values(13, '차량관련 문제로 글을 올립니다.','이승욱','2019-12-20 10:42:00','연비가 얼마나 되어야 좋은 걸까요?',1,0);
insert into bbs values(14, '처음뵙겠습니다.','김다솔','2019-12-21 10:42:00','처음 글 올려봐요 잘 지냅시다.',1,0);
insert into bbs values(15, '이런 경우에는 어떻게 하면 좋을까요?','홍길동','2019-12-22 10:42:00','차에서 이상한 소리가 나네요.',1,0);
insert into bbs values(16, '제네시스 예비 차주 입니다.','손오공','2019-12-23 10:42:00','제네시스 색상 어떤 게 좋을 까요?',1,0);
insert into bbs values(17, '차량관련 문제로 글을 올립니다.','이승욱','2019-12-24 10:42:00','연비가 얼마나 되어야 좋은 걸까요?',1,0);
insert into bbs values(18, '처음뵙겠습니다.','김다솔','2019-12-25 10:42:00','처음 글 올려봐요 잘 지냅시다.',1,0);
insert into bbs values(19, '이런 경우에는 어떻게 하면 좋을까요?','홍길동','2019-12-26 10:42:00','차에서 이상한 소리가 나네요.',1,0);
insert into bbs values(20, '제네시스 예비 차주 입니다.','손오공','2019-12-27 10:42:00','제네시스 색상 어떤 게 좋을 까요?',1,0);
insert into bbs values(21, '차량관련 문제로 글을 올립니다.','이승욱','2019-12-28 10:42:00','연비가 얼마나 되어야 좋은 걸까요?',1,0);
insert into bbs values(22, '처음뵙겠습니다.','김다솔','2019-12-29 10:42:00','처음 글 올려봐요 잘 지냅시다.',1,0);
insert into bbs values(23, '이런 경우에는 어떻게 하면 좋을까요?','홍길동','2019-12-29 12:50:00','차에서 이상한 소리가 나네요.',1,0);
insert into bbs values(24, '제네시스 예비 차주 입니다.','손오공','2019-12-30 10:42:00','제네시스 색상 어떤 게 좋을 까요?',1,0);

update bbs set bbsDate = '2019-11-07 10:42:00' where bbsDate is null;

-- 정비내역등록게시판
drop table if exists repair;
create table repair(
	repairBbsID int,					-- 정비게시글번호
	userID varchar(20),					-- 유저아이디
    serviceDay varchar(20),				-- 차량정비일
    serviceCenter varchar(20),			-- 정비소
    service varchar(20),				-- 정비항목
    serviceMoney double,				-- 서비스지출금액
    serviceTotalKm double default 0     -- 서비스 당시 총 주행거리
);

select * from repair;


-- 게시판 답글
drop table if exists bbsreply;
create table bbsreply (
bbsID int,					-- 게시글번호
replyID int,				-- 게시글 댓글번호
userID varchar(20),			-- ID
replyDate datetime,			-- 게시날짜
replyContent varchar(2048)	-- 게시내용
);

select * from bbsreply;

