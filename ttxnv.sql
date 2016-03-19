-- This .sql is for setting up your trains table in the database for the example code to work.
-- You can execute the following commands in your terminal filling in the values like <password>
-- before executing them:

-- in cloud 9, start the postgres service:
-- sudo service postgresql start

-- connect:
-- sudo sudo -u postgres psql

-- get to the filesystem while still logged in as super user
-- \!

-- change this directory
-- cd /backend

-- run this file
-- psql -f postgres_trains_local_example.sql

Skip to content
This repository  
Search
Pull requests
Issues
Gist
 @endencia
 Watch 1
  Star 0
  Fork 1 icstars/geekweek-postgresql
 Code  Issues 0  Pull requests 0  Wiki  Pulse  Graphs
Branch: master Find file Copy pathgeekweek-postgresql/trainrequest.sql
c06cbe2  11 days ago
@icstars icstars script to create the database and users and a sample to run a query
1 contributor
RawBlameHistory     63 lines (58 sloc)  13.4 KB
create database trainrequest;

\c trainrequest;

drop table trainrequest.public.TTX_Empl_Trng_Reqst;

CREATE TABLE trainrequest.public.TTX_Empl_Trng_Reqst (
	Trng_Reqst_Nbr int NOT NULL,
	Cntct_Email_Addr varchar(65) NOT NULL,
	Cntct_Email_Immed_Supv_Addr varchar(65) NOT NULL,
	Cntct_Email_Dept_Hd_Addr varchar(65) NOT NULL,
	Emp_Id varchar(6), NOT NULL, UNIQUE,
	Emp_First_Nm char(30), NOT NULL,
	Emp_Last_Nm varchar(30), NOT NULL,
	Dept_Id varchar(30), NOT NULL,
	Dept_Nm varchar(30), NOT NULL,
	Dept_Hd_Last_Nm varchar(30), NULL,
	Dept_Hd_First_Nm char(30), NOT NULL,
	Dept_Mngr_Last_Nm char(30), NOT NULL,
	Dept_Mngr_First_Nm char(30), NOT NULL,
	Dept_Spr_Last_Nm char(30), NOT NULL,
	Dept_Spr_First_Nm char(30), NOT NULL,
	Trng_Cors_Id char(10) NOT NULL,
	Trng_Cors_Nm varchar(256) NOT NULL,
	Trng_Cors_Nbr char(10) NOT NULL,
	Trng_Cors_Strt_Dt timestamp NOT NULL,
	Trng_Cors_End_Dt timestamp NOT NULL,
	Trng_Cors_Totl_Nbr_Hrs decimal(5, 2) NOT NULL,
	Trng_Cors_Cost decimal(7, 2) NOT NULL,
	Trng_Cors_Rltd_Exp_Amt decimal(7, 2) NULL,
	Trng_Cors_Locn varchar(256) NOT NULL,
	Trng_Cors_Typ char(25) NULL,
	Trng_Reqst_Cors_Bnft_Txt varchar(256) NOT NULL,
	Trng_Reqst_Immed_Supv_Apvl_Flg char(1) NULL,
	Trng_Reqst_Dept_Hd_Apvl_Flg char(1) NULL,
	Trng_Reqst_VP_Apvl_Flg char(1) NULL,
	Trng_Cors_Compl_Flg char(1) NULL,
	Trng_Cors_Budg_Pln_Flg char(1) NULL,
	Trng_Cors_Not_Budg_Pln_Rsn_Txt varchar(255) NULL,
	Trng_Cors_Not_Compl_Rsn_Txt varchar(256) NULL,
	Trng_Reqst_Fwd_Actg_Paym_Flg char(1) NULL,
	Trng_Reqst_Paym_Recip_Email_Addr varchar(65) NULL,
	Trng_Reqst_Rejt_Rsn_Txt varchar(255) NULL,
	Trng_Reqst_Paym_Reqst_Dt timestamp NULL,
	Trng_Reqst_Paym_Due_Dt timestamp NULL,
	Trng_Reqst_Paym_Chk_Amt decimal(7, 2) NULL,
	Trng_Reqst_Paym_Mail_Flg char(1) NULL,
	Vndr_Nbr char(10) NULL,
	Vndr_Nm varchar(40) NOT NULL,
	Vndr_Mail_Addr varchar(40) NULL,
	Vndr_Mail_Addr_Ln_2 varchar(40) NULL,
	Vndr_Mail_City varchar(25) NULL,
	Vndr_Mail_St char(2) NULL,
	Vndr_Mail_Zip_Cd char(10) NULL,
	Vndr_Mail_Cntry varchar(40) NULL,
	Trng_Reqst_Cost_Ctr varchar(10) NULL,
	Trng_Reqst_GL_Acct_Nbr varchar(10) NULL,
	Crtd_Dt timestamp NULL CONSTRAINT CURRENT_TIMESTAMP1  DEFAULT current_timestamp,
	Lst_Updt_Dt timestamp NULL CONSTRAINT CURRENT_TIMESTAMP2  DEFAULT current_timestamp,
	Lst_Updt_Id char(8) NOT NULL
);
create role nodesupervisor with password '22222222' login;
create role nodeuser with password '13149700' login;
grant connect on database trainrequest to nodeuser;
grant select on public.TTX_Empl_Trng_Reqst to nodeuser;

insert into TTX_Empl_Trng_Reqst (Trng_Reqst_Nbr, Cntct_Email_Addr, Cntct_Email_Immed_Supv_Addr, Cntct_Email_Dept_Hd_Addr, Trng_Cors_Id, Trng_Cors_Nm, Trng_Cors_Nbr, Trng_Cors_Strt_Dt, Trng_Cors_End_Dt, Trng_Cors_Totl_Nbr_Hrs, Trng_Cors_Cost, Trng_Cors_Rltd_Exp_Amt, Trng_Cors_Locn, Trng_Cors_Typ, Trng_Reqst_Cors_Bnft_Txt, Trng_Reqst_Immed_Supv_Apvl_Flg, Trng_Reqst_Dept_Hd_Apvl_Flg, Trng_Reqst_VP_Apvl_Flg, Trng_Cors_Compl_Flg, Trng_Cors_Budg_Pln_Flg, Trng_Cors_Not_Budg_Pln_Rsn_Txt, Trng_Cors_Not_Compl_Rsn_Txt, Trng_Reqst_Fwd_Actg_Paym_Flg, Trng_Reqst_Paym_Recip_Email_Addr, Trng_Reqst_Rejt_Rsn_Txt, Trng_Reqst_Paym_Reqst_Dt, Trng_Reqst_Paym_Due_Dt, Trng_Reqst_Paym_Chk_Amt, Trng_Reqst_Paym_Mail_Flg, Vndr_Nbr, Vndr_Nm, Vndr_Mail_Addr, Vndr_Mail_Addr_Ln_2, Vndr_Mail_City, Vndr_Mail_St, Vndr_Mail_Zip_Cd, Vndr_Mail_Cntry, Trng_Reqst_Cost_Ctr, Trng_Reqst_GL_Acct_Nbr, Crtd_Dt, Lst_Updt_Dt, Lst_Updt_Id) values('20140015', 'ALAN_TANG@TTX.COM', 'SCOTT.WISSEL@TTX.COM', 'KATHY_MILLER@TTX.COM', '', 'Visual Studio Live', '0', '5/5/2014 0:00:00', '5/8/2014 0:00:00', '32', '1795', '0', 'Chicago', 'Conference', 'Learn latest Microsoft technology', 'Y', 'Y', 'Y', '', 'Y', '', '', 'N', '', '', '12/31/1899 0:00:00', '12/31/1899 0:00:00', '0', 'N', '', 'Visual Studio Live! Chicago', '1277 University of Oregon ', '', 'Eugene', 'OR', '97403-1277', '', '', '464000', '2/26/2014 9:06:51', '3/4/2014 12:58:50', 'MISBGS');
insert into TTX_Empl_Trng_Reqst (Trng_Reqst_Nbr, Cntct_Email_Addr, Cntct_Email_Immed_Supv_Addr, Cntct_Email_Dept_Hd_Addr, Trng_Cors_Id, Trng_Cors_Nm, Trng_Cors_Nbr, Trng_Cors_Strt_Dt, Trng_Cors_End_Dt, Trng_Cors_Totl_Nbr_Hrs, Trng_Cors_Cost, Trng_Cors_Rltd_Exp_Amt, Trng_Cors_Locn, Trng_Cors_Typ, Trng_Reqst_Cors_Bnft_Txt, Trng_Reqst_Immed_Supv_Apvl_Flg, Trng_Reqst_Dept_Hd_Apvl_Flg, Trng_Reqst_VP_Apvl_Flg, Trng_Cors_Compl_Flg, Trng_Cors_Budg_Pln_Flg, Trng_Cors_Not_Budg_Pln_Rsn_Txt, Trng_Cors_Not_Compl_Rsn_Txt, Trng_Reqst_Fwd_Actg_Paym_Flg, Trng_Reqst_Paym_Recip_Email_Addr, Trng_Reqst_Rejt_Rsn_Txt, Trng_Reqst_Paym_Reqst_Dt, Trng_Reqst_Paym_Due_Dt, Trng_Reqst_Paym_Chk_Amt, Trng_Reqst_Paym_Mail_Flg, Vndr_Nbr, Vndr_Nm, Vndr_Mail_Addr, Vndr_Mail_Addr_Ln_2, Vndr_Mail_City, Vndr_Mail_St, Vndr_Mail_Zip_Cd, Vndr_Mail_Cntry, Trng_Reqst_Cost_Ctr, Trng_Reqst_GL_Acct_Nbr, Crtd_Dt, Lst_Updt_Dt, Lst_Updt_Id) values('20150044', 'ORLINE_CACAYAN@TTX.COM', 'SCOTT.WISSEL@TTX.COM', 'PURNESH.RUSTAGI@TTX.COM', '', 'Visual Studio Live! 2015', '0', '9/28/2015 0:00:00', '10/1/2015 0:00:00', '32', '1895', '0', 'Brooklyn, NY', 'Conference', 'Improve my technical skills and make me a more valuable asset to the company and give me the opportunity to learn from both industry experts and Microsoft product team members in a dev-focused environment.', 'Y', 'P', 'P', '', 'Y', '', '', 'N', '', '', '12/31/1899 0:00:00', '12/31/1899 0:00:00', '0', 'N', '', 'Visual Studio Live! New York ', 'Attn: Erin Shirley', '14901 Quorum Drive, Suite 425', 'Dallas', 'TX', '75254', '', '', '464000', '6/24/2015 9:45:37', '6/29/2015 15:43:42', 'DEVOLC');
insert into TTX_Empl_Trng_Reqst (Trng_Reqst_Nbr, Cntct_Email_Addr, Cntct_Email_Immed_Supv_Addr, Cntct_Email_Dept_Hd_Addr, Trng_Cors_Id, Trng_Cors_Nm, Trng_Cors_Nbr, Trng_Cors_Strt_Dt, Trng_Cors_End_Dt, Trng_Cors_Totl_Nbr_Hrs, Trng_Cors_Cost, Trng_Cors_Rltd_Exp_Amt, Trng_Cors_Locn, Trng_Cors_Typ, Trng_Reqst_Cors_Bnft_Txt, Trng_Reqst_Immed_Supv_Apvl_Flg, Trng_Reqst_Dept_Hd_Apvl_Flg, Trng_Reqst_VP_Apvl_Flg, Trng_Cors_Compl_Flg, Trng_Cors_Budg_Pln_Flg, Trng_Cors_Not_Budg_Pln_Rsn_Txt, Trng_Cors_Not_Compl_Rsn_Txt, Trng_Reqst_Fwd_Actg_Paym_Flg, Trng_Reqst_Paym_Recip_Email_Addr, Trng_Reqst_Rejt_Rsn_Txt, Trng_Reqst_Paym_Reqst_Dt, Trng_Reqst_Paym_Due_Dt, Trng_Reqst_Paym_Chk_Amt, Trng_Reqst_Paym_Mail_Flg, Vndr_Nbr, Vndr_Nm, Vndr_Mail_Addr, Vndr_Mail_Addr_Ln_2, Vndr_Mail_City, Vndr_Mail_St, Vndr_Mail_Zip_Cd, Vndr_Mail_Cntry, Trng_Reqst_Cost_Ctr, Trng_Reqst_GL_Acct_Nbr, Crtd_Dt, Lst_Updt_Dt, Lst_Updt_Id) values('20150053', 'ALAN_TANG@TTX.COM', 'SCOTT.WISSEL@TTX.COM', 'PURNESH.RUSTAGI@TTX.COM', '', 'Visual Studio Live', '0', '9/28/2015 0:00:00', '10/1/2015 0:00:00', '32', '1795', '1375', 'NY City', 'Conference', 'Learn latest Micosoft technology ', 'Y', 'P', 'P', '', 'Y', '', '', 'N', '', '', '12/31/1899 0:00:00', '12/31/1899 0:00:00', '0', 'N', '', 'Visual Studio Live! New York ', '14901 Quorum Drive, Suite 425', '', 'Dallas', 'TX', '75254', '', '', '464000', '7/27/2015 16:34:47', '7/29/2015 9:31:24', 'DEVSCW');
insert into TTX_Empl_Trng_Reqst (Trng_Reqst_Nbr, Cntct_Email_Addr, Cntct_Email_Immed_Supv_Addr, Cntct_Email_Dept_Hd_Addr, Trng_Cors_Id, Trng_Cors_Nm, Trng_Cors_Nbr, Trng_Cors_Strt_Dt, Trng_Cors_End_Dt, Trng_Cors_Totl_Nbr_Hrs, Trng_Cors_Cost, Trng_Cors_Rltd_Exp_Amt, Trng_Cors_Locn, Trng_Cors_Typ, Trng_Reqst_Cors_Bnft_Txt, Trng_Reqst_Immed_Supv_Apvl_Flg, Trng_Reqst_Dept_Hd_Apvl_Flg, Trng_Reqst_VP_Apvl_Flg, Trng_Cors_Compl_Flg, Trng_Cors_Budg_Pln_Flg, Trng_Cors_Not_Budg_Pln_Rsn_Txt, Trng_Cors_Not_Compl_Rsn_Txt, Trng_Reqst_Fwd_Actg_Paym_Flg, Trng_Reqst_Paym_Recip_Email_Addr, Trng_Reqst_Rejt_Rsn_Txt, Trng_Reqst_Paym_Reqst_Dt, Trng_Reqst_Paym_Due_Dt, Trng_Reqst_Paym_Chk_Amt, Trng_Reqst_Paym_Mail_Flg, Vndr_Nbr, Vndr_Nm, Vndr_Mail_Addr, Vndr_Mail_Addr_Ln_2, Vndr_Mail_City, Vndr_Mail_St, Vndr_Mail_Zip_Cd, Vndr_Mail_Cntry, Trng_Reqst_Cost_Ctr, Trng_Reqst_GL_Acct_Nbr, Crtd_Dt, Lst_Updt_Dt, Lst_Updt_Id) values('20150076', 'ALAN_TANG@TTX.COM', 'SCOTT.WISSEL@TTX.COM', 'PURNESH.RUSTAGI@TTX.COM', '', 'AppDynamics In Action for Power Users - .NET', '0', '11/30/2015 0:00:00', '12/4/2015 0:00:00', '40', '0', '0', 'Las Vegas', 'Conference', 'Learning AppDynmic all core product features', 'P', 'P', 'P', '', 'Y', '', '', 'N', '', '', '12/31/1899 0:00:00', '12/31/1899 0:00:00', '0', 'N', '', 'AppDynamics', '', '', '', '', '', '', '', '464000', '11/9/2015 8:23:26', '11/9/2015 8:23:26', 'DEVYAT');
insert into TTX_Empl_Trng_Reqst (Trng_Reqst_Nbr, Cntct_Email_Addr, Cntct_Email_Immed_Supv_Addr, Cntct_Email_Dept_Hd_Addr, Trng_Cors_Id, Trng_Cors_Nm, Trng_Cors_Nbr, Trng_Cors_Strt_Dt, Trng_Cors_End_Dt, Trng_Cors_Totl_Nbr_Hrs, Trng_Cors_Cost, Trng_Cors_Rltd_Exp_Amt, Trng_Cors_Locn, Trng_Cors_Typ, Trng_Reqst_Cors_Bnft_Txt, Trng_Reqst_Immed_Supv_Apvl_Flg, Trng_Reqst_Dept_Hd_Apvl_Flg, Trng_Reqst_VP_Apvl_Flg, Trng_Cors_Compl_Flg, Trng_Cors_Budg_Pln_Flg, Trng_Cors_Not_Budg_Pln_Rsn_Txt, Trng_Cors_Not_Compl_Rsn_Txt, Trng_Reqst_Fwd_Actg_Paym_Flg, Trng_Reqst_Paym_Recip_Email_Addr, Trng_Reqst_Rejt_Rsn_Txt, Trng_Reqst_Paym_Reqst_Dt, Trng_Reqst_Paym_Due_Dt, Trng_Reqst_Paym_Chk_Amt, Trng_Reqst_Paym_Mail_Flg, Vndr_Nbr, Vndr_Nm, Vndr_Mail_Addr, Vndr_Mail_Addr_Ln_2, Vndr_Mail_City, Vndr_Mail_St, Vndr_Mail_Zip_Cd, Vndr_Mail_Cntry, Trng_Reqst_Cost_Ctr, Trng_Reqst_GL_Acct_Nbr, Crtd_Dt, Lst_Updt_Dt, Lst_Updt_Id) values('20160006', 'ALAN_TANG@TTX.COM', 'SCOTT.WISSEL@TTX.COM', 'PURNESH.RUSTAGI@TTX.COM', '', 'Build 2016', '0', '3/30/2016 0:00:00', '4/1/2016 0:00:00', '24', '0', '1500', 'San Francisco', 'Conference', 'Learning Microsoft new technologies', 'Y', 'Y', 'Y', '', 'Y', '', '', 'N', '', '', '12/31/1899 0:00:00', '12/31/1899 0:00:00', '0', 'N', '', 'Microsoft', '', '', '', '', '', '', '', '464000', '1/27/2016 8:41:38', '1/29/2016 16:12:16', 'MISBGS');
insert into TTX_Empl_Trng_Reqst (Trng_Reqst_Nbr, Cntct_Email_Addr, Cntct_Email_Immed_Supv_Addr, Cntct_Email_Dept_Hd_Addr, Trng_Cors_Id, Trng_Cors_Nm, Trng_Cors_Nbr, Trng_Cors_Strt_Dt, Trng_Cors_End_Dt, Trng_Cors_Totl_Nbr_Hrs, Trng_Cors_Cost, Trng_Cors_Rltd_Exp_Amt, Trng_Cors_Locn, Trng_Cors_Typ, Trng_Reqst_Cors_Bnft_Txt, Trng_Reqst_Immed_Supv_Apvl_Flg, Trng_Reqst_Dept_Hd_Apvl_Flg, Trng_Reqst_VP_Apvl_Flg, Trng_Cors_Compl_Flg, Trng_Cors_Budg_Pln_Flg, Trng_Cors_Not_Budg_Pln_Rsn_Txt, Trng_Cors_Not_Compl_Rsn_Txt, Trng_Reqst_Fwd_Actg_Paym_Flg, Trng_Reqst_Paym_Recip_Email_Addr, Trng_Reqst_Rejt_Rsn_Txt, Trng_Reqst_Paym_Reqst_Dt, Trng_Reqst_Paym_Due_Dt, Trng_Reqst_Paym_Chk_Amt, Trng_Reqst_Paym_Mail_Flg, Vndr_Nbr, Vndr_Nm, Vndr_Mail_Addr, Vndr_Mail_Addr_Ln_2, Vndr_Mail_City, Vndr_Mail_St, Vndr_Mail_Zip_Cd, Vndr_Mail_Cntry, Trng_Reqst_Cost_Ctr, Trng_Reqst_GL_Acct_Nbr, Crtd_Dt, Lst_Updt_Dt, Lst_Updt_Id) values('20160009', 'KENDALL.ZETTLMEIER@TTX.COM', 'SCOTT.WISSEL@TTX.COM', 'PURNESH.RUSTAGI@TTX.COM', '', 'DevIntersections 2016', '0', '4/16/2016 0:00:00', '4/22/2016 0:00:00', '48', '2793', '1500', 'Lake Buena Vista, FL', 'Conference', 'This conference is going to have sessions and workshops discussing new javascript tools such as AngularJS 2 and Nativescript in order to build cross-platform applications using AngularJS.', 'Y', 'Y', 'Y', '', 'Y', '', '', 'N', '', '', '12/31/1899 0:00:00', '12/31/1899 0:00:00', '0', 'N', '', 'DevIntersections 2016', '', '', '', '', '', '', '', '464000', '1/28/2016 8:31:30', '1/29/2016 16:11:43', 'MISBGS');
insert into TTX_Empl_Trng_Reqst (Trng_Reqst_Nbr, Cntct_Email_Addr, Cntct_Email_Immed_Supv_Addr, Cntct_Email_Dept_Hd_Addr, Trng_Cors_Id, Trng_Cors_Nm, Trng_Cors_Nbr, Trng_Cors_Strt_Dt, Trng_Cors_End_Dt, Trng_Cors_Totl_Nbr_Hrs, Trng_Cors_Cost, Trng_Cors_Rltd_Exp_Amt, Trng_Cors_Locn, Trng_Cors_Typ, Trng_Reqst_Cors_Bnft_Txt, Trng_Reqst_Immed_Supv_Apvl_Flg, Trng_Reqst_Dept_Hd_Apvl_Flg, Trng_Reqst_VP_Apvl_Flg, Trng_Cors_Compl_Flg, Trng_Cors_Budg_Pln_Flg, Trng_Cors_Not_Budg_Pln_Rsn_Txt, Trng_Cors_Not_Compl_Rsn_Txt, Trng_Reqst_Fwd_Actg_Paym_Flg, Trng_Reqst_Paym_Recip_Email_Addr, Trng_Reqst_Rejt_Rsn_Txt, Trng_Reqst_Paym_Reqst_Dt, Trng_Reqst_Paym_Due_Dt, Trng_Reqst_Paym_Chk_Amt, Trng_Reqst_Paym_Mail_Flg, Vndr_Nbr, Vndr_Nm, Vndr_Mail_Addr, Vndr_Mail_Addr_Ln_2, Vndr_Mail_City, Vndr_Mail_St, Vndr_Mail_Zip_Cd, Vndr_Mail_Cntry, Trng_Reqst_Cost_Ctr, Trng_Reqst_GL_Acct_Nbr, Crtd_Dt, Lst_Updt_Dt, Lst_Updt_Id) values('20160010', 'JACQUELINE.DUKES@TTX.COM', 'SCOTT.WISSEL@TTX.COM', 'PURNESH.RUSTAGI@TTX.COM', '', 'Anglebrackets 2016', '0', '4/16/2016 0:00:00', '4/22/2016 0:00:00', '48', '2793', '1500', 'Orlando, FL 32830', 'Conference', 'Learn about open source frameworks relevant to the Emerging Technologies team', 'P', 'Y', 'Y', '', 'Y', '', '', 'N', '', '', '12/31/1899 0:00:00', '12/31/1899 0:00:00', '0', 'N', '', 'Anglebrackets 2016', '', '', '', '', '', '', '', '464000', '1/28/2016 11:55:50', '1/29/2016 16:12:00', 'MISBGS');
insert into TTX_Empl_Trng_Reqst (Trng_Reqst_Nbr, Cntct_Email_Addr, Cntct_Email_Immed_Supv_Addr, Cntct_Email_Dept_Hd_Addr, Trng_Cors_Id, Trng_Cors_Nm, Trng_Cors_Nbr, Trng_Cors_Strt_Dt, Trng_Cors_End_Dt, Trng_Cors_Totl_Nbr_Hrs, Trng_Cors_Cost, Trng_Cors_Rltd_Exp_Amt, Trng_Cors_Locn, Trng_Cors_Typ, Trng_Reqst_Cors_Bnft_Txt, Trng_Reqst_Immed_Supv_Apvl_Flg, Trng_Reqst_Dept_Hd_Apvl_Flg, Trng_Reqst_VP_Apvl_Flg, Trng_Cors_Compl_Flg, Trng_Cors_Budg_Pln_Flg, Trng_Cors_Not_Budg_Pln_Rsn_Txt, Trng_Cors_Not_Compl_Rsn_Txt, Trng_Reqst_Fwd_Actg_Paym_Flg, Trng_Reqst_Paym_Recip_Email_Addr, Trng_Reqst_Rejt_Rsn_Txt, Trng_Reqst_Paym_Reqst_Dt, Trng_Reqst_Paym_Due_Dt, Trng_Reqst_Paym_Chk_Amt, Trng_Reqst_Paym_Mail_Flg, Vndr_Nbr, Vndr_Nm, Vndr_Mail_Addr, Vndr_Mail_Addr_Ln_2, Vndr_Mail_City, Vndr_Mail_St, Vndr_Mail_Zip_Cd, Vndr_Mail_Cntry, Trng_Reqst_Cost_Ctr, Trng_Reqst_GL_Acct_Nbr, Crtd_Dt, Lst_Updt_Dt, Lst_Updt_Id) values('20160011', 'RICH.ROUSSEAU@TTX.COM', 'SCOTT.WISSEL@TTX.COM', 'PURNESH.RUSTAGI@TTX.COM', '', 'Angle Brackets', '0', '4/17/2016 0:00:00', '4/22/2016 0:00:00', '48', '2793', '1806', 'Orlando, FL', 'Conference', 'Training on many new technologies including Angular, Node, JavaScript which are integral to the new Emerging Technology Team.', 'Y', 'Y', 'Y', '', 'Y', '', '', 'N', '', '', '12/31/1899 0:00:00', '12/31/1899 0:00:00', '0', 'N', '', 'AngleBrackets/DevIntersection', '', '', '', '', '', '', '', '464000', '1/28/2016 12:30:24', '1/29/2016 16:11:26', 'MISBGS');
Status API Training Shop Blog About
© 2016 GitHub, Inc. Terms Privacy Security Contact Help