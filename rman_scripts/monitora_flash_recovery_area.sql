-- Julio Cesar Correa
-- DBA Oracle

select name, space_limit max_size,
space_used used, space_reclaimable obsolete,
number_of_files num_files
from v$recovery_file_dest;
