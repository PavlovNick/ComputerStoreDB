CREATE TABLE Product_classification
(
    Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    Name NVARCHAR(40) NOT NULL
);

CREATE TABLE Producer
(
    Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    Name NVARCHAR(40) NOT NULL
);

CREATE TABLE Goods
(
    Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    Name NVARCHAR(40) NOT NULL,
    Product_code BIGINT NOT NULL,
    Product_classification_Id INT REFERENCES Product_classification (Id) NOT NULL,
    Price_grn DECIMAL,
    Price_yo DECIMAL,
    Producer_Id INT REFERENCES Producer (Id) NOT NULL,
    Warranty_period SMALLINT,
    Description NVARCHAR
);

CREATE TABLE Store
(
    Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    Name NVARCHAR(40) NOT NULL,
    Adress NVARCHAR(100),
    Phone_number BIGINT,
    Work_time NVARCHAR(100)
);

CREATE TABLE Position
(
    Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    Name NVARCHAR(40) NOT NULL
);

CREATE TABLE Person
(
    Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    First_name NVARCHAR(30) NOT NULL,
    Last_name NVARCHAR(30) NOT NULL,
    Middle_name NVARCHAR(30) NOT NULL,
    Date_of_birthday DATE
);

CREATE TABLE Employee
(
    Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    Person_Id INT REFERENCES Person (Id) NOT NULL,
    Store_Id INT REFERENCES Store (Id) NOT NULL,
    Position_Id INT REFERENCES Position (Id) NOT NULL,
    Login NVARCHAR(30),
    Password NVARCHAR
);

CREATE TABLE Commodity_circulation
(
    Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    Date DATETIME NOT NULL,
    Store_Id INT REFERENCES Store (Id) NOT NULL,
    Employee_Id INT REFERENCES Employee (Id) NOT NULL,
    Operation_type BIT NOT NULL
);

CREATE TABLE Note_type
(
    Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    Name NVARCHAR(40) NOT NULL
);

CREATE TABLE Note
(
    Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    Note_type_Id INT REFERENCES Note_type (Id) NOT NULL,
    Commodity_circulation_Id INT REFERENCES Commodity_circulation (Id) NOT NULL,
    Goods_Id INT REFERENCES Goods (Id) NOT NULL,
    Product_amount INT NOT NULL,
    Description NVARCHAR
);