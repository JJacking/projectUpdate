CREATE TABLE product(
    num number PRIMARY KEY,
    title VARCHAR2(50),
    productPic VARCHAR2(1000),
    strPrice number,
    memberId VARCHAR2(100),
    content VARCHAR2(1000),
    regdate TIMESTAMP,
    bidCount NUMBER default 0,
    readCount NUMBER default 0,
    writeDate date DEFAULT sysdate,
    category VARCHAR2(50),
    endSale NUMBER
);



INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'����','����.jpg', 10000, 'test', '625�� ���� ����',
TO_DATE('2023/01/30 12:20','yyyy/MM/dd HH24:MI'), 'antique', 1);
INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'����2','����2.jpg', 10000, 'test', '625�� ���� ����2',
TO_DATE('2023/01/29 12:20','yyyy/MM/dd HH24:MI'), 'antique', 1);
INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'����3','����3.jpg', 10000, 'test', '625�� ���� ����3',
TO_DATE('2023/01/29 12:20','yyyy/MM/dd HH24:MI'), 'antique', 1);
INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'����4','����.jpg', 14546000, 'test', '625�� ���� ����',
TO_DATE('2023/01/30 10:50','yyyy/MM/dd HH24:MI'), 'antique', 1);

INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'�׸�','�׸�.jpg', 50000, 'test', '����ǰ �׸�',
TO_DATE('2023/01/25 13:20','yyyy/MM/dd HH24:MI'), 'workArt', 0);
INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'�׸�2','�׸�2.jpg', 50000, 'test', '����ǰ �׸�2',
TO_DATE('2023/01/24 13:20','yyyy/MM/dd HH24:MI'), 'workArt', 0);
INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'�׸�3','�׸�3.jpg', 50000, 'test', '����ǰ �׸�3',
TO_DATE('2023/01/23 13:20','yyyy/MM/dd HH24:MI'), 'workArt', 0);

INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'Ű����','Ű����.jpg', 10000, 'test', '�۵��� �� �ϴ� Ű����',
TO_DATE('2023/01/22 14:20','yyyy/MM/dd HH24:MI'), 'appliances', 0);
INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'���콺','���콺.jpg', 10000, 'test', '�۵��� �� �ϴ� ���콺',
TO_DATE('2023/02/02 14:20','yyyy/MM/dd HH24:MI'), 'appliances', 1);

INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'���͸�','���͸�.jpg', 9000, 'test', '��뷮 ���͸� (������)',
TO_DATE('2023/01/22 14:20','yyyy/MM/dd HH24:MI'), 'appliances', 0);
INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'���͸�2','���͸�2.jpg', 9000, 'test', '��뷮 ���͸� (������)2',
TO_DATE('2023/01/22 14:20','yyyy/MM/dd HH24:MI'), 'appliances', 0);
INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'���͸�3','���͸�3.jpg', 9000, 'test', '��뷮 ���͸� (������)3',
TO_DATE('2023/01/22 14:20','yyyy/MM/dd HH24:MI'), 'appliances', 0);

INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'������ ������','����Ʈ���� 3��.jpg', 5000, 'test', '������ ������ ��ȣ�� ���� 4.8�� ����Ʈ���� 3��',
TO_DATE('2023/01/20 10:50','yyyy/MM/dd HH24:MI'), 'antique', 0);
INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'û�ұ�','û�ұ�.jpg', 30000, 'test', '���̽��� �ƴ����� �� �Ǵ� û�ұ�',
TO_DATE('2023/01/17 19:50','yyyy/MM/dd HH24:MI'), 'used', 0);
INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'�������ø���','�������ø���.jpg', 100000, 'test', '������4,5,6,7,8 ����� ���� B��',
TO_DATE('2023/02/11 11:11','yyyy/MM/dd HH24:MI'), 'collection', 1);

INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'���û��','���û��.jpg', 1000000, 'test', '���û��',
TO_DATE('2023/01/28 14:10','yyyy/MM/dd HH24:MI'), 'appliances', 1);
INSERT INTO product(num,title, productPic, strPrice, memberId, content, regdate, category, endSale) 
VALUES (product_seq.nextval,'�������','�������.jpg', 900000, 'test', '�������',
TO_DATE('2023/01/28 14:10','yyyy/MM/dd HH24:MI'), 'appliances', 1);


commit;


CREATE SEQUENCE product_seq NOCACHE;


CREATE TABLE customer(
    buyNum number PRIMARY KEY,
    num number,
    memberId VARCHAR2(50),
    bidTime timestamp,
    bidMoney VARCHAR2(50)
);

CREATE SEQUENCE customer_seq NOCACHE;

--------------------------------------------------------------------------------------------------------
-- �Խ���
drop table boardTbl;
drop sequence boardTbl_seq;
drop table boardComment;
drop sequence boardComment_seq;
drop table reBoardComment;
drop SEQUENCE reBoardComment_seq;
 
CREATE table boardTbl(
    num number(20) PRIMARY KEY,
    id VARCHAR2(40),
    nickName VARCHAR2(40),
    title VARCHAR2(30),
    content VARCHAR2(1000),
    readCount number(20) default 0,
    wirteDate DATE default sysdate
);

drop table boardTbl;

create SEQUENCE boardTbl_seq
NOCACHE;


insert into boardTbl(num, id, nickName, title, content)
VALUES(boardTbl_seq.NEXTVAL, 'timo@naver.com', 'ȲƼ��', '�ν���','Ƽ��� ����');
insert into boardTbl(num, id, nickName, title, content)
VALUES(boardTbl_seq.NEXTVAL,'top@naver.com', '����', '��','����');


SELECT * FROM boardTbl ORDER BY num DESC;

commit;


CREATE TABLE boardComment(
    cno number PRIMARY KEY,
    num number REFERENCES boardTbl(num) on DELETE CASCADE,
    userId varchar2(50) not null,
    nickName varchar2(20) not null,
    reContent varchar2(500) not null,
    reWirteDate DATE default sysdate
);

drop table boardComment;

create SEQUENCE boardComment_seq;

INSERT INTO boardComment(cno, num, nickName, userId, reContent)
VALUES(boardComment_seq.NEXTVAL, 4, '����', 'asd@asd.asd', '�����');
INSERT INTO boardComment(cno, num, nickName, userId, reContent)
VALUES(boardComment_seq.NEXTVAL, 4, '�ٳ���', 'asd@asd.asd', 'Ű����');


commit;

select * from boardComment;
 
CREATE TABLE reBoardComment(
    replyCno number PRIMARY KEY,
    num NumBER REFERENCES boardComment(cno) on DELETE CASCADE,  
    rrNickName varchar2(20) not null,
    userId varchar2(50) not null,
    rrReContent varchar2(500) not null,
    rrWirteDate DATE default sysdate
);

select * from reBoardComment;

DELETE FROM boardComment WHERE cno=26;

delete reBoardComment where num=25;

drop table reBoardComment;

create SEQUENCE reBoardComment_seq;

INSERT INTO reBoardComment(replyCno, num, rrNickName, userId, rrReContent)
VALUES(reBoardComment_seq.NEXTVAL, 24,'����', 'asd@asd.asd','�����');
INSERT INTO reBoardComment(replyCno, num, rrNickName, userId, rrReContent)
VALUES(reBoardComment_seq.NEXTVAL, 25,'����', 'asd@asd.asd','�����');

 CREATE table managerBoard(
    mgNum number(20) PRIMARY KEY,
    mgName VARCHAR2(30),
    title VARCHAR2(30),
    content VARCHAR2(1000),
    readCount number(20) default 0,
    wirteDate DATE default sysdate
);

drop table managerBoard;

create SEQUENCE managerTbl_seq
NOCACHE;

insert into managerBoard(MgNum, MgName, title, content)
VALUES(managerTbl_seq.NEXTVAL,'������','�ȳ��ϼ���','�������� ������ �Դϴ�.');

 commit;
--------------------------------------------------------------------------------------------------------

drop table chargeTbl;
drop table member;
drop sequence charge_seq;

create table member(
    id varchar2(100) primary key,
    password varchar2(100) not null,
    nickname varchar2(100) not null,
    point number default 0,
    phone varchar2(20),
    address varchar2(300),
    grade number(1) not null,
    type varchar2(10) not null 
);

create table chargeTbl(
    idx number primary key,
    id varchar2(100) not null,
    point number not null,
    regdate date not null,
    result number(1) not null
);

create table searchPassAuth(
    id varchar2(200) not null,
    key varchar2(200) not null,
    auth char not null
);

create table emailCertification(
    id varchar2(200) not null,
    key varchar2(200) not null,
    auth char(1) not null
);


create sequence charge_seq nocache;

insert into member values('root@rr.rr','1234','������',100000,'010','rootroot',0,'auction');
insert into member values('asd@asd.asd','1234','asd',0,'010','aaaaa',1,'google');

insert into chargeTbl values(charge_seq.nextval,'asd@asd.asd',1000,sysdate,0);

commit;


--------------------
select id, nickname from member 
		 where id = 'asd@asd.asd' and nickname = 'asd';

