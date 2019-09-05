/***STORED PROCEDURE***/

Use mulesoft
Go
--DROP PROCEDURE dbo.PersonInformation
Create PROCEDURE dbo.[PersonInformation]
@FirstName Varchar (255) ,
@LastName Varchar(255) ,
@DOB Varchar(255) ,
@Gender Varchar(255)  ,
@Title Varchar (255)  ,
@Number int ,
@Street Varchar(255)  ,
@Unit Varchar(255)  ,
@City Varchar (255)  ,
@State Varchar(255) ,
@Zipcode Varchar(255),
@PhoneNumber Varchar(255),
@EmailAddress Varchar(255)
AS
Begin
MERGE mulesoft.dbo.[PersonInformation_Test]  AS Target
USING (select @FirstName,@LastName,@DOB,@Gender,@Title,@Number,@Street,@Unit,@City,@State,@Zipcode,@PhoneNumber,@EmailAddress)
    AS Source (FirstName,LastName,DOB,Gender,Title,Number,Street,Unit,City,[State],[Zipcode],[PhoneNumber],[EmailAddress])
ON (Source.FirstName = Target.FirstName and Source.lastName = Target.LastName /* and Source.DOB = Target.DOB AND Source.Gender = Target.Gender*/)
WHEN MATCHED and Target.Title <> Source.Title Or
Target.Number <> Source.Number or
    Target.Street <> Source.Street or
    Target.Unit <> Source.Unit or
    Target.City <> Source.City or
    Target.[State] <> Source.[State] or
    Target.[Zipcode] <> Source.[Zipcode] or
	Target.[PhoneNumber] <> Source.[PhoneNumber] or
	Target.[EmailAddress] <> Source.[EmailAddress] 

THEN
    UPDATE SET Target.Title = Source.Title,
Target.Number = Source.Number,
    Target.Street = Source.Street,
    Target.Unit = Source.Unit,
    Target.City = Source.City,
    Target.[State] = Source.[State],
    Target.[Zipcode] = Source.[Zipcode],
	Target.[PhoneNumber] = Source.[PhoneNumber],
	Target.[EmailAddress] = Source.[EmailAddress]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([FirstName],[LastName],[DOB],[Gender],[Title],[Number],[Street],[Unit],[City],[State],[Zipcode],[PhoneNumber],[EmailAddress])
    VALUES(Source.FirstName, Source.LastName, Source.DOB, Source.Gender, Source.Title, Source.Number, Source.Street,Source.Unit,Source.City,Source.State,Source.Zipcode,Source.PhoneNumber,Source.EmailAddress);

END 