--Julio Cesar Correa
-- DBA Oracle

--versao EE do oracle
--é necessário ter um backup full via rman
--views onde são "logados" os blocos corrompidos

v$database_block_corruption ;
v$backup_corruption;
v$copy_corruption ;
dba_extents

--rman blockrecover
rman> blockrecover datafile x block x,y ;
rman> blockrecover datafile x block x,y datafile d block d,f;

--blockrecover com until time
rman> blockrecover datafile x block x,y restore until time 'sysdate - 7' ;

----blockrecover para um backup full especifico
rman> blockrecover datafile x block x,y from tag='xxx';

--recuperando todos os blocos corrompidos após o backup validate/backup database
--a lista é encontrada em v$database_block_corruption ;
rman> blockrecover corruption list ;

--usando until time juntamente com o corruption list

rman> BLOCKRECOVER CORRUPTION LIST RESTORE UNTIL TIME 'SYSDATE-7'; 
