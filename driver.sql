-- \o ~/workspace/spool.txt
\! echo make sure that you do a hypnotoad -s ~/gcis/bin/tuba to stop the server
\connect postgres
DROP DATABASE gcis;
CREATE DATABASE gcis WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII' LC_COLLATE = 'C' LC_CTYPE = 'C';
ALTER DATABASE gcis OWNER TO postgres;
\connect gcis
\i GCIS_Latest_Dump.txt
-- \o ~/workspace/GCIS-only.txt
-- \dt
-- \o
\i 2190_context_relationship_term.sql
insert into lexicon values ('cdi', 'Climate Data Initiative');
insert into lexicon values ('concept-map', 'Concept Map');
insert into lexicon values ('mesh', 'MeSH');
insert into context (lexicon_identifier, identifier) values ('cdi', 'health');
insert into context (lexicon_identifier, identifier) values ('mesh', 'resource');
insert into context (lexicon_identifier, identifier) values ('concept-map', 'vectorBorneDisease');
\! echo load-term
-- \i load-term.sav
\i TermRelationship_vector_borne_2_18_160502Y.sql
\! echo load relationship
\i load-rship.sql
\! echo load cmap
\i load-cmap.sql
\! echo load term-map
\i load-term-map.sql
\! echo load term-map-crt
\i load-term-map-crt.sql
\! echo load term-map-GCIS
\i load-term-map-gcis.sql
\! echo Following must be LAST file loaded
\i 2200_convert_uuid_to_varchar.sql
-- \o ~/workspace/CDI-GCIS.txt
-- \dt
-- \d context
-- \d term
-- \d term_map
-- \d term_rel
-- \d relationship
-- \o
