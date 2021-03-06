drop schema if exists log cascade;
create schema log;

drop table if exists log.log_job;
CREATE TABLE log.log_job
(
  ID_JOB INTEGER
, CHANNEL_ID VARCHAR(255)
, JOBNAME VARCHAR(255)
, STATUS VARCHAR(15)
, LINES_READ BIGINT
, LINES_WRITTEN BIGINT
, LINES_UPDATED BIGINT
, LINES_INPUT BIGINT
, LINES_OUTPUT BIGINT
, LINES_REJECTED BIGINT
, ERRORS BIGINT
, STARTDATE TIMESTAMP
, ENDDATE TIMESTAMP
, LOGDATE TIMESTAMP
, DEPDATE TIMESTAMP
, REPLAYDATE TIMESTAMP
, LOG_FIELD TEXT
, EXECUTING_SERVER VARCHAR(255)
, EXECUTING_USER VARCHAR(255)
, START_JOB_ENTRY VARCHAR(255)
, CLIENT VARCHAR(255)
)
;
CREATE INDEX IDX_log_job_1 ON log.log_job(ID_JOB)
;
CREATE INDEX IDX_log_job_2 ON log.log_job(ERRORS, STATUS, JOBNAME)
;

drop table if exists log.log_entry;
CREATE TABLE log.log_entry
(
  ID_BATCH INTEGER
, CHANNEL_ID VARCHAR(255)
, LOG_DATE TIMESTAMP
, TRANSNAME VARCHAR(255)
, STEPNAME VARCHAR(255)
, LINES_READ BIGINT
, LINES_WRITTEN BIGINT
, LINES_UPDATED BIGINT
, LINES_INPUT BIGINT
, LINES_OUTPUT BIGINT
, LINES_REJECTED BIGINT
, ERRORS BIGINT
, "RESULT" BOOLEAN
, NR_RESULT_ROWS BIGINT
, NR_RESULT_FILES BIGINT
, LOG_FIELD TEXT
, COPY_NR INTEGER
)
;
CREATE INDEX IDX_log_entry_1 ON log.log_entry(ID_BATCH)
;

--drop table if exists log.log_channel;
--CREATE TABLE log.log_channel
--(
--  ID_BATCH INTEGER
--, CHANNEL_ID VARCHAR(255)
--, LOG_DATE TIMESTAMP
--, LOGGING_OBJECT_TYPE VARCHAR(255)
--, OBJECT_NAME VARCHAR(255)
--, OBJECT_COPY VARCHAR(255)
--, REPOSITORY_DIRECTORY VARCHAR(255)
--, FILENAME VARCHAR(255)
--, OBJECT_ID VARCHAR(255)
--, OBJECT_REVISION VARCHAR(255)
--, PARENT_CHANNEL_ID VARCHAR(255)
--, ROOT_CHANNEL_ID VARCHAR(255)
--)
--;

drop table if exists log.log_transformation;
CREATE TABLE log.log_transformation
(
  ID_BATCH INTEGER
, CHANNEL_ID VARCHAR(255)
, TRANSNAME VARCHAR(255)
, STATUS VARCHAR(15)
, LINES_READ BIGINT
, LINES_WRITTEN BIGINT
, LINES_UPDATED BIGINT
, LINES_INPUT BIGINT
, LINES_OUTPUT BIGINT
, LINES_REJECTED BIGINT
, ERRORS BIGINT
, STARTDATE TIMESTAMP
, ENDDATE TIMESTAMP
, LOGDATE TIMESTAMP
, DEPDATE TIMESTAMP
, REPLAYDATE TIMESTAMP
, LOG_FIELD TEXT
, EXECUTING_SERVER VARCHAR(255)
, EXECUTING_USER VARCHAR(255)
, CLIENT VARCHAR(255)
)
;
CREATE INDEX IDX_log_transformation_1 ON log.log_transformation(ID_BATCH)
;
CREATE INDEX IDX_log_transformation_2 ON log.log_transformation(ERRORS, STATUS, TRANSNAME)
;

drop table if exists log.log_step;
CREATE TABLE log.log_step
(
  ID_BATCH INTEGER
, CHANNEL_ID VARCHAR(255)
, LOG_DATE TIMESTAMP
, TRANSNAME VARCHAR(255)
, STEPNAME VARCHAR(255)
, STEP_COPY SMALLINT
, LINES_READ BIGINT
, LINES_WRITTEN BIGINT
, LINES_UPDATED BIGINT
, LINES_INPUT BIGINT
, LINES_OUTPUT BIGINT
, LINES_REJECTED BIGINT
, ERRORS BIGINT
, LOG_FIELD TEXT
)
;

drop table if exists log.log_extra;
create table log.log_extra (logid serial, logobject varchar, logitem varchar, logmelding varchar, startdate timestamp default now(), enddate timestamp);


