-- Julio Cesar Correa
-- DBA Oracle

SQL*Plus: Release 10.2.0.4.0 - Production on Thu Sep 10 11:44:38 2009

Copyright (c) 1982, 2007, Oracle.  All Rights Reserved.

SQL> conn sys as sysdba
Enter password:
Connected.
SQL> set timing on serveroutput on
SQL>
SQL>
SQL> select file_name,status,online_status from dba_data_files where tablespace_name ='TBS_FOLHA' ;

FILE_NAME
--------------------------------------------------------------------------------
STATUS    ONLINE_
--------- -------
G:\ORACLE\ADMIN\DBYOKI01\DATA\TBS_FOLHA01.DBF
AVAILABLE OFFLINE


Elapsed: 00:00:02.34
SQL> alter database datafile 'G:\ORACLE\ADMIN\DBYOKI01\DATA\TBS_FOLHA01.DBF' offline ;

Database altered.

--- mover o arquivo para o local desejado
Elapsed: 00:00:00.09
SQL> alter tablespace TBS_FOLHA rename datafile 'G:\ORACLE\ADMIN\DBYOKI01\DATA\TBS_FOLHA01.DBF' to 'F:\ORACLE\AD
1.DBF' ;

Tablespace altered.

Elapsed: 00:00:03.36
SQL> alter tablespace TBS_FOLHA online ;

Tablespace altered.

Elapsed: 00:00:03.67
SQL> select file_name,status,online_status from dba_data_files where tablespace_name ='TBS_FOLHA' ;

FILE_NAME
--------------------------------------------------------------------------------
STATUS    ONLINE_
--------- -------
F:\ORACLE\ADMIN\DBYOKI01\DATA\TBS_FOLHA01.DBF
AVAILABLE ONLINE

SQL> select name,status from v$datafile  where name ='F:\ORACLE\ADMIN\DBYOKI01\

NAME
-------------------------------------------------------------------------------
STATUS
-------
F:\ORACLE\ADMIN\DBYOKI01\DATA\TBS_FOLHA01.DBF
ONLINE


Elapsed: 00:00:00.04
SQL> disco
Disconnected from Oracle Database 10g Release 10.2.0.4.0 - 64bit Production
SQL> exit

