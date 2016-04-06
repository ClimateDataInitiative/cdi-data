-- make sure that you do a "hypnotoad -s ~/gcis/bin/tuba" to stop the server

\connect postgres
DROP DATABASE gcis;
CREATE DATABASE gcis WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII' LC_COLLATE = 'C' LC_CTYPE = 'C';
ALTER DATABASE gcis OWNER TO postgres;
\connect gcis
\i GCIS_Latest_Dump.txt
\i 2190_context_relationship_term.sql
insert into lexicon values ('cdi', 'Climate Data Initiative');
insert into context (lexicon_identifier, identifier) values ('cdi', 'theme');
\i load-term.sql
\i load-rship.sql
\i load-cmap.sql
\i load-term-map.sql
\i load-term-map-crt.sql
\i 2200_convert_uuid_to_varchar.sql
