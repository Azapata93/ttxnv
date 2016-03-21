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

create database nodeworkshop;

\c nodeworkshop;

create table if not exists trains (
  id serial primary key,
  name text,
  inService boolean,
  numberOfAvailable int
);
create table Employee
( EmployeeId varchar, unique, primary key
  FirstName text,
  LastName text,
  Approved boolean,
  ApprovedDate Date,
  CompletedDate Date,
  DeptId varchar
);
create table Courses
( EmployeeId var char, primary Key,
  CourseId varchar,
  CourseName varchar,
  CourseStartDate Date,
  CourseEndDate Date,
  CourseType varchar,
  CourseAddress varchar,
  CourseCity varchar,
  CourseState varchar,
  CourseZIP varchar,
  CourseCost double
);

create table Vendor
( EmployeeId varchar, primary key
  VendorId varchar, unique 
  VendorName text,
  VendorAddress varchar,
  VendorCity varchar,
  VendorState varchar,
  VendorZIP varchar
);
create table Department
( DeptId varchar, primary key, unique
  DeptName varchar,
  DeptSupervisor text,
  DeptMgr text,
  DeptHead text,
);
  insert into Employee (EmployeeId, FirstName, LastName, Approved,  
  ApprovedDate,  CompletedDate) values ('bw1234', 'Waltz', 'Dennis', true, 12/15/2015, 12/28/2015);
  insert into Employee values ('as1234', 'Alice',  'White', false, 0,0);
  insert into Employee values ('jr1234','Jack','Rizal', true, 01/23/2016, 02/05/2016);

  insert into Courses (EmployeeId, CourseId, CourseName, CourseStartDate, CourseEndDate, CourseType, CourseAddress,CourseCity, CourseState, CourseZIP,
  CourseCost) values ('bw1234', 1235, 'Visual Studio', 01/03/2016, 01/04/2016, 'webinar',  0, 0, 0, 0, 0.00);
  insert into Courses values ('as1234', 'df125', 'Excel', 01/05/2016, 01/10/2016, 'seminar', '123 S Highland st', 'Chicago', 'IL', 60612, '$250');
  insert into Courses values('jr1234', 'de234', 'Power Point,01/05/2016, 01/07/2016, 'conference', '12 S Hale St', 'Addison','IL', 60106, '$25.00');

  insert into Vendor (EmployeeId, VendorId, VendorName, VendorAddress, VendorCity, VendorState, VendorZIP) values ('bw1234', 'M123', 'Compuserve', '23 S Pluto', 'Chicago','IL', 60633); 
  insert into Vendor values ('as1234', '1256', 'Microtech', '2351 S Saturn', 'Chicago', 'IL', 60642);
  insert into Vendor values ('jr1234','2222','SolTech','123 N Kinzie', 'Chicago', 'IL','60634');

  insert into Department (DeptId, DeptName, DeptSupervisor, DeptMgr, DeptHead) values ('123', 'IT','Sandy Love', 'Sonny Jones', 'Mark Williams');
  insert into Department values (09877, 'Customer Service', 'Cathy Williams', 'John Doe', 'Jack Lintz');                          
  insert into Department values (09889, 'Transportation', 'Bill Doors', 'Bill McConnor', 'Bill Reef');

create tab
create role nodeuser with password '13149700' login;
grant connect on database nodeworkshop to nodeuser;
grant select on public.trains to nodeuser;

insert into trains (name, inService, numberOfAvailable) values ('redline 813', true, '8');
insert into trains (name, inService, numberOfAvailable) values ('redline 912', true, '10');
insert into trains (name, inService, numberOfAvailable) values ('greenline 713', true, '10');
insert into trains (name, inService, numberOfAvailable) values ('brownline 412', true, '8');
