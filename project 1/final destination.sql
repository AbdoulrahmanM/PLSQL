--SELECT * FROM DICTIONARY;
--SELECT * FROM SEQ;
--SELECT * from USER_CONSTRAINTS; --get all constraints (need to get the primary key constarint)
--SELECT * from USER_CONS_COLUMNS; --get all constrain and coulmn names (need to get the column name)
--select * from user_tab_columns;
DECLARE
    --Declaring sequence to fetch the table's name  and its primary key column
   CURSOR SEQ_TRIG_CURS
   IS
      SELECT UCC.TABLE_NAME, UCC.COLUMN_NAME
        FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC,USER_TAB_COLUMNS UTC
       WHERE     UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
            AND UCC.COLUMN_NAME=UTC.COLUMN_NAME
             AND UC.CONSTRAINT_TYPE = 'P'
             AND UCC.POSITION = 1
             AND UTC.DATA_TYPE='NUMBER' 
             AND  UCC.TABLE_NAME IN 
             (SELECT OBJECT_NAME FROM USER_OBJECTS
               WHERE OBJECT_TYPE = 'TABLE');
             --variable to store the flag if the count exists or not
             V_CHECK_SEQ number:=0;
BEGIN
    --for looping on sequence records
   FOR TABLE_RECORD IN SEQ_TRIG_CURS
   LOOP
      --get if the seq exists or not
      SELECT COUNT(SEQUENCE_NAME)
         INTO  V_CHECK_SEQ
         FROM SEQ 
        WHERE SEQUENCE_NAME = TABLE_RECORD.TABLE_NAME|| '_SEQ';
        --checking its existance
        IF V_CHECK_SEQ=0 THEN
        --creating the sequence using dynamic SQL if the seq not exist
      EXECUTE IMMEDIATE   'CREATE SEQUENCE '
                       || TABLE_RECORD.TABLE_NAME
                       || '_SEQ START WITH 1000 INCREMENT BY 1';
        --creating the trigger after seq
      EXECUTE IMMEDIATE   'CREATE OR REPLACE TRIGGER '
                       || TABLE_RECORD.TABLE_NAME
                       || '_TRIG BEFORE INSERT ON '
                       || TABLE_RECORD.TABLE_NAME
                       || ' REFERENCING NEW AS New OLD AS Old FOR EACH ROW BEGIN :new.'
                       || TABLE_RECORD.column_name
                       || ' := '
                       || TABLE_RECORD.TABLE_NAME
                       || '_SEQ.nextval; END;';
                       ELSE
                        --creating the trigger if seq exist
       EXECUTE IMMEDIATE   'CREATE OR REPLACE TRIGGER '
                       || TABLE_RECORD.TABLE_NAME
                       || '_TRIG BEFORE INSERT ON '
                       || TABLE_RECORD.TABLE_NAME
                       || ' REFERENCING NEW AS New OLD AS Old FOR EACH ROW BEGIN :new.'
                       || TABLE_RECORD.column_name
                       || ' := '
                       || TABLE_RECORD.TABLE_NAME
                       || '_SEQ.nextval; END;';
                       END IF;
   END LOOP;
END;

show errors;