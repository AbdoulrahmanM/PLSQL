--script for inserting the data that we should work on it
--INSERTING INTO CLIENTS TABLE--
INSERT
    INTO CLIENTS (CLIENT_ID, CLIENT_NAME, ADDRESS)
        VALUES ( 1, 'CLIENT 1', 'CAIRO' );
        INSERT
    INTO CLIENTS (CLIENT_ID, CLIENT_NAME, ADDRESS)
        VALUES ( 2, 'CLIENT 2', 'ALEX' );
        INSERT
    INTO CLIENTS (CLIENT_ID, CLIENT_NAME, ADDRESS)
        VALUES ( 3, 'CLIENT 3', 'CAIRO' );
        INSERT
    INTO CLIENTS (CLIENT_ID, CLIENT_NAME, ADDRESS)
        VALUES ( 4, 'CLIENT 4', 'Cairo' );

--INSERTING INTO CONTRACTS TABLE--
INSERT 
    INTO CONTRACTS ( CONTRACT_ID, 
                                CONTRACT_STARTDATE, CONTRACT_ENDDATE, 
                                CONTRACT_TOTAL_FEES, CONTRACT_DEPOSIT_FEES, 
                                CLIENT_ID, CONTRACT_PAYMENT_TYPE)
        VALUES (101, 
                    TO_DATE('01.01.2021', 'DD.MM.YYYY'), TO_DATE('01.01.2023', 'DD.MM.YYYY'),
                    500000, NULL,
                    1, 'ANNUAL');
      INSERT              
    INTO CONTRACTS ( CONTRACT_ID, 
                                CONTRACT_STARTDATE, CONTRACT_ENDDATE, 
                                CONTRACT_TOTAL_FEES, CONTRACT_DEPOSIT_FEES, 
                                CLIENT_ID, CONTRACT_PAYMENT_TYPE)
        VALUES (102, 
                    TO_DATE('01.03.2021', 'DD.MM.YYYY'), TO_DATE('01.03.2024', 'DD.MM.YYYY'),
                    600000, 10000,
                    2, 'QUARTER');
     INSERT               
    INTO CONTRACTS ( CONTRACT_ID, 
                                CONTRACT_STARTDATE, CONTRACT_ENDDATE, 
                                CONTRACT_TOTAL_FEES, CONTRACT_DEPOSIT_FEES, 
                                CLIENT_ID, CONTRACT_PAYMENT_TYPE)
        VALUES (103, 
                    TO_DATE('01.05.2021', 'DD.MM.YYYY'), TO_DATE('01.05.2023', 'DD.MM.YYYY'),
                    400000, 50000,
                    3, 'QUARTER');
       INSERT             
    INTO CONTRACTS ( CONTRACT_ID, 
                                CONTRACT_STARTDATE, CONTRACT_ENDDATE, 
                                CONTRACT_TOTAL_FEES, CONTRACT_DEPOSIT_FEES, 
                                CLIENT_ID, CONTRACT_PAYMENT_TYPE)
        VALUES (104, 
                    TO_DATE('01.03.2021', 'DD.MM.YYYY'), TO_DATE('01.03.2024', 'DD.MM.YYYY'),
                    700000, NULL,
                    4, 'MONTHLY');
    INSERT                
    INTO CONTRACTS ( CONTRACT_ID, 
                                CONTRACT_STARTDATE, CONTRACT_ENDDATE, 
                                CONTRACT_TOTAL_FEES, CONTRACT_DEPOSIT_FEES, 
                                CLIENT_ID, CONTRACT_PAYMENT_TYPE)
        VALUES (105, 
                    TO_DATE('01.04.2021', 'DD.MM.YYYY'), TO_DATE('01.04.2026', 'DD.MM.YYYY'),
                    900000, 300000,
                    1, 'ANNUAL');
        INSERT            
    INTO CONTRACTS ( CONTRACT_ID, 
                                CONTRACT_STARTDATE, CONTRACT_ENDDATE, 
                                CONTRACT_TOTAL_FEES, CONTRACT_DEPOSIT_FEES, 
                                CLIENT_ID, CONTRACT_PAYMENT_TYPE)
        VALUES (106, 
                    TO_DATE('01.01.2021', 'DD.MM.YYYY'), TO_DATE('01.01.2026', 'DD.MM.YYYY'),
                    1000000, 200000,
                    3, 'HALF_ANNUAL');