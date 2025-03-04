CREATE TABLE DimBranch (
    BranchId        INT NOT NULL PRIMARY KEY,
    BranchName      VARCHAR(50),
    BranchLocation  VARCHAR(50)
);

CREATE TABLE DimCustomer (
    CustomerId    INT NOT NULL PRIMARY KEY,
    CustomerName  VARCHAR(50),
    Address       VARCHAR(MAX),
    CityName      VARCHAR(50),
    StateName     VARCHAR(50),
    Age           VARCHAR(3),
    Gender        VARCHAR(10),
    Email         VARCHAR(50)
);

CREATE TABLE DimAccount (
    AccountId     INT NOT NULL PRIMARY KEY,
    CustomerId    INT NOT NULL,
    AccountType   VARCHAR(10),
    Balance       INT NULL,
    DateOpened    DATETIME2 NULL,
    Status        VARCHAR(10),
    FOREIGN KEY (CustomerId) REFERENCES DimCustomer(CustomerId)
);

CREATE TABLE FactTransaction (
    TransactionId   INT NOT NULL PRIMARY KEY,
    AccountId       INT NOT NULL,
    TransactionDate DATETIME2 NULL,
    Amount          INT NULL,
    TransactionType VARCHAR(50),
    BranchId        INT NOT NULL,
    FOREIGN KEY (AccountId) REFERENCES DimAccount(AccountId),
    FOREIGN KEY (BranchId) REFERENCES DimBranch(BranchId)
);