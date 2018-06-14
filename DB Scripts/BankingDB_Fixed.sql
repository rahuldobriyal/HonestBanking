GO
CREATE DATABASE BankingDB
GO

USE BankingDB
	GO
	create table Account (
        AccountID INT IDENTITY NOT NULL,
        AvailableBalance float,
        CloseDate DATETIME,
        LastActivityDate datetime,
        OpenDate datetime not null,
        PendingBalance float,
        Status varchar(10),
        CustomerID int,
        HomeBranchID int not null,
        AssistingEmployeeID int not null,
        ProductCode varchar(10) not null,
        primary key (AccountID)
    );

    create table AccountTransaction (
        TransactionID numeric(19,0) identity not null,
        Amount float not null,
        FundsAvailableDate datetime not null,
        TransactionDate datetime not null,
        TransactionTypeCode varchar(10),
        AccountID int,
        ExecutionBranchID int,
        TellerEmployeeID int,
        primary key (TransactionID)
    );

    create table Branch (
        BranchID int identity not null,
        Address varchar(30),
        City varchar(20),
        Name varchar(20) not null,
        State varchar(10),
        ZipCode varchar(12),
        primary key (BranchID)
    );

    create table Business (
        IncorporatedDate datetime,
        Name varchar(255) not null,
        StateID varchar(10) not null,
        CustomerID int not null,
        primary key (CustomerID)
    );

    create table Customer (
        CustomerID int identity not null,
        Address varchar(30),
        City varchar(20),
        CustomerTypeCode varchar(1) not null,
        FederationID varchar(12) not null,
        PostalCode varchar(10),
        State varchar(20),
        primary key (CustomerID)
    );

    create table Department (
        DepartmentID int identity not null,
        Name varchar(20) not null,
        primary key (DepartmentID)
    );

	CREATE TABLE Designation(
DesignationID INT IDENTITY NOT NULL,
Name NVARCHAR(30))

    create table Employee (
        EmployeeID int identity not null,
        EndDate datetime,
        FirstName varchar(20) not null,
        LastName varchar(20) not null,
        StartDate datetime not null,
        DesignationID INT,
        AssignedBranchID int,
        DepartmentID int,
        EmployeeManagerID int,
		Status bit not null,
        primary key (EmployeeID)
    );

    create table Individual (
        DateOfBirth datetime,
        FirstName varchar(30) not null,
        LastName varchar(30) not null,
        CustomerID int not null,
        primary key (CustomerID)
    );

    create table Officer (
        OfficerID int identity not null,
        EndDate datetime,
        FirstName varchar(30) not null,
        LastName varchar(30) not null,
        StartDate datetime not null,
        DesignationID INT,
        CustomerID int,
        primary key (OfficerID)
    );

    create table Product (
        ProductCode varchar(10) not null,
        CreationDate datetime,
        ExpiryDate datetime,
        Name varchar(50) not null,
        ProductTypeCode varchar(255),
        primary key (ProductCode)
    );

    create table ProductType (
        ProductTypeCode varchar(255) not null,
        Name varchar(50),
        primary key (ProductTypeCode)
    );

	CREATE TABLE AdminWorkCategory (
CategoryID INT IDENTITY(1,1) PRIMARY KEY,
CategoryName NVARCHAR(30),
CategoryDescription NVARCHAR(100));

CREATE TABLE States(
  
StateID [int] IDENTITY(1,1) NOT NULL,
StateCode [nchar](2) NOT NULL,
StateName [nvarchar](128) NOT NULL,

CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(  StateID ASC )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]) 
ON [PRIMARY]

    alter table Account 
        add constraint AccountCustomer_FK 
        foreign key (CustomerID) 
        references Customer;

    alter table Account 
        add constraint AccountBranch_FK 
        foreign key (HomeBranchID) 
        references Branch;

    alter table Account 
        add constraint AccountEmployee_FK 
        foreign key (AssistingEmployeeID) 
        references Employee;

    alter table Account 
        add constraint Account_Product_FK 
        foreign key (ProductCode) 
        references Product;

    alter table AccountTransaction 
        add constraint AccTransaction_account_FK 
        foreign key (AccountID) 
        references Account;

    alter table AccountTransaction 
        add constraint acc_transaction_branch_FK 
        foreign key (ExecutionBranchID) 
        references Branch;

    alter table AccountTransaction 
        add constraint acc_transaction_employee_FK 
        foreign key (TellerEmployeeID) 
        references Employee;

    alter table Business 
        add constraint business_employee_FK 
        foreign key (CustomerID) 
        references Customer;

    alter table Employee 
        add constraint employee_branch_FK 
        foreign key (AssignedBranchID) 
        references Branch;

    alter table Employee 
        add constraint employee_department_FK 
        foreign key (DepartmentID) 
        references Department;

    alter table Employee 
        add constraint employee_employee_FK 
        foreign key (EmployeeManagerID) 
        references Employee(EmployeeID);
		
    alter table Designation
	add constraint designation_primary_pk
	primary key (DesignationID)
	
	alter table Employee
	add constraint employee_designation_FK
	foreign key (DesignationID)
	references Designation(DesignationID)

    alter table Individual 
        add constraint individual_customer_FK 
        foreign key (CustomerID) 
        references Customer;

    alter table Officer 
        add constraint officer_customer_FK 
        foreign key (CustomerID) 
        references Customer;

    alter table Product 
        add constraint product_product_type_FK 
        foreign key (ProductTypeCode) 
        references ProductType;
 
-- ======================================================================== 
-- ========================================================================
-- ========================================================================
 

/* begin data population */

-- department data

-- Disable 
SET IDENTITY_INSERT Department  ON;

---------------------
insert into Department (DepartmentID, Name)
values (1, 'Operations');
---------------------
insert into Department (DepartmentID, Name)
values (2, 'Loans');
---------------------
insert into Department (DepartmentID, Name)
values (3, 'Administration');

insert into Department (DepartmentID, Name)
values (4, 'IT');


-- Enable
SET IDENTITY_INSERT Department  OFF;

-- Branch data 

SET IDENTITY_INSERT Branch  ON;

---------------------
insert into Branch (BranchID, Name, Address, City, State, ZipCode)
values (1, 'Headquarters', '3882 Main St.', 'Waltham', 'MA', '02451');
---------------------
insert into Branch (BranchID, Name, Address, City, State, ZipCode)
values (2, 'Woburn Branch', '422 Maple St.', 'Woburn', 'MA', '01801');
---------------------
insert into Branch (BranchID, Name, Address, City, State, ZipCode)
values (3, 'Quincy Branch', '125 Presidential Way', 'Quincy', 'MA', '02169');
---------------------
insert into Branch (BranchID, Name, Address, City, State, ZipCode)
values (4, 'So. NH Branch', '378 Maynard Ln.', 'Salem', 'NH', '03079');

SET IDENTITY_INSERT Branch  OFF;

SET IDENTITY_INSERT Designation ON;
INSERT INTO Designation(DesignationID,Name) VALUES(1,'President')
INSERT INTO Designation(DesignationID,Name) VALUES(2,'Vice President')
INSERT INTO Designation(DesignationID,Name) VALUES(3,'Treasurer')
INSERT INTO Designation(DesignationID,Name)VALUES(4,'Operations Manager')
INSERT INTO Designation(DesignationID,Name) VALUES(5,'Loan Manager')
INSERT INTO Designation(DesignationID,Name)VALUES(6,'Head Teller')
INSERT INTO Designation(DesignationID,Name)VALUES(7,'Teller')

SET IDENTITY_INSERT Designation  OFF;

-- Employee data  

SET IDENTITY_INSERT Employee  ON;
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (1, 'Michael', 'Smith', Convert(Datetime,'2001-06-22',120), 
  (select DepartmentID from Department where Name = 'Administration'), 
  (select DesignationID FROM Designation WHERE Name='President'), 
  (select BranchID from Branch where Name = 'Headquarters'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (2, 'Susan', 'Barker',Convert(Datetime, '2002-09-12',120), 
  (select DepartmentID from Department where Name = 'Administration'), 
  (select DesignationID FROM Designation WHERE Name='Vice President'), 
   (select BranchID from Branch where Name = 'Headquarters'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (3, 'Robert', 'Tyler',Convert(Datetime, '2000-02-09',120),
 (select DepartmentID from Department where Name = 'Administration'), 
  (select DesignationID FROM Designation WHERE Name='Treasurer'), 
   (select BranchID from Branch where Name = 'Headquarters'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (4, 'Susan', 'Hawthorne',Convert(Datetime, '2002-04-24',120), 
  (select DepartmentID from Department where Name = 'Operations'), 
  (select DesignationID FROM Designation WHERE Name='Operations Manager'), 
   (select BranchID from Branch where Name = 'Headquarters'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (5, 'John', 'Gooding',Convert(Datetime, '2003-11-14',120), 
 (select DepartmentID from Department where Name = 'Loans'), 
  (select DesignationID FROM Designation WHERE Name='Loan Manager'), 
 (select BranchID from Branch where Name = 'Headquarters'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (6, 'Helen', 'Fleming',Convert(Datetime, '2004-03-17',120), 
  (select DepartmentID from Department where Name = 'Operations'), 
  (select DesignationID FROM Designation WHERE Name='Head Teller'), 
 (select BranchID from Branch where Name = 'Headquarters'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (7, 'Chris', 'Tucker',Convert(Datetime, '2004-09-15',120), 
  (select DepartmentID from Department where Name = 'Operations'), 
  (select DesignationID FROM Designation WHERE Name='Teller'), 
  (select BranchID from Branch where Name = 'Headquarters'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (8, 'Sarah', 'Parker',Convert(Datetime, '2002-12-02',120), 
(select DepartmentID from Department where Name = 'Operations'), 
  (select DesignationID FROM Designation WHERE Name='Teller'), 
 (select BranchID from Branch where Name = 'Headquarters'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (9, 'Jane', 'Grossman',Convert(Datetime, '2002-05-03',120), 
 (select DepartmentID from Department where Name = 'Operations'), 
  (select DesignationID FROM Designation WHERE Name='Teller'), 
  (select BranchID from Branch where Name = 'Headquarters'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (10, 'Paula', 'Roberts',Convert(Datetime, '2002-07-27',120), 
 (select DepartmentID from Department where Name = 'Operations'), 
  (select DesignationID FROM Designation WHERE Name='Head Teller'), 
   (select BranchID from Branch where Name = 'Woburn Branch'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (11, 'Thomas', 'Ziegler',Convert(Datetime, '2000-10-23',120), 
  (select DepartmentID from Department where Name = 'Operations'), 
  (select DesignationID FROM Designation WHERE Name='Teller'), 
   (select BranchID from Branch where Name = 'Woburn Branch'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (12, 'Samantha', 'Jameson',Convert(Datetime, '2003-01-08',120), 
 (select DepartmentID from Department where Name = 'Operations'), 
  (select DesignationID FROM Designation WHERE Name='Teller'), 
   (select BranchID from Branch where Name = 'Woburn Branch'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (13, 'John', 'Blake',Convert(Datetime, '2000-05-11',120), 
 (select DepartmentID from Department where Name = 'Operations'), 
  (select DesignationID FROM Designation WHERE Name='Head Teller'), 
 (select BranchID from Branch where Name = 'Quincy Branch'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (14, 'Cindy', 'Mason',Convert(Datetime, '2002-08-09',120), 
  (select DepartmentID from Department where Name = 'Operations'), 
  (select DesignationID FROM Designation WHERE Name='Teller'), 
  (select BranchID from Branch where Name = 'Quincy Branch'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (15, 'Frank', 'Portman',Convert(Datetime, '2003-04-01',120), 
 (select DepartmentID from Department where Name= 'Operations'), 
  (select DesignationID FROM Designation WHERE Name='Teller'), 
  (select BranchID from Branch where Name = 'Quincy Branch'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (16, 'Theresa', 'Markham',Convert(Datetime, '2001-03-15',120), 
 (select DepartmentID from Department where Name= 'Operations'), 
  (select DesignationID FROM Designation WHERE Name='Head Teller'), 
 (select BranchID from Branch where Name = 'So. NH Branch'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (17, 'Beth', 'Fowler',Convert(Datetime, '2002-06-29',120), 
  (select DepartmentID from Department where Name = 'Operations'), 
  (select DesignationID FROM Designation WHERE Name='Teller'), 
 (select BranchID from Branch where Name = 'So. NH Branch'),1);
---------------------
insert into Employee (EmployeeID, FirstName, LastName, StartDate, 
  DepartmentID, DesignationID, AssignedBranchID,Status)
values (18, 'Rick', 'Tulman',Convert(Datetime, '2002-12-12',120), 
(select DepartmentID from Department where Name = 'Operations'), 
  (select DesignationID FROM Designation WHERE Name='Teller'), 
 (select BranchID from Branch where Name = 'So. NH Branch'),1);
  
  
SET IDENTITY_INSERT Employee  OFF;  
  

-- create data for self-referencing foreign key 'superior_emp_id'  
create   table emp_tmp(EmployeeID int, first_name varchar (20), last_name varchar (20)); 

---------------------
update Employee set EmployeeManagerID =
 (select EmployeeID from emp_tmp where LastName = 'Smith' and FirstName = 'Michael')
where ((LastName = 'Barker' and FirstName = 'Susan')
  or (LastName = 'Tyler' and FirstName = 'Robert'));
---------------------
update Employee set EmployeeManagerID =
 (select EmployeeID from emp_tmp where LastName = 'Tyler' and FirstName = 'Robert')
where LastName = 'Hawthorne' and FirstName = 'Susan';
---------------------
update Employee set EmployeeManagerID =
 (select EmployeeID from emp_tmp where LastName = 'Hawthorne' and FirstName = 'Susan')
where ((LastName = 'Gooding' and FirstName = 'John')
  or (LastName = 'Fleming' and FirstName = 'Helen')
  or (LastName = 'Roberts' and FirstName = 'Paula') 
  or (LastName = 'Blake' and FirstName = 'John') 
  or (LastName = 'Markham' and FirstName = 'Theresa')); 
---------------------
update Employee set EmployeeManagerID =
 (select EmployeeID from emp_tmp where LastName = 'Fleming' and FirstName = 'Helen')
where ((LastName = 'Tucker' and FirstName = 'Chris') 
  or (LastName = 'Parker' and FirstName = 'Sarah') 
  or (LastName = 'Grossman' and FirstName = 'Jane'));  
---------------------
update Employee set EmployeeManagerID =
 (select EmployeeID from emp_tmp where LastName = 'Roberts' and FirstName = 'Paula')
where ((LastName = 'Ziegler' and FirstName = 'Thomas')  
  or (LastName = 'Jameson' and FirstName = 'Samantha'));   
---------------------
update Employee set EmployeeManagerID =
 (select EmployeeID from emp_tmp where LastName = 'Blake' and FirstName = 'John')
where ((LastName = 'Mason' and FirstName = 'Cindy')   
  or (LastName = 'Portman' and FirstName = 'Frank'));    
---------------------
update Employee set EmployeeManagerID =
 (select EmployeeID from emp_tmp where LastName = 'Markham' and FirstName = 'Theresa')
where ((LastName = 'Fowler' and FirstName = 'Beth')   
  or (LastName = 'Tulman' and FirstName = 'Rick'));    

drop table emp_tmp;

-- product type data 
---------------------
insert into ProductType(ProductTypeCode, Name)
values ('Account','Customer Accounts');
---------------------
insert into ProductType(ProductTypeCode, Name)
values ('LOAN','Individual and Business Loans');
---------------------
insert into ProductType(ProductTypeCode, Name)
values ('INSURANCE','Insurance Offerings');

-- product data  
---------------------
insert into Product (ProductCode, Name, ProductTypeCode, CreationDate)
values ('CHK','checking Account','Account',Convert(Datetime,'2000-01-01',120));
---------------------
insert into Product (ProductCode, Name, ProductTypeCode, CreationDate)
values ('SAV','savings Account','Account',Convert(Datetime,'2000-01-01',120));
---------------------
insert into Product (ProductCode, Name, ProductTypeCode, CreationDate)
values ('MM','money market Account','Account',Convert(Datetime,'2000-01-01',120));
---------------------
insert into Product (ProductCode, Name, ProductTypeCode, CreationDate)
values ('CD','certificate of deposit','Account',Convert(Datetime,'2000-01-01',120));
---------------------
insert into Product (ProductCode, Name, ProductTypeCode, CreationDate)
values ('MRT','home mortgage','LOAN',Convert(Datetime,'2000-01-01',120));
---------------------
insert into Product (ProductCode, Name, ProductTypeCode, CreationDate)
values ('AUT','auto loan','LOAN',Convert(Datetime,'2000-01-01',120));
---------------------
insert into Product (ProductCode, Name, ProductTypeCode, CreationDate)
values ('BUS','Business line of credit','LOAN',Convert(Datetime,'2000-01-01',120));
---------------------
insert into Product (ProductCode, Name, ProductTypeCode, CreationDate)
values ('SBL','small Business loan','LOAN',Convert(Datetime,'2000-01-01',120));

-- residential Customer data  

SET IDENTITY_INSERT Customer ON;

---------------------
insert into Customer (CustomerID, FederationID, CustomerTypeCode,
  Address, City, State, PostalCode)
values (1, '111-11-1111', 'I', '47 Mockingbird Ln', 'Lynnfield', 'MA', '01940');
---------------------
insert into Individual (CustomerID, FirstName, LastName, DateOfBirth)
select CustomerID, 'James', 'Hadley', Convert(Datetime,'1972-04-22',120) from Customer
where FederationID = '111-11-1111';
---------------------
insert into Customer (CustomerID, FederationID, CustomerTypeCode,
  Address, City, State, PostalCode)
values (2, '222-22-2222', 'I', '372 Clearwater Blvd', 'Woburn', 'MA', '01801');
---------------------
insert into Individual (CustomerID, FirstName, LastName, DateOfBirth)
select CustomerID, 'Susan', 'Tingley', Convert(Datetime,'1968-08-15',120) from Customer
where FederationID = '222-22-2222';
---------------------
insert into Customer (CustomerID, FederationID, CustomerTypeCode,
  Address, City, State, PostalCode)
values (3, '333-33-3333', 'I', '18 Jessup Rd', 'Quincy', 'MA', '02169');
---------------------
insert into Individual (CustomerID, FirstName, LastName, DateOfBirth)
select CustomerID, 'Frank', 'Tucker',Convert(Datetime, '1958-02-06',120) from Customer
where FederationID = '333-33-3333';
---------------------
insert into Customer (CustomerID, FederationID, CustomerTypeCode,
  Address, City, State, PostalCode)
values (4, '444-44-4444', 'I', '12 Buchanan Ln', 'Waltham', 'MA', '02451');
---------------------
insert into Individual (CustomerID, FirstName, LastName, DateOfBirth)
select CustomerID, 'John', 'Hayward',Convert(Datetime,'1966-12-22',120) from Customer
where FederationID = '444-44-4444';
---------------------
insert into Customer (CustomerID, FederationID, CustomerTypeCode,
  Address, City, State, PostalCode)
values (5, '555-55-5555', 'I', '2341 Main St', 'Salem', 'NH', '03079');
---------------------
insert into Individual (CustomerID, FirstName, LastName, DateOfBirth)
select CustomerID, 'Charles', 'Frasier',Convert(Datetime, '1971-08-25',120) from Customer
where FederationID = '555-55-5555';
---------------------
insert into Customer (CustomerID, FederationID, CustomerTypeCode,
  Address, City, State, PostalCode)
values (6, '666-66-6666', 'I', '12 Blaylock Ln', 'Waltham', 'MA', '02451');
---------------------
insert into Individual (CustomerID, FirstName, LastName, DateOfBirth)
select CustomerID, 'John', 'Spencer',Convert(Datetime, '1962-09-14',120)from Customer
where FederationID = '666-66-6666';
---------------------
insert into Customer (CustomerID, FederationID, CustomerTypeCode,
  Address, City, State, PostalCode)
values (7, '777-77-7777', 'I', '29 Admiral Ln', 'Wilmington', 'MA', '01887');
---------------------
insert into Individual (CustomerID, FirstName, LastName, DateOfBirth)
select CustomerID, 'Margaret', 'Young',Convert(Datetime, '1947-03-19' ,120)from Customer
where FederationID = '777-77-7777';
---------------------
insert into Customer (CustomerID, FederationID, CustomerTypeCode,
  Address, City, State, PostalCode)
values (8, '888-88-8888', 'I', '472 Freedom Rd', 'Salem', 'NH', '03079');
---------------------
insert into Individual (CustomerID, FirstName, LastName, DateOfBirth)
select CustomerID, 'Louis', 'Blake',Convert(Datetime, '1977-07-01' ,120)from Customer
where FederationID = '888-88-8888';
---------------------
insert into Customer (CustomerID, FederationID, CustomerTypeCode,
  Address, City, State, PostalCode)
values (9, '999-99-9999', 'I', '29 Maple St', 'Newton', 'MA', '02458');
---------------------
insert into Individual (CustomerID, FirstName, LastName, DateOfBirth)
select CustomerID, 'Richard', 'Farley',Convert(Datetime, '1968-06-16',120) from Customer
where FederationID = '999-99-9999';

-- corporate Customer data 
---------------------
insert into Customer (CustomerID, FederationID, CustomerTypeCode,
  Address, City, State, PostalCode)
values (10, '04-1111111', 'B', '7 Industrial Way', 'Salem', 'NH', '03079');
---------------------
insert into Customer (CustomerID, FederationID, CustomerTypeCode,
  Address, City, State, PostalCode)
values (11, '04-2222222', 'B', '287A Corporate Ave', 'Wilmington', 'MA', '01887');
---------------------
insert into Customer (CustomerID, FederationID, CustomerTypeCode,
  Address, City, State, PostalCode)
values (12, '04-3333333', 'B', '789 Main St', 'Salem', 'NH', '03079');
---------------------
insert into Customer (CustomerID, FederationID, CustomerTypeCode,
  Address, City, State, PostalCode)
values (13, '04-4444444', 'B', '4772 Presidential Way', 'Quincy', 'MA', '02169');

SET IDENTITY_INSERT Customer OFF;


SET IDENTITY_INSERT Officer ON;

---------------------
insert into Business (CustomerID, Name, StateID, IncorporatedDate)
select CustomerID, 'Chilton Engineering', '12-345-678',Convert(Datetime, '1995-05-01',120) from Customer
where FederationID = '04-1111111';
---------------------
insert into Officer (OfficerID, CustomerID, FirstName, LastName,
  DesignationID, StartDate)
select 1, CustomerID, 'John', 'Chilton',(SELECT DesignationID From Designation WHERE Name='President'), Convert(Datetime,'1995-05-01',120)
from Customer
where FederationID = '04-1111111';

---------------------
insert into Business (CustomerID, Name, StateID, IncorporatedDate)
select CustomerID, 'Northeast Cooling Inc.', '23-456-789',Convert(Datetime, '2001-01-01' ,120)from Customer
where FederationID = '04-2222222';
---------------------
insert into Officer (OfficerID, CustomerID, FirstName, LastName,
  DesignationID, StartDate)
select 2, CustomerID, 'Paul', 'Hardy',(SELECT DesignationID From Designation WHERE Name='President'),Convert(Datetime, '2001-01-01',120)
from Customer
where FederationID = '04-2222222';

---------------------
insert into Business (CustomerID, Name, StateID, IncorporatedDate)
select CustomerID, 'Superior Auto Body', '34-567-890',Convert(Datetime, '2002-06-30',120) from Customer
where FederationID = '04-3333333';
---------------------
insert into Officer (OfficerID, CustomerID, FirstName, LastName,
  DesignationID, StartDate)
select 3, CustomerID, 'Carl', 'Lutz', (SELECT DesignationID From Designation WHERE Name='President'),Convert(Datetime, '2002-06-30',120)
from Customer
where FederationID = '04-3333333';

---------------------
insert into Business (CustomerID, Name, StateID, IncorporatedDate)
select CustomerID, 'AAA Insurance Inc.', '45-678-901',Convert(Datetime, '1999-05-01',120) from Customer
where FederationID = '04-4444444';
---------------------
insert into Officer (OfficerID, CustomerID, FirstName, LastName,
  DesignationID, StartDate)
select 4, CustomerID, 'Stanley', 'Cheswick', (SELECT DesignationID From Designation WHERE Name='President'),Convert(Datetime, '1999-05-01',120)
from Customer
where FederationID = '04-4444444';



SET IDENTITY_INSERT Officer OFF;
 
-- ======================================================================== 
-- ======= Account.
-- ========================================================================

-- residential Account data 
---------------------
insert into Account ( ProductCode, CustomerID, OpenDate,
  LastActivityDate, Status, HomeBranchID,
  AssistingEmployeeID, AvailableBalance, PendingBalance)
select   a.ProductCode, c.CustomerID, a.OpenDate, a.LastDate, 'ACTIVE',
  e.BranchID, e.EmployeeID, a.avail, a.pend
from Customer c cross join 
 (select top 1 b.BranchID, e.EmployeeID 
  from Branch b inner join Employee e on e.AssignedBranchID = b.BranchID
  where b.City = 'Woburn' ) e
  cross join
 (select 'CHK' ProductCode,Convert(Datetime, '2000-01-15',120) OpenDate,Convert(Datetime, '2005-01-04',120) LastDate,
    1057.75 avail, 1057.75 pend  union all
  select 'SAV' ProductCode,Convert(Datetime, '2000-01-15',120) OpenDate,Convert(Datetime, '2004-12-19',120) LastDate,
    500.00 avail, 500.00 pend   union all
  select 'CD' ProductCode,Convert(Datetime, '2004-06-30',120) OpenDate,Convert(Datetime, '2004-06-30' ,120)LastDate,
    3000.00 avail, 3000.00 pend   ) a
where c.FederationID = '111-11-1111';
---------------------
insert into Account (  ProductCode, CustomerID, OpenDate,
  LastActivityDate, Status, HomeBranchID,
  AssistingEmployeeID, AvailableBalance, PendingBalance)
select   a.ProductCode, c.CustomerID, a.OpenDate, a.LastDate, 'ACTIVE',
  e.BranchID, e.EmployeeID, a.avail, a.pend
from Customer c cross join 
 (select top 1  b.BranchID, e.EmployeeID 
  from Branch b inner join Employee e on e.AssignedBranchID = b.BranchID
  where b.City = 'Woburn' ) e
  cross join
 (select 'CHK' ProductCode,Convert(Datetime, '2001-03-12',120) OpenDate,Convert(Datetime, '2004-12-27' ,120)LastDate,
    2258.02 avail, 2258.02 pend   union all
  select 'SAV' ProductCode,Convert(Datetime, '2001-03-12',120) OpenDate,Convert(Datetime, '2004-12-11' ,120)LastDate,
    200.00 avail, 200.00 pend   ) a
where c.FederationID = '222-22-2222';
---------------------
insert into Account (  ProductCode, CustomerID, OpenDate,
  LastActivityDate, Status, HomeBranchID,
  AssistingEmployeeID, AvailableBalance, PendingBalance)
select   a.ProductCode, c.CustomerID, a.OpenDate, a.LastDate, 'ACTIVE',
  e.BranchID, e.EmployeeID, a.avail, a.pend
from Customer c cross join 
 (select top 1  b.BranchID, e.EmployeeID 
  from Branch b inner join Employee e on e.AssignedBranchID = b.BranchID
  where b.City = 'Quincy' ) e
  cross join
 (select 'CHK' ProductCode,Convert(Datetime, '2002-11-23' ,120)OpenDate,Convert(Datetime, '2004-11-30' ,120)LastDate,
    1057.75 avail, 1057.75 pend   union all
  select 'MM' ProductCode,Convert(Datetime, '2002-12-15',120) OpenDate,Convert(Datetime, '2004-12-05' ,120)LastDate,
    2212.50 avail, 2212.50 pend  ) a
where c.FederationID = '333-33-3333';
---------------------
insert into Account (  ProductCode, CustomerID, OpenDate,
  LastActivityDate, Status, HomeBranchID,
  AssistingEmployeeID, AvailableBalance, PendingBalance)
select   a.ProductCode, c.CustomerID, a.OpenDate, a.LastDate, 'ACTIVE',
  e.BranchID, e.EmployeeID, a.avail, a.pend
from Customer c cross join 
 (select top 1  b.BranchID, e.EmployeeID 
  from Branch b inner join Employee e on e.AssignedBranchID = b.BranchID
  where b.City = 'Waltham' ) e
  cross join
 (select 'CHK' ProductCode,Convert(Datetime, '2003-09-12' ,120)OpenDate,Convert(Datetime, '2005-01-03' ,120)LastDate,
    534.12 avail, 534.12 pend   union all
  select 'SAV' ProductCode,Convert(Datetime, '2000-01-15' ,120)OpenDate,Convert(Datetime, '2004-10-24',120) LastDate,
    767.77 avail, 767.77 pend   union all
  select 'MM' ProductCode,Convert(Datetime, '2004-09-30',120) OpenDate,Convert(Datetime, '2004-11-11' ,120)LastDate,
    5487.09 avail, 5487.09 pend ) a
where c.FederationID = '444-44-4444';
---------------------
insert into Account (  ProductCode, CustomerID, OpenDate,
  LastActivityDate, Status, HomeBranchID,
  AssistingEmployeeID, AvailableBalance, PendingBalance)
select   a.ProductCode, c.CustomerID, a.OpenDate, a.LastDate, 'ACTIVE',
  e.BranchID, e.EmployeeID, a.avail, a.pend
from Customer c cross join 
 (select top 1  b.BranchID, e.EmployeeID 
  from Branch b inner join Employee e on e.AssignedBranchID = b.BranchID
  where b.City = 'Salem' ) e
  cross join
 (select 'CHK' ProductCode, Convert(Datetime,'2004-01-27' ,120)OpenDate,Convert(Datetime, '2005-01-05' ,120)LastDate,
    2237.97 avail, 2897.97 pend ) a
where c.FederationID = '555-55-5555';
---------------------
insert into Account (  ProductCode, CustomerID, OpenDate,
  LastActivityDate, Status, HomeBranchID,
  AssistingEmployeeID, AvailableBalance, PendingBalance)
select   a.ProductCode, c.CustomerID, a.OpenDate, a.LastDate, 'ACTIVE',
  e.BranchID, e.EmployeeID, a.avail, a.pend
from Customer c cross join 
 (select top 1  b.BranchID, e.EmployeeID 
  from Branch b inner join Employee e on e.AssignedBranchID = b.BranchID
  where b.City = 'Waltham' ) e
  cross join
 (select 'CHK' ProductCode,Convert(Datetime, '2002-08-24' ,120)OpenDate,Convert(Datetime, '2004-11-29',120) LastDate,
    122.37 avail, 122.37 pend   union all
  select 'CD' ProductCode,Convert(Datetime, '2004-12-28' ,120)OpenDate,Convert(Datetime, '2004-12-28',120) LastDate,
    10000.00 avail, 10000.00 pend  ) a
where c.FederationID = '666-66-6666';
---------------------
insert into Account (  ProductCode, CustomerID, OpenDate,
  LastActivityDate, Status, HomeBranchID,
  AssistingEmployeeID, AvailableBalance, PendingBalance)
select   a.ProductCode, c.CustomerID, a.OpenDate, a.LastDate, 'ACTIVE',
  e.BranchID, e.EmployeeID, a.avail, a.pend
from Customer c cross join 
 (select top 1  b.BranchID, e.EmployeeID 
  from Branch b inner join Employee e on e.AssignedBranchID = b.BranchID
  where b.City = 'Woburn' ) e
  cross join
 (select 'CD' ProductCode,Convert(Datetime, '2004-01-12' ,120)OpenDate, Convert(Datetime,'2004-01-12' ,120)LastDate,
    5000.00 avail, 5000.00 pend ) a
where c.FederationID = '777-77-7777';
---------------------
insert into Account (  ProductCode, CustomerID, OpenDate,
  LastActivityDate, Status, HomeBranchID,
  AssistingEmployeeID, AvailableBalance, PendingBalance)
select   a.ProductCode, c.CustomerID, a.OpenDate, a.LastDate, 'ACTIVE',
  e.BranchID, e.EmployeeID, a.avail, a.pend
from Customer c cross join 
 (select top 1  b.BranchID, e.EmployeeID 
  from Branch b inner join Employee e on e.AssignedBranchID = b.BranchID
  where b.City = 'Salem' ) e
  cross join
 (select 'CHK' ProductCode,Convert(Datetime, '2001-05-23' ,120)OpenDate,Convert(Datetime, '2005-01-03' ,120)LastDate,
    3487.19 avail, 3487.19 pend   union all
  select 'SAV' ProductCode,Convert(Datetime, '2001-05-23' ,120)OpenDate,Convert(Datetime, '2004-10-12' ,120)LastDate,
    387.99 avail, 387.99 pend  ) a
where c.FederationID = '888-88-8888';
---------------------
insert into Account (  ProductCode, CustomerID, OpenDate,
  LastActivityDate, Status, HomeBranchID,
  AssistingEmployeeID, AvailableBalance, PendingBalance)
select   a.ProductCode, c.CustomerID, a.OpenDate, a.LastDate, 'ACTIVE',
  e.BranchID, e.EmployeeID, a.avail, a.pend
from Customer c cross join 
 (select top 1  b.BranchID, e.EmployeeID 
  from Branch b inner join Employee e on e.AssignedBranchID = b.BranchID
  where b.City = 'Waltham' ) e
  cross join
 (select 'CHK' ProductCode,Convert(Datetime, '2003-07-30',120) OpenDate,Convert(Datetime, '2004-12-15' ,120)LastDate,
    125.67 avail, 125.67 pend   union all
  select 'MM' ProductCode,Convert(Datetime, '2004-10-28' ,120)OpenDate,Convert(Datetime, '2004-10-28' ,120)LastDate,
    9345.55 avail, 9845.55 pend   union all
  select 'CD' ProductCode,Convert(Datetime, '2004-06-30' ,120)OpenDate,Convert(Datetime, '2004-06-30' ,120)LastDate,
    1500.00 avail, 1500.00 pend  ) a
where c.FederationID = '999-99-9999';

-- corporate Account data  
---------------------
insert into Account (  ProductCode, CustomerID, OpenDate,
  LastActivityDate, Status, HomeBranchID,
  AssistingEmployeeID, AvailableBalance, PendingBalance)
select   a.ProductCode, c.CustomerID, a.OpenDate, a.LastDate, 'ACTIVE',
  e.BranchID, e.EmployeeID, a.avail, a.pend
from Customer c cross join 
 (select top 1  b.BranchID, e.EmployeeID 
  from Branch b inner join Employee e on e.AssignedBranchID = b.BranchID
  where b.City = 'Salem' ) e
  cross join
 (select 'CHK' ProductCode,Convert(Datetime, '2002-09-30' ,120)OpenDate, Convert(Datetime,'2004-12-15' ,120)LastDate,
    23575.12 avail, 23575.12 pend   union all
  select 'BUS' ProductCode,Convert(Datetime, '2002-10-01' ,120)OpenDate,Convert(Datetime, '2004-08-28' ,120)LastDate,
    0 avail, 0 pend  ) a
where c.FederationID = '04-1111111';
---------------------
insert into Account (  ProductCode, CustomerID, OpenDate,
  LastActivityDate, Status, HomeBranchID,
  AssistingEmployeeID, AvailableBalance, PendingBalance)
select   a.ProductCode, c.CustomerID, a.OpenDate, a.LastDate, 'ACTIVE',
  e.BranchID, e.EmployeeID, a.avail, a.pend
from Customer c cross join 
 (select top 1  b.BranchID, e.EmployeeID 
  from Branch b inner join Employee e on e.AssignedBranchID = b.BranchID
  where b.City = 'Woburn' ) e
  cross join
 (select 'BUS' ProductCode,Convert(Datetime, '2004-03-22',120) OpenDate,Convert(Datetime, '2004-11-14',120) LastDate,
    9345.55 avail, 9345.55 pend ) a
where c.FederationID = '04-2222222';
---------------------
insert into Account (  ProductCode, CustomerID, OpenDate,
  LastActivityDate, Status, HomeBranchID,
  AssistingEmployeeID, AvailableBalance, PendingBalance)
select   a.ProductCode, c.CustomerID, a.OpenDate, a.LastDate, 'ACTIVE',
  e.BranchID, e.EmployeeID, a.avail, a.pend
from Customer c cross join 
 (select top 1  b.BranchID, e.EmployeeID 
  from Branch b inner join Employee e on e.AssignedBranchID = b.BranchID
  where b.City = 'Salem' ) e
  cross join
 (select 'CHK' ProductCode,Convert(Datetime, '2003-07-30',120) OpenDate,Convert(Datetime, '2004-12-15' ,120)LastDate,
    38552.05 avail, 38552.05 pend ) a
where c.FederationID = '04-3333333';
---------------------
insert into Account (  ProductCode, CustomerID, OpenDate,
  LastActivityDate, Status, HomeBranchID,
  AssistingEmployeeID, AvailableBalance, PendingBalance)
select   a.ProductCode, c.CustomerID, a.OpenDate, a.LastDate, 'ACTIVE',
  e.BranchID, e.EmployeeID, a.avail, a.pend
from Customer c cross join 
 (select top 1  b.BranchID, e.EmployeeID 
  from Branch b inner join Employee e on e.AssignedBranchID = b.BranchID
  where b.City = 'Quincy' ) e
  cross join
 (select 'SBL' ProductCode,Convert(Datetime, '2004-02-22',120) OpenDate,Convert(Datetime, '2004-12-17',120) LastDate,
    50000.00 avail, 50000.00 pend ) a
where c.FederationID = '04-4444444';

-- ======================================================================== 
-- ======= AccountTransaction.
-- ========================================================================

-- put $100 in all checking/savings accounts on date Account opened  
---------------------
insert into AccountTransaction (  TransactionDate, AccountID, TransactionTypeCode,
  Amount, FundsAvailableDate)
select   a.OpenDate, a.AccountID, 'CDT', 100, a.OpenDate
from Account a
where a.ProductCode IN ('CHK','SAV','CD','MM');

-- end data population  


----Enterting US STATES------------


-------AdminWorkCategoryList-------
SET IDENTITY_INSERT AdminWorkCategory ON;

INSERT INTO AdminWorkCategory(CategoryID,CategoryName,CategoryDescription) VALUES (1,'Account','Manage Accounts')
INSERT INTO AdminWorkCategory(CategoryID,CategoryName,CategoryDescription) VALUES (2,'Account Transaction','Manage Account Transactions')
INSERT INTO AdminWorkCategory(CategoryID,CategoryName,CategoryDescription) VALUES (3,'Branch','Manage Branchs')
INSERT INTO AdminWorkCategory(CategoryID,CategoryName,CategoryDescription) VALUES (4,'Business','Manage Business')
INSERT INTO AdminWorkCategory(CategoryID,CategoryName,CategoryDescription) VALUES (5,'Customer','Manage Customers')
INSERT INTO AdminWorkCategory(CategoryID,CategoryName,CategoryDescription) VALUES (6,'Department','Manage Departments')
INSERT INTO AdminWorkCategory(CategoryID,CategoryName,CategoryDescription) VALUES (7,'Designation','Manage Designations')
INSERT INTO AdminWorkCategory(CategoryID,CategoryName,CategoryDescription) VALUES (8,'Employee','Manage Employees')
INSERT INTO AdminWorkCategory(CategoryID,CategoryName,CategoryDescription) VALUES (9,'Individual','Manage Individuals')
INSERT INTO AdminWorkCategory(CategoryID,CategoryName,CategoryDescription) VALUES (10,'Officer','Manage Officers')
INSERT INTO AdminWorkCategory(CategoryID,CategoryName,CategoryDescription) VALUES (11,'Product','Manage Products')
INSERT INTO AdminWorkCategory(CategoryID,CategoryName,CategoryDescription) VALUES (12,'Product Type','Manage Product Types')
INSERT INTO AdminWorkCategory(CategoryID,CategoryName,CategoryDescription) VALUES (13,'States','Manage States')

SET IDENTITY_INSERT AdminWorkCategory OFF;

INSERT into States values ('AL', 'Alabama'),
('AK', 'Alaska'),
('AZ', 'Arizona'),
('AR', 'Arkansas'),
('CA', 'California'),
('CO', 'Colorado'),
('CT', 'Connecticut'),
('DE', 'Delaware'),
('DC', 'District of Columbia'),
('FL', 'Florida'),
('GA', 'Georgia'),
('HI', 'Hawaii'),
('ID', 'Idaho'),
('IL', 'Illinois'),
('IN', 'Indiana'),
('IA', 'Iowa'),
('KS', 'Kansas'),
('KY', 'Kentucky'),
('LA', 'Louisiana'),
('ME', 'Maine'),
('MD', 'Maryland'),
('MA', 'Massachusetts'),
('MI', 'Michigan'),
('MN', 'Minnesota'),
('MS', 'Mississippi'),
('MO', 'Missouri'),
('MT', 'Montana'),
('NE', 'Nebraska'),
('NV', 'Nevada'),
('NH', 'New Hampshire'),
('NJ', 'New Jersey'),
('NM', 'New Mexico'),
('NY', 'New York'),
('NC', 'North Carolina'),
('ND', 'North Dakota'),
('OH', 'Ohio'),
('OK', 'Oklahoma'),
('OR', 'Oregon'),
('PA', 'Pennsylvania'),
('PR', 'Puerto Rico'),
('RI', 'Rhode Island'),
('SC', 'South Carolina'),
('SD', 'South Dakota'),
('TN', 'Tennessee'),
('TX', 'Texas'),
('UT', 'Utah'),
('VT', 'Vermont'),
('VA', 'Virginia'),
('WA', 'Washington'),
('WV', 'West Virginia'),
('WI', 'Wisconsin'),
('WY', 'Wyoming');




