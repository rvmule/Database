/***CREATING TABLE***/

USE mulesoft
GO
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'dbo.PersonInformation_Test') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[PersonInformation_Test]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PersonInformation_Test](
PersonID [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
FirstName Varchar (255) NOT NULL,
LastName Varchar(255) NOT NULL,
DOB Varchar(255)  NULL,
Gender Varchar(255)  NULL,
Title Varchar (255)  NULL,
Number int NULL,
Street Varchar(255)  NULL,
Unit Varchar(255)  NULL,
City Varchar (255)  NULL,
[State] Varchar(255) NULL,
[Zipcode] Varchar(255) NULL,
[PhoneNumber] Varchar(255)  Null,
[EmailAddress] Varchar(255) Null,
CreateDT [datetime] NOT NULL DEFAULT (getdate()),
UpdateDT [datetime] NOT NULL DEFAULT (getdate()),
CreateID [varchar](50) NOT NULL DEFAULT (suser_sname()),
UpdateID [varchar](50) NOT NULL DEFAULT (suser_sname()
)
 CONSTRAINT [PK_PersonInformation_Test] PRIMARY KEY CLUSTERED
(
[PersonID] ASC
)
) 
GO