--PROCEDURE BALANCE PER CUSTOMER
CREATE PROCEDURE [dbo].[BalancePerCustomer]
    @name VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        c.customername AS CustomerName,
        a.accounttype AS AccountType,
        a.balance AS Balance,
        (a.balance + COALESCE(SUM(CASE 
                                     WHEN t.transactiontype = 'Deposit' THEN t.amount 
                                     ELSE -t.amount 
                                   END), 0)) AS CurrentBalance
    FROM dimaccount a
    JOIN dimcustomer c ON a.customerid = c.customerid
    LEFT JOIN facttransaction t ON a.accountid = t.accountid
    WHERE c.customername  LIKE '%' + @name + '%'
      AND a.status = 'active'
    GROUP BY c.customername, a.accounttype, a.balance;
END;

--PROCEDURE DAILY TRANSACTION
CREATE PROCEDURE [dbo].[DailyTransaction]
    @start_date DATE,
    @end_date DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CONVERT(VARCHAR, transactiondate, 23) AS Date,
        COUNT(transactionid) AS TotalTransactions,
        SUM(amount) AS TotalAmount
    FROM 
        FactTransaction
    WHERE 
        CONVERT(VARCHAR, transactiondate, 23) >= @start_date AND CONVERT(VARCHAR, transactiondate, 23) <= @end_date
    GROUP BY 
        CONVERT(VARCHAR, transactiondate, 23)
    ORDER BY 
        Date;
END;

