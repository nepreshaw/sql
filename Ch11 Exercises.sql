CREATE TABLE Individuals
(
	IndividualID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT  NULL,
	Address varchar(50) NOT NULL,
	Phone varchar(50) NOT NULL
)

CREATE TABLE Groups
(
	GroupID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	GroupName varchar(50) NOT NULL,
	Dues money NOT NULL DEFAULT(0) CHECK (Dues >= 0)

)

CREATE TABLE GroupMembership
(
	GroupID int References Groups(GroupID),
	IndividualID int references Individuals(IndividualID)
)

--Chapter 11 Question 3
-- Write the CREATE INDEX statements to create a clustered index on 
--Chapter 11 Question 4
--Write an ALTER TABLE statement that adds a new column,
ALTER TABLE Individuals 
ADD DuesPaid bit NOT NULL DEFAULT(0)

--Chapter 11 Question 5
--Write an ALTER TABLE statement that adds two new check constraints
--Chapter 11 Question 6
--Delete the GroupMembership table from the Membership database. 