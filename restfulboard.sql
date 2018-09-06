
/* Drop Tables */

DROP TABLE t_user CASCADE CONSTRAINTS;
DROP TABLE t_board CASCADE CONSTRAINTS;
DROP TABLE t_article CASCADE CONSTRAINTS;
DROP TABLE t_comment CASCADE CONSTRAINTS;

DROP SEQUENCE seq_article;
DROP SEQUENCE seq_board;
DROP SEQUENCE seq_comment;
DROP SEQUENCE seq_user;

CREATE SEQUENCE seq_article nocache;
CREATE SEQUENCE seq_board INCREMENT BY 10 START WITH 100 nocache;
CREATE SEQUENCE seq_comment nocache;
CREATE SEQUENCE seq_user nocache;


/* Create Tables */

CREATE TABLE t_user
(
	usr_no number NOT NULL,
	usr_id varchar2(20) NOT NULL UNIQUE,
	usr_pw varchar2(128) NOT NULL,
	usr_name varchar2(30) NOT NULL,
	usr_info varchar2(1000),
	usr_level number(1) DEFAULT 1 NOT NULL,
	usr_status number(1) DEFAULT 0 NOT NULL,
	usr_regdate date DEFAULT sysdate NOT NULL, 
	usr_lastlogin date DEFAULT sysdate NOT NULL,
	usr_logcnt number(7) DEFAULT 0 NOT NULL,
	usr_ip varchar2(35),
	usr_zipcode varchar2(7),
	usr_address varchar2(100),
	usr_address_detail varchar2(60),
	PRIMARY KEY (usr_no)
);

CREATE TABLE t_board
(
	boa_no number NOT NULL,
	boa_name varchar2(20) NOT NULL,
	boa_status number(1) DEFAULT 1 NOT NULL,
	usr_no number NOT NULL,
	PRIMARY KEY (boa_no)
);

CREATE TABLE t_article
(
	art_no number NOT NULL, 
	art_title varchar2(200) NOT NULL,
	art_content varchar2(4000) NOT NULL,
	art_like number(5) DEFAULT 0 NOT NULL,
	art_dislike number(5) DEFAULT 0 NOT NULL,
	art_regdate date DEFAULT sysdate NOT NULL,
	art_readcnt number(5) DEFAULT 0 NOT NULL,
	art_com_cnt number(4) DEFAULT 0 NOT NULL,
	art_ip varchar2(35),
	boa_no number NOT NULL,
	usr_no number NOT NULL,
	PRIMARY KEY (art_no)
);

CREATE TABLE t_comment
(
	com_no number NOT NULL,
	com_content varchar2(1000) NOT NULL,
	com_regdate date DEFAULT sysdate NOT NULL,
	com_like number(5) DEFAULT 0 NOT NULL,
	com_dislike number(5) DEFAULT 0 NOT NULL,
	com_ip varchar2(35),
	art_no number NOT NULL,
	usr_no number NOT NULL,
	PRIMARY KEY (com_no)
);

ALTER TABLE t_board
	ADD FOREIGN KEY (usr_no)
	REFERENCES t_user (usr_no);
	
ALTER TABLE t_article
	ADD FOREIGN KEY (boa_no)
	REFERENCES t_board (boa_no);

ALTER TABLE t_article
	ADD FOREIGN KEY (usr_no)
	REFERENCES t_user (usr_no);
	
ALTER TABLE t_comment
	ADD FOREIGN KEY (art_no)
	REFERENCES t_article (art_no);
	
ALTER TABLE t_comment
	ADD FOREIGN KEY (usr_no)
	REFERENCES t_user (usr_no);


/* Create Records*/

insert into t_user(usr_no, usr_id, usr_pw, usr_name, usr_info) values(seq_user.nextval, 'next','비밀번호','신해철','쵝오의 뮤지션');
insert into t_user(usr_no, usr_id, usr_pw, usr_name, usr_info) values(seq_user.nextval, 'taiji', '비밀번호','서태지','굿 뮤지션'); 
 
insert into t_board(boa_no, boa_name, usr_no) values(seq_board.nextval, '자유 게시판', 1);
insert into t_board(boa_no, boa_name, usr_no) values(seq_board.nextval, '공지 사항', 2);
insert into t_board(boa_no, boa_name, usr_no) values(seq_board.nextval, 'Q&A 게시판', 1);


commit

select * from t_board;
select * from t_user;
select * from t_comment;

update t_user set usr_pw = '5ace6a310d02919523c0ed462a78f73e43d19bc5b257530962fa6e76c5032f25fa424d863b2c6dc5ec65cac3293f1a4cc323af15866c89c3e652b161c080f0b8';
commit


select usr_name, usr_id, usr_level, usr_status
from t_user
where usr_id='next' and usr_pw='5ace6a310d02919523c0ed462a78f73e43d19bc5b257530962fa6e76c5032f25fa424d863b2c6dc5ec65cac3293f1a4cc323af15866c89c3e652b161c080f0b8';


--getBoardList
select b.boa_no, b.boa_name,
		u.usr_no as "userVO.usr_no",
		u.usr_id as "userVO.usrId",
		u.usr_name as "userVO.usr_name"
from t_board b inner join t_user u
on b.usr_no = u.usr_no
where boa_status=1
order by boa_name asc ;


update t_board set boa_name='질문 게시판' where boa_name='질문게시판';

select usr_no, usr_name, usr_level, usr_status
from t_user

select * from t_article;




select 	a.art_no, a.art_title, 
			u.usr_no as "userVO.usr_no",
			u.usr_name as "userVO.usr_name",
			u.usr_id as "userVO.usr_id",
			to_char(a.art_regdate, 'yyyy/mm/dd'), a.art_readcnt
from 	t_article a inner join t_user u
on 		a.usr_no=u.usr_no
order	by art_no desc;




to_char(last_analyzed,'yyyy/mm/dd hh24:mi:ss') 



	select 	a.art_no, a.art_title, 
				u.usr_no as "userVO.usr_no",
				u.usr_name as "userVO.usr_name",
				u.usr_id as "userVO.usr_id",
				a.art_regdate,
				a.art_readcnt
		from 	t_article a inner join t_user u
		on 		a.usr_no=u.usr_no
		order	by art_no desc;



select 	art_no, art_title, art_content, art_like, art_dislike, art_regdate, art_readcnt, art_com_cnt, art_ip, boa_no, usr_no
from t_article
where art_no=3

