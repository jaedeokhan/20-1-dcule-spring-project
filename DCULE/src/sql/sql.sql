create table tab_mybatis(
    id NUMBER PRIMARY KEY,
	name varchar2(10),
	email varchar2(100),
	phone varchar2(11)
);
CREATE SEQUENCE tab_mybatis_seq;

insert into tab_mybatis 
values (tab_mybatis_seq.nextval,'ȣ����','thosit@naee.com','01044472343');

insert into tab_mybatis 
values (tab_mybatis_seq.nextval,'������','qewdq@naee.com','1234654');

insert into tab_mybatis 
values (tab_mybatis_seq.nextval,'Ŀ����','thosit@naee.com','01044472343');

COMMIT

drop table tab_mybatis;