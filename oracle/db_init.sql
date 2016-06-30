ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED

exec dbms_xdb.setlistenerlocalaccess(FALSE);

-- Uncomment those to reduce Oracle weight!
-- Disable HTTP access to APEX
-- exec dbms_xdb.sethttpport(0);

-- Disable job queues etc.
-- alter system reset dispatchers scope=spfile sid='*';
-- alter system reset shared_servers scope=spfile sid='*';
-- alter system set job_queue_processes=0 scope=both;
-- alter system set aq_tm_processes=0 scope=both;

-- Disable restricted sessions

alter system disable restricted session;

/
