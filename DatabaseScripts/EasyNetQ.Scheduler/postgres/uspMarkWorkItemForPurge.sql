CREATE OR REPLACE FUNCTION "uspMarkWorkItemForPurge"(p_id integer, p_purgedate timestamp without time zone)
  RETURNS void AS
$BODY$BEGIN

update workItemStatus
set purgeDate = p_purgeDate
WHERE workItemId = p_id;
    
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION "uspMarkWorkItemForPurge"(integer, timestamp without time zone)
  OWNER TO postgres;