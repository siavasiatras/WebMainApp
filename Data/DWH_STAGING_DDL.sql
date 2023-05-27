USE [DWH_STAGING]
GO
/****** Object:  User [proj_user]    Script Date: 27/5/2023 1:14:39 πμ ******/
CREATE USER [proj_user] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [project_user]    Script Date: 27/5/2023 1:14:39 πμ ******/
CREATE USER [project_user] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ProjectUser]    Script Date: 27/5/2023 1:14:39 πμ ******/
CREATE USER [ProjectUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [proj_user]
GO
ALTER ROLE [db_datareader] ADD MEMBER [proj_user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [proj_user]
GO
ALTER ROLE [db_datareader] ADD MEMBER [project_user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [project_user]
GO
/****** Object:  Table [dbo].[age_specific_fertility_rates]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[age_specific_fertility_rates](
	[country_code] [varchar](50) NULL,
	[country_name] [varchar](50) NULL,
	[year] [varchar](50) NULL,
	[fertility_rate_15_19] [varchar](50) NULL,
	[fertility_rate_20_24] [varchar](50) NULL,
	[fertility_rate_25_29] [varchar](50) NULL,
	[fertility_rate_30_34] [varchar](50) NULL,
	[fertility_rate_35_39] [varchar](50) NULL,
	[fertility_rate_40_44] [varchar](50) NULL,
	[fertility_rate_45_49] [varchar](50) NULL,
	[total_fertility_rate] [varchar](50) NULL,
	[gross_reproduction_rate] [varchar](50) NULL,
	[sex_ratio_at_birth] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[birth_death_growth_rates]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[birth_death_growth_rates](
	[country_code] [varchar](50) NULL,
	[country_name] [varchar](50) NULL,
	[year] [varchar](50) NULL,
	[crude_birth_rate] [varchar](50) NULL,
	[crude_death_rate] [varchar](50) NULL,
	[net_migration] [varchar](50) NULL,
	[rate_natural_increase] [varchar](50) NULL,
	[growth_rate] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countries]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[ISO] [nvarchar](50) NULL,
	[ISO3] [nvarchar](50) NULL,
	[ISO_Code] [smallint] NULL,
	[FIPS] [nvarchar](50) NULL,
	[Display_Name] [nvarchar](50) NULL,
	[Official_Name] [nvarchar](100) NULL,
	[Capital] [nvarchar](50) NULL,
	[Continent] [nvarchar](50) NULL,
	[CurrencyCode] [nvarchar](50) NULL,
	[CurrencyName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Region_Code] [tinyint] NULL,
	[Region_Name] [nvarchar](50) NULL,
	[Sub_region_Code] [smallint] NULL,
	[Sub_region_Name] [nvarchar](50) NULL,
	[Intermediate_Region_Code] [smallint] NULL,
	[Intermediate_Region_Name] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Developed_or_Developing] [nvarchar](50) NULL,
	[Small_Island_Developing_States_SIDS] [nvarchar](50) NULL,
	[Land_Locked_Developing_Countries_LLDC] [nvarchar](50) NULL,
	[Least_Developed_Countries_LDC] [nvarchar](50) NULL,
	[Area_SqKm] [float] NULL,
	[Population] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country_names_area]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country_names_area](
	[country_code] [varchar](50) NULL,
	[country_name] [varchar](50) NULL,
	[country_area] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataFiles]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Path] [varchar](500) NULL,
	[Name] [varchar](500) NULL,
	[TableName] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DomesticCredits]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DomesticCredits](
	[Country] [varchar](256) NULL,
	[1990] [varchar](256) NULL,
	[1995] [varchar](256) NULL,
	[2000] [varchar](256) NULL,
	[2005] [varchar](256) NULL,
	[2010] [varchar](256) NULL,
	[2011] [varchar](256) NULL,
	[2012] [varchar](256) NULL,
	[2013] [varchar](256) NULL,
	[2014] [varchar](256) NULL,
	[2015] [varchar](256) NULL,
	[2016] [varchar](256) NULL,
	[2017] [varchar](256) NULL,
	[2018] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceDate] [datetime2](7) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorProcedure] [varchar](200) NULL,
	[ErrorLine] [int] NULL,
	[ErrorMessage] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstimatedGNIfemale]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstimatedGNIfemale](
	[Country] [varchar](256) NULL,
	[1995] [varchar](256) NULL,
	[2000] [varchar](256) NULL,
	[2005] [varchar](256) NULL,
	[2010] [varchar](256) NULL,
	[2011] [varchar](256) NULL,
	[2012] [varchar](256) NULL,
	[2013] [varchar](256) NULL,
	[2014] [varchar](256) NULL,
	[2015] [varchar](256) NULL,
	[2016] [varchar](256) NULL,
	[2017] [varchar](256) NULL,
	[2018] [varchar](256) NULL,
	[info] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstimatedGNImale]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstimatedGNImale](
	[Country] [varchar](256) NULL,
	[1995] [varchar](256) NULL,
	[2000] [varchar](256) NULL,
	[2005] [varchar](256) NULL,
	[2010] [varchar](256) NULL,
	[2011] [varchar](256) NULL,
	[2012] [varchar](256) NULL,
	[2013] [varchar](256) NULL,
	[2014] [varchar](256) NULL,
	[2015] [varchar](256) NULL,
	[2016] [varchar](256) NULL,
	[2017] [varchar](256) NULL,
	[2018] [varchar](256) NULL,
	[info] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GDPpercapita]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDPpercapita](
	[Country] [varchar](256) NULL,
	[1990] [varchar](256) NULL,
	[1995] [varchar](256) NULL,
	[2000] [varchar](256) NULL,
	[2005] [varchar](256) NULL,
	[2010] [varchar](256) NULL,
	[2011] [varchar](256) NULL,
	[2012] [varchar](256) NULL,
	[2013] [varchar](256) NULL,
	[2014] [varchar](256) NULL,
	[2015] [varchar](256) NULL,
	[2016] [varchar](256) NULL,
	[2017] [varchar](256) NULL,
	[2018] [varchar](256) NULL,
	[info] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GDPtotal]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDPtotal](
	[Country] [varchar](256) NULL,
	[1990] [varchar](256) NULL,
	[1995] [varchar](256) NULL,
	[2000] [varchar](256) NULL,
	[2005] [varchar](256) NULL,
	[2010] [varchar](256) NULL,
	[2011] [varchar](256) NULL,
	[2012] [varchar](256) NULL,
	[2013] [varchar](256) NULL,
	[2014] [varchar](256) NULL,
	[2015] [varchar](256) NULL,
	[2016] [varchar](256) NULL,
	[2017] [varchar](256) NULL,
	[2018] [varchar](256) NULL,
	[info] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GNIpercapita]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GNIpercapita](
	[Country] [varchar](256) NULL,
	[1990] [varchar](256) NULL,
	[1991] [varchar](256) NULL,
	[1992] [varchar](256) NULL,
	[1993] [varchar](256) NULL,
	[1994] [varchar](256) NULL,
	[1995] [varchar](256) NULL,
	[1996] [varchar](256) NULL,
	[1997] [varchar](256) NULL,
	[1998] [varchar](256) NULL,
	[1999] [varchar](256) NULL,
	[2000] [varchar](256) NULL,
	[2001] [varchar](256) NULL,
	[2002] [varchar](256) NULL,
	[2003] [varchar](256) NULL,
	[2004] [varchar](256) NULL,
	[2005] [varchar](256) NULL,
	[2006] [varchar](256) NULL,
	[2007] [varchar](256) NULL,
	[2008] [varchar](256) NULL,
	[2009] [varchar](256) NULL,
	[2010] [varchar](256) NULL,
	[2011] [varchar](256) NULL,
	[2012] [varchar](256) NULL,
	[2013] [varchar](256) NULL,
	[2014] [varchar](256) NULL,
	[2015] [varchar](256) NULL,
	[2016] [varchar](256) NULL,
	[2017] [varchar](256) NULL,
	[2018] [varchar](256) NULL,
	[info] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grossfixedcapitalformation]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grossfixedcapitalformation](
	[Country] [varchar](256) NULL,
	[1990] [varchar](256) NULL,
	[1995] [varchar](256) NULL,
	[2000] [varchar](256) NULL,
	[2005] [varchar](256) NULL,
	[2010] [varchar](256) NULL,
	[2011] [varchar](256) NULL,
	[2012] [varchar](256) NULL,
	[2013] [varchar](256) NULL,
	[2014] [varchar](256) NULL,
	[2015] [varchar](256) NULL,
	[2016] [varchar](256) NULL,
	[2017] [varchar](256) NULL,
	[2018] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncomeIndex]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomeIndex](
	[Country] [varchar](256) NULL,
	[1990] [varchar](256) NULL,
	[1991] [varchar](256) NULL,
	[1992] [varchar](256) NULL,
	[1993] [varchar](256) NULL,
	[1994] [varchar](256) NULL,
	[1995] [varchar](256) NULL,
	[1996] [varchar](256) NULL,
	[1997] [varchar](256) NULL,
	[1998] [varchar](256) NULL,
	[1999] [varchar](256) NULL,
	[2000] [varchar](256) NULL,
	[2001] [varchar](256) NULL,
	[2002] [varchar](256) NULL,
	[2003] [varchar](256) NULL,
	[2004] [varchar](256) NULL,
	[2005] [varchar](256) NULL,
	[2006] [varchar](256) NULL,
	[2007] [varchar](256) NULL,
	[2008] [varchar](256) NULL,
	[2009] [varchar](256) NULL,
	[2010] [varchar](256) NULL,
	[2011] [varchar](256) NULL,
	[2012] [varchar](256) NULL,
	[2013] [varchar](256) NULL,
	[2014] [varchar](256) NULL,
	[2015] [varchar](256) NULL,
	[2016] [varchar](256) NULL,
	[2017] [varchar](256) NULL,
	[2018] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabourshareofGDP]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabourshareofGDP](
	[Country] [varchar](256) NULL,
	[2000] [varchar](256) NULL,
	[2005] [varchar](256) NULL,
	[2010] [varchar](256) NULL,
	[2011] [varchar](256) NULL,
	[2012] [varchar](256) NULL,
	[2013] [varchar](256) NULL,
	[2014] [varchar](256) NULL,
	[2015] [varchar](256) NULL,
	[2016] [varchar](256) NULL,
	[2017] [varchar](256) NULL,
	[2018] [varchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[midyear_population]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[midyear_population](
	[country_code] [varchar](50) NULL,
	[country_name] [varchar](50) NULL,
	[year] [varchar](50) NULL,
	[midyear_population] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[midyear_population_5yr_age_sex]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[midyear_population_5yr_age_sex](
	[country_code] [varchar](50) NULL,
	[country_name] [varchar](50) NULL,
	[year] [varchar](50) NULL,
	[total_flag] [varchar](50) NULL,
	[starting_age] [varchar](50) NULL,
	[age_group_indicator] [varchar](50) NULL,
	[ending_age] [varchar](50) NULL,
	[midyear_population] [varchar](50) NULL,
	[midyear_population_male] [varchar](50) NULL,
	[midyear_population_female] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[midyear_population_age_sex]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[midyear_population_age_sex](
	[country_code] [varchar](50) NULL,
	[country_name] [varchar](50) NULL,
	[year] [varchar](50) NULL,
	[sex] [varchar](50) NULL,
	[max_age] [varchar](50) NULL,
	[population_age_0] [varchar](50) NULL,
	[population_age_1] [varchar](50) NULL,
	[population_age_2] [varchar](50) NULL,
	[population_age_3] [varchar](50) NULL,
	[population_age_4] [varchar](50) NULL,
	[population_age_5] [varchar](50) NULL,
	[population_age_6] [varchar](50) NULL,
	[population_age_7] [varchar](50) NULL,
	[population_age_8] [varchar](50) NULL,
	[population_age_9] [varchar](50) NULL,
	[population_age_10] [varchar](50) NULL,
	[population_age_11] [varchar](50) NULL,
	[population_age_12] [varchar](50) NULL,
	[population_age_13] [varchar](50) NULL,
	[population_age_14] [varchar](50) NULL,
	[population_age_15] [varchar](50) NULL,
	[population_age_16] [varchar](50) NULL,
	[population_age_17] [varchar](50) NULL,
	[population_age_18] [varchar](50) NULL,
	[population_age_19] [varchar](50) NULL,
	[population_age_20] [varchar](50) NULL,
	[population_age_21] [varchar](50) NULL,
	[population_age_22] [varchar](50) NULL,
	[population_age_23] [varchar](50) NULL,
	[population_age_24] [varchar](50) NULL,
	[population_age_25] [varchar](50) NULL,
	[population_age_26] [varchar](50) NULL,
	[population_age_27] [varchar](50) NULL,
	[population_age_28] [varchar](50) NULL,
	[population_age_29] [varchar](50) NULL,
	[population_age_30] [varchar](50) NULL,
	[population_age_31] [varchar](50) NULL,
	[population_age_32] [varchar](50) NULL,
	[population_age_33] [varchar](50) NULL,
	[population_age_34] [varchar](50) NULL,
	[population_age_35] [varchar](50) NULL,
	[population_age_36] [varchar](50) NULL,
	[population_age_37] [varchar](50) NULL,
	[population_age_38] [varchar](50) NULL,
	[population_age_39] [varchar](50) NULL,
	[population_age_40] [varchar](50) NULL,
	[population_age_41] [varchar](50) NULL,
	[population_age_42] [varchar](50) NULL,
	[population_age_43] [varchar](50) NULL,
	[population_age_44] [varchar](50) NULL,
	[population_age_45] [varchar](50) NULL,
	[population_age_46] [varchar](50) NULL,
	[population_age_47] [varchar](50) NULL,
	[population_age_48] [varchar](50) NULL,
	[population_age_49] [varchar](50) NULL,
	[population_age_50] [varchar](50) NULL,
	[population_age_51] [varchar](50) NULL,
	[population_age_52] [varchar](50) NULL,
	[population_age_53] [varchar](50) NULL,
	[population_age_54] [varchar](50) NULL,
	[population_age_55] [varchar](50) NULL,
	[population_age_56] [varchar](50) NULL,
	[population_age_57] [varchar](50) NULL,
	[population_age_58] [varchar](50) NULL,
	[population_age_59] [varchar](50) NULL,
	[population_age_60] [varchar](50) NULL,
	[population_age_61] [varchar](50) NULL,
	[population_age_62] [varchar](50) NULL,
	[population_age_63] [varchar](50) NULL,
	[population_age_64] [varchar](50) NULL,
	[population_age_65] [varchar](50) NULL,
	[population_age_66] [varchar](50) NULL,
	[population_age_67] [varchar](50) NULL,
	[population_age_68] [varchar](50) NULL,
	[population_age_69] [varchar](50) NULL,
	[population_age_70] [varchar](50) NULL,
	[population_age_71] [varchar](50) NULL,
	[population_age_72] [varchar](50) NULL,
	[population_age_73] [varchar](50) NULL,
	[population_age_74] [varchar](50) NULL,
	[population_age_75] [varchar](50) NULL,
	[population_age_76] [varchar](50) NULL,
	[population_age_77] [varchar](50) NULL,
	[population_age_78] [varchar](50) NULL,
	[population_age_79] [varchar](50) NULL,
	[population_age_80] [varchar](50) NULL,
	[population_age_81] [varchar](50) NULL,
	[population_age_82] [varchar](50) NULL,
	[population_age_83] [varchar](50) NULL,
	[population_age_84] [varchar](50) NULL,
	[population_age_85] [varchar](50) NULL,
	[population_age_86] [varchar](50) NULL,
	[population_age_87] [varchar](50) NULL,
	[population_age_88] [varchar](50) NULL,
	[population_age_89] [varchar](50) NULL,
	[population_age_90] [varchar](50) NULL,
	[population_age_91] [varchar](50) NULL,
	[population_age_92] [varchar](50) NULL,
	[population_age_93] [varchar](50) NULL,
	[population_age_94] [varchar](50) NULL,
	[population_age_95] [varchar](50) NULL,
	[population_age_96] [varchar](50) NULL,
	[population_age_97] [varchar](50) NULL,
	[population_age_98] [varchar](50) NULL,
	[population_age_99] [varchar](50) NULL,
	[population_age_100] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mortality_life_expectancy]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mortality_life_expectancy](
	[country_code] [varchar](50) NULL,
	[country_name] [varchar](50) NULL,
	[year] [varchar](50) NULL,
	[infant_mortality] [varchar](50) NULL,
	[infant_mortality_male] [varchar](50) NULL,
	[infant_mortality_female] [varchar](50) NULL,
	[life_expectancy] [varchar](50) NULL,
	[life_expectancy_male] [varchar](50) NULL,
	[life_expectancy_female] [varchar](50) NULL,
	[mortality_rate_under5] [varchar](50) NULL,
	[mortality_rate_under5_male] [varchar](50) NULL,
	[mortality_rate_under5_female] [varchar](50) NULL,
	[mortality_rate_1to4] [varchar](50) NULL,
	[mortality_rate_1to4_male] [varchar](50) NULL,
	[mortality_rate_1to4_female] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[InsertCsvDataToTables]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		g.mitsis
-- Create date: 18/02/2023
-- Description:	bulk insert data of CSV files
-- =============================================
CREATE PROCEDURE [dbo].[InsertCsvDataToTables]
	-- Add the parameters for the stored procedure here
	@path varchar(256)
	,@name varchar(256)

AS
BEGIN
	declare @sql varchar(max) = ''
	select @sql =  '
	
	BEGIN TRANSACTION;  
  
	BEGIN TRY  
	    -- Generate a constraint violation error.  
	    TRUNCATE TABLE dbo.'+SUBSTRING(@name,1,len(@name)-4)+'	
		-- import the file
		BULK INSERT '+SUBSTRING(@name,1,len(@name)-4)+'		
		FROM '+''''+@path+@name+''''+'
		WITH
		(
		        FORMAT=''CSV'',
		        FIRSTROW=2,
				FIELDTERMINATOR = '',''		
		)
  
	END TRY  
	BEGIN CATCH  
		insert into ErrorLog
	    SELECT
			getdate()
	        ,ERROR_NUMBER() AS ErrorNumber  
	        ,ERROR_SEVERITY() AS ErrorSeverity  
	        ,ERROR_STATE() AS ErrorState  
	        ,''dbo.InsertData'' AS ErrorProcedure  
	        ,ERROR_LINE() AS ErrorLine  
	        ,ERROR_MESSAGE() AS ErrorMessage;  
	  
	    IF @@TRANCOUNT > 0  
	        ROLLBACK TRANSACTION;  
	END CATCH;  
	  
	IF @@TRANCOUNT > 0  
	    COMMIT TRANSACTION; '

	exec sp_sqlexec @sql;
		   
END
GO
/****** Object:  StoredProcedure [dbo].[InsertDataMain]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		g.mitsis
-- Create date: 2023-02-28
-- Description:	Main Procedure For Insert Data
-- =============================================
CREATE PROCEDURE [dbo].[InsertDataMain]
		
AS
BEGIN
	SET NOCOUNT ON;

	declare @path varchar(500),
	@name varchar(500)
	
	DECLARE FileCursor CURSOR FOR  
	select 
		[Path],
		[Name] 
	from dbo.DataFiles

	OPEN FileCursor  
    FETCH NEXT FROM FileCursor INTO 
		@path,
		@name    
 
    WHILE @@FETCH_STATUS = 0  
    BEGIN  
		exec InsertDataToTables @path,@name
        
	FETCH NEXT FROM FileCursor INTO 
		@path,
		@name 
    END  
  
    CLOSE FileCursor  
    DEALLOCATE FileCursor  

END
GO
/****** Object:  StoredProcedure [dbo].[InsertExcelDataToTables]    Script Date: 27/5/2023 1:14:39 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		g.mitsis
-- Create date: 11/03/2012
-- Description:	Insert Excel Data To Tables
-- =============================================
CREATE PROCEDURE [dbo].[InsertExcelDataToTables]
	@path varchar(256)
	,@name varchar(256)
	
AS
BEGIN TRANSACTION;  
  
	BEGIN TRY  
		truncate table IncomeIndex
		insert into IncomeIndex
		SELECT * 
		FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
		    'Excel 12.0; Database=C:\Copy of Income by Country.xlsx', [IncomeIndex$]);
		
		truncate table LabourshareofGDP
		insert into LabourshareofGDP
		SELECT *  
		FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
		    'Excel 12.0; Database=C:\Copy of Income by Country.xlsx', [LabourshareofGDP$]);
		
		truncate table Grossfixedcapitalformation
		insert into Grossfixedcapitalformation
		SELECT * 
		FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
		    'Excel 12.0; Database=C:\Copy of Income by Country.xlsx', [Grossfixedcapitalformation$]);
		
		truncate table GDPtotal
		insert into GDPtotal
		SELECT * 
		FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
		    'Excel 12.0; Database=C:\Copy of Income by Country.xlsx', [GDPtotal$]);
		
		truncate table GDPpercapita
		insert into GDPpercapita
		SELECT * 
		FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
		    'Excel 12.0; Database=C:\Copy of Income by Country.xlsx', [GDPpercapita$]);
		
		truncate table GNIpercapita
		insert into GNIpercapita
		SELECT * 
		FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
		    'Excel 12.0; Database=C:\Copy of Income by Country.xlsx', [GNIpercapita$]);
		
		truncate table EstimatedGNImale
		insert into EstimatedGNImale
		SELECT * 
		FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
		    'Excel 12.0; Database=C:\Copy of Income by Country.xlsx', [EstimatedGNImale$]);
		
		truncate table EstimatedGNIfemale
		insert into EstimatedGNIfemale
		SELECT * 
		FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
		    'Excel 12.0; Database=C:\Copy of Income by Country.xlsx', [EstimatedGNIfemale$]);
		
		truncate table Domesticcredits
		insert into Domesticcredits
		SELECT * 
		FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
		    'Excel 12.0; Database=C:\Copy of Income by Country.xlsx', [Domesticcredits$]);	

	END TRY  
	BEGIN CATCH  
		insert into ErrorLog
	    SELECT
			getdate()
	        ,ERROR_NUMBER() AS ErrorNumber  
	        ,ERROR_SEVERITY() AS ErrorSeverity  
	        ,ERROR_STATE() AS ErrorState  
	        ,'dbo.InsertExcelDataToTables' AS ErrorProcedure  
	        ,ERROR_LINE() AS ErrorLine  
	        ,ERROR_MESSAGE() AS ErrorMessage;  
	  
	    IF @@TRANCOUNT > 0  
	        ROLLBACK TRANSACTION;  
	END CATCH;  
	  
	IF @@TRANCOUNT > 0  
	    COMMIT TRANSACTION;



GO
