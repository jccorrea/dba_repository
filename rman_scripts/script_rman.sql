-- Julio Cesar Correa
-- DBA Oracle

create script scrpt01

{ allocate channel ch1 device type disk;
allocate channel ch2 device type disk;
allocate channel ch3 device type disk;
backup as compressed backupset database plus archivelog;
sql 'alter system archive log current' ;
}

