-- Julio Cesar Correa
-- DBA Oracle

--Making User-Managed Backups of Offline Tablespaces and Datafiles
Note the following guidelines when backing up offline tablespaces:
¦ You cannot offline the SYSTEM tablespace or a tablespace with active rollback
segments. The following procedure cannot be used for such tablespaces.
¦ Assume that a table is in tablespace Primary and its index is in tablespace Index.
Taking tablespace Index offline while leaving tablespace Primary online can
cause errors when DML is issued against the indexed tables located in Primary.
The problem only manifests when the access method chosen by the optimizer
needs to access the indexes in the Index tablespace.

To back up offline tablespaces:

1. 
SELECT TABLESPACE_NAME, FILE_NAME
FROM SYS.DBA_DATA_FILES
WHERE TABLESPACE_NAME = 'USERS';

TABLESPACE_NAME FILE_NAME
------------------------------- --------------------------------
USERS /oracle/oradata/trgt/users01.dbf

2. 
SQL> ALTER TABLESPACE users OFFLINE NORMAL;

3. Back up the offline datafiles. For example:
% cp /oracle/oradata/trgt/users01.dbf /d2/users01_'date "+%m_%d_%y"'.dbf

4. Bring the tablespace online. For example:

ALTER TABLESPACE users ONLINE;

5. Archive the unarchived redo logs so that the redo required to recover the
tablespace backup is archived. 
ALTER SYSTEM ARCHIVE LOG CURRENT;
