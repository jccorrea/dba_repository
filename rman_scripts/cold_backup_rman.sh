##Julio Cesar Correa
##-- DBA Oracle

#!/bin/bash
rman target / <<EOF
shutdown immediate;
startup mount;
backup spfile;
backup database;
alter database open;
delete noprompt obsolete;
quit;
EOF	