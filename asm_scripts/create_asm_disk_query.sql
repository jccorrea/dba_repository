-- Julio Cesar Correa
-- DBA Oracle

create diskgroup data
failgroup fg1 disk 'ORCL:VOL1'
failgroup fg2 disk 'ORCL:VOL2' ;

 set linesize 100
 col name format a15
 col path format a15
select name, path from v$asm_disk where name is not null;

select name, type, total_mb, free_mb from v$asm_diskgroup;

--matando o asm

dbca -silent -deleteASM


backup device type disk incremental level 0 as copy tag 'ASM_Migration' database format '+DATA';

run {
backup incremental level 1 for recover of copy with tag 'ASM_Migration' database;
recover copy of database with tag 'ASM_Migration';
}


SQL> alter system set control_files = '+DATA/OCADB/CONTROLFILE/control01.ctl', '+FRA/OCADB/CONTROLFILE/control02.ctl' scope=spfile;
Finally, we must capture


select name from v$controlfile
union
select name from v$datafile
union
select name from v$tempfile
union
select member from v$logfile
union
select filename from v$block_change_tracking
union
select name from v$flashback_database_logfile;