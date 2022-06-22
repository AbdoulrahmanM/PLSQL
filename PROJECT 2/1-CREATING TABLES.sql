--Tables to work on it
--CREATING TABLES--
CREATE TABLE CLIENTS ( CLIENT_ID NUMBER(8) PRIMARY KEY ,
                                        CLIENT_NAME VARCHAR2(50),
                    MOBILE VARCHAR2(50), 
                                        ADDRESS VARCHAR2(100), 
                                       NOTES VARCHAR2(4000) );

CREATE TABLE CONTRACTS ( CONTRACT_ID NUMBER(8) PRIMARY KEY NOT NULL,
                                            CONTRACT_STARTDATE DATE,
                                            CONTRACT_ENDDATE DATE,
                                            PAYMENTS_INSTALLMENTS_NO NUMBER(6),
                                            CONTRACT_TOTAL_FEES NUMBER(10, 2),
                                            CONTRACT_DEPOSIT_FEES NUMBER(10, 2),
                                            CLIENT_ID NUMBER(8),
                                            CONTRACT_PAYMENT_TYPE VARCHAR(250),
                                            NOTES VARCHAR(4000) );

CREATE TABLE INSTALLMENTS_PAID ( INSTALLMENT_ID NUMBER(8) PRIMARY KEY,
                                                        CONTRACT_ID NUMBER(8),
                                                        INSTALLMENT_DATE DATE,
                                                        INSTALLMENT_AMOUNT NUMBER(10, 2),
                                                        PAID NUMBER(1) DEFAULT 0);

ALTER TABLE CONTRACTS
ADD CONSTRAINT FK_CLIENT_ID
FOREIGN KEY (CLIENT_ID) REFERENCES CLIENTS (CLIENT_ID);

ALTER TABLE INSTALLMENTS_PAID
ADD CONSTRAINT FK_CONTRACT_ID
FOREIGN KEY (CONTRACT_ID) REFERENCES CONTRACTS (CONTRACT_ID);
