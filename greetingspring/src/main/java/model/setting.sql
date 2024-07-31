CREATE TABLE member (
	memberid	VARCHAR2(30)	,
	memberpw	VARCHAR2(30)	NULL,
	name	VARCHAR2(30)	NULL,
	gender	VARCHAR2(30)	NULL,
	email	VARCHAR2(30)	NULL,
	phone	VARCHAR2(30)	NULL,
	birth	VARCHAR2(30)	NULL,
	profileimage	VARCHAR2(200)	NULL
);

CREATE TABLE business (
	businessid	VARCHAR2(20),
	businesspw	VARCHAR2(40)	NULL,
	businessname	VARCHAR2(40)	NULL,
	address	VARCHAR2(200)	NULL,
	salary	number	NULL,
	welfare	CLOB	NULL,
	ceo	VARCHAR2(40)	NULL,
	sales	number	NULL,
	employees	number	NULL,
	type	VARCHAR2(40)	NULL,
	industry	VARCHAR2(100)	NULL,
	detailindustry	VARCHAR2(200)	NULL,
	homepage	VARCHAR2(200)	NULL,
	content	CLOB	NULL
);

CREATE TABLE resume (
   resumeid   number,
   resumetitle   VARCHAR2(90)   NULL,
   profileimage   VARCHAR2(200)   NULL,
   name   VARCHAR2(90)   NULL,
   birth   VARCHAR2(90)   NULL,
   phone   VARCHAR2(90)   NULL,
   email   VARCHAR2(90)   NULL,
   registdate   DATE   NULL,
   selfinfo   VARCHAR2(40)   NULL,
   certification   VARCHAR2(90)   NULL,
   language   VARCHAR2(90)   NULL,
   address   VARCHAR2(90)   NULL,
   memberid   VARCHAR2(40),
   businessid   VARCHAR2(40),
   isdefault number
);

CREATE TABLE anno (
    annoId NUMBER NULL,
    businessName VARCHAR2(90) NULL,
    welfare CLOB NULL,
    annoTitle VARCHAR2(90) NULL,
    annoCareer VARCHAR2(90) NULL,
    annoSalary VARCHAR2(90) NULL,
    annoEdu VARCHAR2(90) NULL,
    annoGrade VARCHAR2(90) NULL,
    annoWorkType VARCHAR2(90) NULL,
    annoWorkDay VARCHAR2(90) NULL,
    annoWorkPlace VARCHAR2(90) NULL,
    annoCommon VARCHAR2(90) NULL,
    annoQualification VARCHAR2(90) NULL,
    annoPickNum NUMBER NULL,
    annoDate DATE NULL,
    annoContent CLOB NULL,
    businessId VARCHAR2(20) NULL,
    skillId NUMBER NULL,
    annoDeadline DATE NULL
);


CREATE TABLE skill (
   skillid   number   ,
   skills   VARCHAR2(400)   NULL,
   annoid   number   
);

CREATE TABLE edu (
	eduid	number	,
	schooltype	VARCHAR2(40)	NULL,
	schoolname	VARCHAR2(40)	NULL,
	admissiondate	VARCHAR2(40)	NULL,
	graduatedate	VARCHAR2(40)	NULL,
	graduatestate	VARCHAR2(40)	NULL,
	major	VARCHAR2(40)	NULL,
	score	VARCHAR2(40)	NULL,
	totalscore	VARCHAR2(40)	NULL,
	resumeid	number	
);

CREATE TABLE career (
	careerid	number	,
	companyname	VARCHAR2(40)	NULL,
	department	VARCHAR2(40)	NULL,
	workpart	VARCHAR2(40)	NULL,
	position	VARCHAR2(40)	NULL,
	worktype	VARCHAR2(40)	NULL,
	isworking	VARCHAR2(40)	NULL,
	workperiod	VARCHAR2(40)	NULL,
	resumeid	number	
);

CREATE TABLE memberproject (
	projectid	number	,
	projectname	VARCHAR2(40)	NULL,
	team	VARCHAR2(40)	NULL,
	isgoing	VARCHAR2(40)	NULL,
	projectperiod	VARCHAR2(40)	NULL,
	projectinfo	VARCHAR2(40)	NULL,
	resumeid	number	
);

CREATE TABLE memberportfolio (
	portfolioid	number,	
	portfoliourl	VARCHAR2(200)	NULL,
	portfoliofile	VARCHAR2(200)	NULL,
	resumeid	number	
);

create table resume_anno_connect(
    resumeid   number,
    annoid   number,
    resume_register_date Date,
    resume_check_date Date,
    columnstage number,
    resumescore number
);


create table columntable(
    annoid   number,
    columntitle   VARCHAR2(100),
    columnstage number
);


-- 이력서 평가 테이블
create table resume_evaluate_table(
    resumeid number,
    annoid number,
    evaluatestage number,
    evaluatedate VARCHAR2(500),
    suitablescore number,
    suitablecontent VARCHAR2(500),
    practicalscore number,
    practicalcontent VARCHAR2(500),
    avgscore number
);








create sequence memberseq;
create sequence resumeidseq;
create sequence annoseq;
create sequence skillseq;
create sequence eduseq;
create sequence careerseq;
create sequence memberprojectseq;
create sequence memberportfolioseq;




==================drop==================

drop table member;
drop table business;
drop table resume;
drop table anno;
drop table skill;
drop table edu;
drop table career;
drop table memberproject;
drop table memberportfolio;
drop table resume_anno_connect;
drop table columntable;
drop table resume_evaluate_table;



drop sequence memberseq;
drop sequence memberprojectseq;
drop sequence memberportfolioseq;
drop sequence annoseq;
drop sequence resumeidseq;
drop sequence skillseq;
drop sequence eduseq;
drop sequence careerseq;

