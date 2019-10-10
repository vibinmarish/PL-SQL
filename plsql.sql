1--PRINT HELLO WORLD
set serveroutput on;
begin
dbms_output.put_line('Hello World');
end;
/

2---DECLARE A VARIABLE AND STORE A VALUE
set serveroutput on
declare
myname varchar(20) :='Vibin Marish';
begin
dbms_output.put_line(myname);
end;
/

3--GET INPUT FROM USER
set serveroutput on;
declare
myname varchar(20);
begin
myname:='&myname';
dbms_output.put_line(myname);
end;
/

4--SHOW SALARY FROM A SQL TABLE
set serveroutput on;
declare
salary emp.sal%type;
begin
select sal into salary from emp where ename='VIBIN';
dbms_output.put_line('Salary for VIBIN is '||salary);
end;
/

5--SHOW JOB AND SALARY FROM A SQL TABLE
set serveroutput on;
declare
jobname emp.job%type;
salary emp.sal%type;
begin
select job,sal into jobname,salary from emp where ename='VIBIN';
dbms_output.put_line('Salary and Job for Vibin is '||jobname||' ' ||salary);
end;
/

6--GET INPUT NAME AND SHOW THE SALARY
set serveroutput on;
declare 
name emp.job%type;
salary emp.sal%type;
begin
name:='&name';
select sal into salary from emp where ename=name;
dbms_output.put_line('Salary for '||name||' is '||salary);
end;
/

7--CALCULATE THE COMMISSION FROM SALARY FOR AN EMPNO
set serveroutput on;
declare
salary emp.sal%type;
empid emp.empno%type;
comm number(10);
begin
empid:='&empid';
select sal into salary from emp where empno=empid;
if(salary<5000) then
comm:=salary+salary*200/100;
elsif(salary>5000 and salary<10000) then
comm:=salary+salary*500/100;
end if;
dbms_output.put_line('Commission for '||empid||' is '||comm);
end;
/

8--FOR LOOP EXAMPLE
set serveroutput on;
begin
for i in 1..10 loop
dbms_output.put_line(i);
end loop;
end;
/ 

9--UPDATE ROW IN A TABLE
set serveroutput on;
begin
update emp set sal=sal+50;
end;
/ 

10--CURSOR EXAMPLE
 set serveroutput on;
 declare 
 id emp.empno%type;
 name emp.ename%type;
 cursor empdets is select empno, ename from emp;
 begin
 open empdets;
 loop
 fetch empdets into id,name;
 exit when empdets %notfound;
 dbms_output.put_line(id||' '||name);
 end loop;
 close empdets;
 end;
 /
 
11--DISPLAY NAME OF PEOPLE WITH SALARY >3000
set serveroutput on;
declare
name emp.ename%type;
cursor curname is select ename from emp where sal>3000;  
begin
open curname;
loop
fetch curname into name;
exit when curname %notfound;
dbms_output.put_line(name);
end loop;
end;
/
