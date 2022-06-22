--This procedure to update the values of installment number
/* Formatted on 09/06/2022 9:01:13 PM (QP5 v5.139.911.3011) */
CREATE OR REPLACE PROCEDURE UPDATE_INST_NO
IS
BEGIN
   --updatre the tables by getting the values from the GET_PAYMENT_INSTALL_NUMBER
   UPDATE CONTRACTS
      SET PAYMENTS_INSTALLMENTS_NO =
             GET_PAYMENT_INSTALL_NUMBER (CONTRACT_STARTDATE,CONTRACT_ENDDATE,
                                         CONTRACT_PAYMENT_TYPE);
END;