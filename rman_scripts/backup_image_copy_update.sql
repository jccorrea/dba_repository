-- Julio Cesar Correa
-- DBA Oracle
run
{ 
recover copy of database with tag 'tag_name';
backup incremental lvel 1 for recover of copy with tag 'tag_name' database ;
}