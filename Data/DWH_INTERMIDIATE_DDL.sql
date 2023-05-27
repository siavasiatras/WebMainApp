USE [DWH_INTERMIDIATE]
GO
/****** Object:  User [project_user]    Script Date: 27/5/2023 1:13:51 πμ ******/
CREATE USER [project_user] FOR LOGIN [project_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [project_user]
GO
/****** Object:  Schema [etl]    Script Date: 27/5/2023 1:13:51 πμ ******/
CREATE SCHEMA [etl]
GO
/****** Object:  Table [dbo].[COUNTRIES]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COUNTRIES](
	[COUNTRY_ID] [int] IDENTITY(1,1) NOT NULL,
	[ISO] [varchar](2) NULL,
	[ISO3] [varchar](3) NULL,
	[ISO_CODE] [smallint] NULL,
	[FIPS] [varchar](2) NULL,
	[DISPLAY_NAME] [varchar](50) NULL,
	[OFFICIAL_NAME] [varchar](100) NULL,
	[CAPITAL] [varchar](50) NULL,
	[CONTINENT] [varchar](50) NULL,
	[CURRENCYCODE] [varchar](50) NULL,
	[CURRENCYNAME] [varchar](50) NULL,
	[PHONE] [varchar](50) NULL,
	[REGION_CODE] [tinyint] NULL,
	[REGION_NAME] [varchar](50) NULL,
	[SUB_REGION_CODE] [smallint] NULL,
	[SUB_REGION_NAME] [varchar](50) NULL,
	[INTERMEDIATE_REGION_CODE] [smallint] NULL,
	[INTERMEDIATE_REGION_NAME] [varchar](50) NULL,
	[STATUS] [varchar](50) NULL,
	[DEVELOPED_OR_DEVELOPING] [varchar](50) NULL,
	[SMALL_ISLAND_DEVELOPING_STATES_SIDS] [bit] NULL,
	[LAND_LOCKED_DEVELOPING_COUNTRIES_LLDC] [bit] NULL,
	[LEAST_DEVELOPED_COUNTRIES_LDC] [bit] NULL,
	[AREA_SQKM] [decimal](18, 4) NULL,
	[POPULATION] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coutry_Region_Official_Mapping]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coutry_Region_Official_Mapping](
	[country_id] [int] NOT NULL,
	[Display_Name] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 27/5/2023 1:13:51 πμ ******/
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
/****** Object:  Table [dbo].[FERTILITY_RATES_ON_PERIOD]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FERTILITY_RATES_ON_PERIOD](
	[COUNTRY_ID] [int] NOT NULL,
	[YEAR] [int] NULL,
	[TOTAL_FLAG] [varchar](1) NULL,
	[STARTING_AGE] [int] NULL,
	[AGE_GROUP_INDICATOR] [varchar](1) NULL,
	[ENDING_AGE] [int] NULL,
	[FERTILITY_RATE] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INDEXES_BY_COUNTRY]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INDEXES_BY_COUNTRY](
	[country_id] [int] NOT NULL,
	[year] [int] NULL,
	[GDP_PER_CAPITA] [decimal](18, 4) NULL,
	[DOMESTIC_CREDITS] [decimal](18, 4) NULL,
	[INCOME_INDEX] [decimal](18, 4) NULL,
	[ESTIMATED_GNI_FEMALE] [decimal](18, 4) NULL,
	[ESTIMATED_GNI_MALE] [decimal](18, 4) NULL,
	[GDP_TOTAL] [decimal](18, 4) NULL,
	[GNI_PERCAPITA] [decimal](18, 4) NULL,
	[GROSS_FIXED_CAPITAL_FORMATION] [decimal](18, 4) NULL,
	[LABOUR_SHARE_OF_GDP] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INDEXES_BY_REGION]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INDEXES_BY_REGION](
	[REGION] [varchar](256) NULL,
	[YEAR] [int] NULL,
	[GDP_PER_CAPITA] [decimal](18, 4) NULL,
	[DOMESTIC_CREDITS] [decimal](18, 4) NULL,
	[INCOME_INDEX] [decimal](18, 4) NULL,
	[ESTIMATED_GNI_FEMALE] [decimal](18, 4) NULL,
	[ESTIMATED_GNI_MALE] [decimal](18, 4) NULL,
	[GDP_TOTAL] [decimal](18, 4) NULL,
	[GNI_PERCAPITA] [decimal](18, 4) NULL,
	[GROSS_FIXED_CAPITAL_FORMATION] [decimal](18, 4) NULL,
	[LABOUR_SHARE_OF_GDP] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MORTALITY_LIFE_EXPECTANCY_FEMALE]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MORTALITY_LIFE_EXPECTANCY_FEMALE](
	[COUNTRY_ID] [int] NOT NULL,
	[YEAR] [int] NULL,
	[INFANT_MORTALITY_FEMALE] [decimal](18, 4) NULL,
	[LIFE_EXPECTANCY_FEMALE] [decimal](18, 4) NULL,
	[MORTALITY_RATE_1TO4_FEMALE] [decimal](18, 4) NULL,
	[MORTALITY_RATE_UNDER5_FEMALE] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MORTALITY_LIFE_EXPECTANCY_MALE]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MORTALITY_LIFE_EXPECTANCY_MALE](
	[COUNTRY_ID] [int] NOT NULL,
	[YEAR] [int] NULL,
	[INFANT_MORTALITY_MALE] [decimal](18, 4) NULL,
	[LIFE_EXPECTANCY_MALE] [decimal](18, 4) NULL,
	[MORTALITY_RATE_1TO4_MALE] [decimal](18, 4) NULL,
	[MORTALITY_RATE_UNDER5_MALE] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POPULATION_DEMOGRAPHIC_RATES_GENERAL]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POPULATION_DEMOGRAPHIC_RATES_GENERAL](
	[COUNTRY_ID] [int] NULL,
	[YEAR] [int] NULL,
	[INFANT_MORTALITY] [decimal](18, 4) NULL,
	[LIFE_EXPECTANCY] [decimal](18, 4) NULL,
	[MORTALITY_RATE_1TO4] [decimal](18, 4) NULL,
	[MORTALITY_RATE_UNDER5] [decimal](18, 4) NULL,
	[gross_reproduction_rate] [decimal](18, 4) NULL,
	[sex_ratio_at_birth] [decimal](18, 4) NULL,
	[CRUDE_BIRTH_RATE] [decimal](18, 4) NULL,
	[CRUDE_DEATH_RATE] [decimal](18, 4) NULL,
	[GROWTH_RATE] [decimal](18, 4) NULL,
	[NET_MIGRATION] [decimal](18, 4) NULL,
	[RATE_NATURAL_INCREASE] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POPULATION_FEMALE]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POPULATION_FEMALE](
	[COUNTRY_ID] [int] NOT NULL,
	[YEAR] [int] NULL,
	[MAX_AGE] [int] NULL,
	[AGE_FLAG] [int] NULL,
	[POPULATION_FEMALE] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POPULATION_FEMALE_ON_PERIOD]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POPULATION_FEMALE_ON_PERIOD](
	[COUNTRY_ID] [int] NOT NULL,
	[PF_YEAR] [int] NULL,
	[PF_TOTAL_FLAG] [varchar](1) NOT NULL,
	[PF_STARTING_AGE] [int] NULL,
	[PF_AGE_GROUP_INDICATOR] [varchar](1) NOT NULL,
	[PF_ENDING_AGE] [int] NULL,
	[PF_POPULATION_FEMALE] [decimal](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POPULATION_MALE]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POPULATION_MALE](
	[COUNTRY_ID] [int] NOT NULL,
	[YEAR] [int] NULL,
	[MAX_AGE] [int] NULL,
	[AGE_FLAG] [int] NULL,
	[POPULATION_MALE] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POPULATION_MALE_ON_PERIOD]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POPULATION_MALE_ON_PERIOD](
	[COUNTRY_ID] [int] NOT NULL,
	[PM_YEAR] [int] NULL,
	[PM_TOTAL_FLAG] [varchar](1) NOT NULL,
	[PM_STARTING_AGE] [int] NULL,
	[PM_AGE_GROUP_INDICATOR] [varchar](1) NOT NULL,
	[PM_ENDING_AGE] [int] NULL,
	[PM_POPULATION_FEMALE] [decimal](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POPULATION_MIDYAER_ON_PERIOD]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POPULATION_MIDYAER_ON_PERIOD](
	[COUNTRY_ID] [int] NOT NULL,
	[YEAR] [int] NULL,
	[TOTAL_FLAG] [varchar](1) NULL,
	[STARTING_AGE] [int] NULL,
	[AGE_GROUP_INDICATOR] [varchar](1) NULL,
	[ENDING_AGE] [int] NULL,
	[MIDYEAR_POPULATION] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POPULATION_MIDYEAR_ON_PERIOD_FEMALE]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POPULATION_MIDYEAR_ON_PERIOD_FEMALE](
	[COUNTRY_ID] [int] NOT NULL,
	[YEAR] [int] NULL,
	[TOTAL_FLAG] [varchar](1) NULL,
	[STARTING_AGE] [int] NULL,
	[AGE_GROUP_INDICATOR] [varchar](1) NULL,
	[ENDING_AGE] [int] NULL,
	[MIDYEAR_POPULATION_FEMALE] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POPULATION_MIDYEAR_ON_PERIOD_MALE]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POPULATION_MIDYEAR_ON_PERIOD_MALE](
	[COUNTRY_ID] [int] NOT NULL,
	[YEAR] [int] NULL,
	[TOTAL_FLAG] [varchar](1) NULL,
	[STARTING_AGE] [int] NULL,
	[AGE_GROUP_INDICATOR] [varchar](1) NULL,
	[ENDING_AGE] [int] NULL,
	[MIDYEAR_POPULATION_MALE] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CreateMappingCoutryRegionOfficial]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		g.mitsis
-- Create date: 08/03/2022
-- Description:	Mapping Coutry Region Official
-- EXEC [dbo].[CreateMappingCoutryRegionOfficial]
-- =============================================
CREATE PROCEDURE [dbo].[CreateMappingCoutryRegionOfficial]
	
AS
BEGIN
	SET NOCOUNT ON;

	truncate table Coutry_Region_Official_Mapping
	insert INTO Coutry_Region_Official_Mapping
	SELECT 
		country_id
		,Display_Name 	 
	FROM countries 
	WHERE Display_Name IS NOT NULL
	UNION 
	SELECT 
		country_id
		,Official_Name 
	FROM countries 
	WHERE Official_Name IS NOT NULL


	
	INSERT INTO [dbo].[Coutry_Region_Official_Mapping]
           ([country_id]
           ,[Display_Name])
     VALUES(59,'Congo (Democratic Republic of the)'),
	 (98,'Hong Kong; China (SAR)'),
	 (164,'Korea (Republic of)'),
	 (144,'Moldova (Republic of)'),
	 (130,'North Macedonia'),
	 (223,'Tanzania (United Republic of)'),
	 (170,'Palestine; State of'),
	 (217,'Eswatini (Kingdom of)')

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteData]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		g.mitsis
-- Create date: 14/03/2023
-- Description:	DELETE ALL DATA
-- EXEC dbo.DeleteData
-- =============================================
CREATE PROCEDURE [dbo].[DeleteData]
	
AS
BEGIN TRANSACTION;  
  
	BEGIN TRY 
	

	DELETE FROM FERTILITY_RATES_ON_PERIOD;
	DELETE FROM INDEXES_BY_COUNTRY;
	DELETE FROM INDEXES_BY_REGION;
	--DELETE FROM MORTALITY_LIFE_EXPECTANCY;
	DELETE FROM MORTALITY_LIFE_EXPECTANCY_FEMALE;
	DELETE FROM MORTALITY_LIFE_EXPECTANCY_MALE;
	DELETE FROM POPULATION_FEMALE;
	DELETE FROM POPULATION_MALE;
	DELETE FROM POPULATION_MIDYAER_ON_PERIOD;
	DELETE FROM POPULATION_MIDYEAR_ON_PERIOD_FEMALE;
	DELETE FROM POPULATION_MIDYEAR_ON_PERIOD_MALE;
	DELETE FROM POPULATION_DEMOGRAPHIC_RATES_GENERAL;
	DELETE FROM POPULATION_MALE_ON_PERION;
	DELETE FROM POPULATION_FEMALE_ON_PERION;
	DELETE FROM COUNTRIES;	


	END TRY  
			BEGIN CATCH  

			IF @@TRANCOUNT > 0  
				ROLLBACK TRANSACTION;  

				insert into ErrorLog
			    SELECT
					getdate()
			        ,ERROR_NUMBER() AS ErrorNumber  
			        ,ERROR_SEVERITY() AS ErrorSeverity  
			        ,ERROR_STATE() AS ErrorState  
			        ,'DBO.DeleteData' AS ErrorProcedure  
			        ,ERROR_LINE() AS ErrorLine  
			        ,ERROR_MESSAGE() AS ErrorMessage;  
			  
			END CATCH;  
			  
			IF @@TRANCOUNT > 0  
			    COMMIT TRANSACTION; 

GO
/****** Object:  StoredProcedure [etl].[CreateTables]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		G.MITSIS
-- Create date: 12/03/2023
-- Description:	create tables
-- =============================================
CREATE PROCEDURE [etl].[CreateTables]
	
AS
BEGIN
	
	IF OBJECT_ID('COUNTRIES'							) IS NULL 
		BEGIN 
			CREATE TABLE [DWH_INTERMIDIATE].[dbo].[COUNTRIES](
				[COUNTRY_ID] [int] IDENTITY(1,1) NOT NULL,
				[ISO] [varchar](2) NULL,
				[ISO3] [varchar](3) NULL,
				[ISO_CODE] [smallint] NULL,
				[FIPS] [varchar](2) NULL,
				[DISPLAY_NAME] [varchar](50) NULL,
				[OFFICIAL_NAME] [varchar](100) NULL,
				[CAPITAL] [varchar](50) NULL,
				[CONTINENT] [varchar](50) NULL,
				[CURRENCYCODE] [varchar](50) NULL,
				[CURRENCYNAME] [varchar](50) NULL,
				[PHONE] [varchar](50) NULL,
				[REGION_CODE] [tinyint] NULL,
				[REGION_NAME] [varchar](50) NULL,
				[SUB_REGION_CODE] [smallint] NULL,
				[SUB_REGION_NAME] [varchar](50) NULL,
				[INTERMEDIATE_REGION_CODE] [smallint] NULL,
				[INTERMEDIATE_REGION_NAME] [varchar](50) NULL,
				[STATUS] [varchar](50) NULL,
				[DEVELOPED_OR_DEVELOPING] [varchar](50) NULL,
				[SMALL_ISLAND_DEVELOPING_STATES_SIDS] [bit] NULL,
				[LAND_LOCKED_DEVELOPING_COUNTRIES_LLDC] [bit] NULL,
				[LEAST_DEVELOPED_COUNTRIES_LDC] [bit] NULL,
				[AREA_SQKM] [decimal](18, 4) NULL,
				[POPULATION] [int] NULL
			) ON [PRIMARY]
		end
	
	IF OBJECT_ID('Coutry_Region_Official_Mapping'		) IS NULL 
		BEGIN 
			CREATE TABLE [DWH_INTERMIDIATE].[dbo].[Coutry_Region_Official_Mapping](
				[country_id] [int] NOT NULL,
				[Display_Name] [varchar](100) NULL
			) ON [PRIMARY]
		END
	
	IF OBJECT_ID('ErrorLog'								) IS NULL 
		BEGIN 
			CREATE TABLE [DWH_INTERMIDIATE].[dbo].[ErrorLog](
				[ID] [int] IDENTITY(1,1) NOT NULL,
				[ReferenceDate] [datetime2](7) NULL,
				[ErrorNumber] [int] NULL,
				[ErrorSeverity] [int] NULL,
				[ErrorState] [int] NULL,
				[ErrorProcedure] [varchar](200) NULL,
				[ErrorLine] [int] NULL,
				[ErrorMessage] [varchar](500) NULL
			) ON [PRIMARY]
		END
	
	IF OBJECT_ID('FERTILITY_RATES_ON_PERIOD'			) IS NULL 
		BEGIN 
			CREATE TABLE [DWH_INTERMIDIATE].[dbo].[FERTILITY_RATES_ON_PERIOD](
				[COUNTRY_ID] [int] NOT NULL,
				[YEAR] [int] NOT NULL,
				[TOTAL_FLAG] [varchar](1) NULL,
				[STARTING_AGE] [int] NULL,
				[AGE_GROUP_INDICATOR] [varchar](1) NULL,
				[ENDING_AGE] [int] NULL,
				[FERTILITY_RATE] [decimal](18, 4) NULL
			) ON [PRIMARY]
		END
	
	IF OBJECT_ID('INDEXES_BY_COUNTRY'					) IS NULL 
		BEGIN 
			CREATE TABLE [DWH_INTERMIDIATE].[dbo].[INDEXES_BY_COUNTRY](
				[country_id] [int] NOT NULL,
				[year] [int] NOT NULL,
				[GDP_PER_CAPITA] [decimal](18, 4) NULL,
				[DOMESTIC_CREDITS] [decimal](18, 4) NULL,
				[INCOME_INDEX] [decimal](18, 4) NULL,
				[ESTIMATED_GNI_FEMALE] [decimal](18, 4) NULL,
				[ESTIMATED_GNI_MALE] [decimal](18, 4) NULL,
				[GDP_TOTAL] [decimal](18, 4) NULL,
				[GNI_PERCAPITA] [decimal](18, 4) NULL,
				[GROSS_FIXED_CAPITAL_FORMATION] [decimal](18, 4) NULL,
				[LABOUR_SHARE_OF_GDP] [decimal](18, 4) NULL
			) ON [PRIMARY]
		END
	
	IF OBJECT_ID('INDEXES_BY_REGION'					) IS NULL 
		BEGIN 
			CREATE TABLE [DWH_INTERMIDIATE].[dbo].[INDEXES_BY_REGION](
				[REGION] [varchar](256) NULL,
				[YEAR] [int] NOT NULL,
				[GDP_PER_CAPITA] [decimal](18, 4) NULL,
				[DOMESTIC_CREDITS] [decimal](18, 4) NULL,
				[INCOME_INDEX] [decimal](18, 4) NULL,
				[ESTIMATED_GNI_FEMALE] [decimal](18, 4) NULL,
				[ESTIMATED_GNI_MALE] [decimal](18, 4) NULL,
				[GDP_TOTAL] [decimal](18, 4) NULL,
				[GNI_PERCAPITA] [decimal](18, 4) NULL,
				[GROSS_FIXED_CAPITAL_FORMATION] [decimal](18, 4) NULL,
				[LABOUR_SHARE_OF_GDP] [decimal](18, 4) NULL
			) ON [PRIMARY]
		END
	
	IF OBJECT_ID('MORTALITY_LIFE_EXPECTANCY'			) IS NULL 
		BEGIN
			CREATE TABLE [DWH_INTERMIDIATE].[dbo].[MORTALITY_LIFE_EXPECTANCY](
				[COUNTRY_ID] [int] NOT NULL,
				[YEAR] [int] NOT NULL,
				[INFANT_MORTALITY] [decimal](18, 4) NULL,
				[LIFE_EXPECTANCY] [decimal](18, 4) NULL,
				[MORTALITY_RATE_1TO4] [decimal](18, 4) NULL,
				[MORTALITY_RATE_UNDER5] [decimal](18, 4) NULL
			) ON [PRIMARY]
		END
	
	IF OBJECT_ID('MORTALITY_LIFE_EXPECTANCY_FEMALE'			) IS NULL 
		BEGIN
			CREATE TABLE [DWH_INTERMIDIATE].[dbo].[MORTALITY_LIFE_EXPECTANCY_FEMALE](
				[COUNTRY_ID] [int] NOT NULL,
				[YEAR] [int] NOT NULL,
				[INFANT_MORTALITY_FEMALE] [decimal](18, 4) NULL,
				[LIFE_EXPECTANCY_FEMALE] [decimal](18, 4) NULL,
				[MORTALITY_RATE_1TO4_FEMALE] [decimal](18, 4) NULL,
				[MORTALITY_RATE_UNDER5_FEMALE] [decimal](18, 4) NULL
			) ON [PRIMARY]
		END
	
	IF OBJECT_ID('MORTALITY_LIFE_EXPECTANCY_MALE'			) IS NULL 
		BEGIN
			CREATE TABLE [DWH_INTERMIDIATE].[dbo].[MORTALITY_LIFE_EXPECTANCY_MALE](
				[COUNTRY_ID] [int] NOT NULL,
				[YEAR] [int] NOT NULL,
				[INFANT_MORTALITY_MALE] [decimal](18, 4) NULL,
				[LIFE_EXPECTANCY_MALE] [decimal](18, 4) NULL,
				[MORTALITY_RATE_1TO4_MALE] [decimal](18, 4) NULL,
				[MORTALITY_RATE_UNDER5_MALE] [decimal](18, 4) NULL
			) ON [PRIMARY]
		END
	
	
	IF OBJECT_ID('POPULATION_DEMOGRAPHIC_RATES_GENERAL'			) IS NULL 
		BEGIN
			CREATE TABLE [DWH_INTERMIDIATE].[dbo].[POPULATION_DEMOGRAPHIC_RATES_GENERAL](
				[COUNTRY_ID] [int] NULL,
				[YEAR] [int] NOT NULL,
				[INFANT_MORTALITY] [decimal](18, 4) NULL,
				[LIFE_EXPECTANCY] [decimal](18, 4) NULL,
				[MORTALITY_RATE_1TO4] [decimal](18, 4) NULL,
				[MORTALITY_RATE_UNDER5] [decimal](18, 4) NULL,
				[gross_reproduction_rate] [decimal](18, 4) NULL,
				[sex_ratio_at_birth] [decimal](18, 4) NULL,
				[CRUDE_BIRTH_RATE] [decimal](18, 4) NULL,
				[CRUDE_DEATH_RATE] [decimal](18, 4) NULL,
				[GROWTH_RATE] [decimal](18, 4) NULL,
				[NET_MIGRATION] [decimal](18, 4) NULL,
				[RATE_NATURAL_INCREASE] [decimal](18, 4) NULL
			) ON [PRIMARY]
		END
	
	
	IF OBJECT_ID('POPULATION_FEMALE'			) IS NULL 
		BEGIN
			CREATE TABLE [DWH_INTERMIDIATE].[dbo].[POPULATION_FEMALE](
				[COUNTRY_ID] [int] NOT NULL,
				[YEAR] [int] NOT NULL,
				[MAX_AGE] [int] NULL,
				[AGE_FLAG] [int] NULL,
				[POPULATION_FEMALE] [decimal](18, 4) NULL
			) ON [PRIMARY]
		END
	
	IF OBJECT_ID('POPULATION_MALE'			) IS NULL 
		BEGIN
			CREATE TABLE [DWH_INTERMIDIATE].[dbo].[POPULATION_MALE](
				[COUNTRY_ID] [int] NOT NULL,
				[YEAR] [int] NOT NULL,
				[MAX_AGE] [int] NULL,
				[AGE_FLAG] [int] NULL,
				[POPULATION_MALE] [decimal](18, 4) NULL
			) ON [PRIMARY]
		END
	
	
	IF OBJECT_ID('POPULATION_MIDYAER_ON_PERIOD'			) IS NULL 
		BEGIN
			CREATE TABLE [DWH_INTERMIDIATE].[dbo].[POPULATION_MIDYAER_ON_PERIOD](
				[COUNTRY_ID] [int] NOT NULL,
				[YEAR] [int] NOT NULL,
				[TOTAL_FLAG] [varchar](1) NULL,
				[STARTING_AGE] [int] NULL,
				[AGE_GROUP_INDICATOR] [varchar](1) NULL,
				[ENDING_AGE] [int] NULL,
				[MIDYEAR_POPULATION] [decimal](18, 4) NULL
			) ON [PRIMARY]
		END
	
	
	IF OBJECT_ID('POPULATION_MIDYEAR_ON_PERIOD_FEMALE'			) IS NULL 
		BEGIN
			CREATE TABLE [DWH_INTERMIDIATE].[dbo].[POPULATION_MIDYEAR_ON_PERIOD_FEMALE](
				[COUNTRY_ID] [int] NOT NULL,
				[YEAR] [int] NOT NULL,
				[TOTAL_FLAG] [varchar](1) NULL,
				[STARTING_AGE] [int] NULL,
				[AGE_GROUP_INDICATOR] [varchar](1) NULL,
				[ENDING_AGE] [int] NULL,
				[MIDYEAR_POPULATION_FEMALE] [decimal](18, 4) NULL
			) ON [PRIMARY]
		END
	
	
	IF OBJECT_ID('POPULATION_MIDYEAR_ON_PERIOD_MALE'			) IS NULL 
		BEGIN
			CREATE TABLE [DWH_INTERMIDIATE].[dbo].[POPULATION_MIDYEAR_ON_PERIOD_MALE](
				[COUNTRY_ID] [int] NOT NULL,
				[YEAR] [int] NOT NULL,
				[TOTAL_FLAG] [varchar](1) NULL,
				[STARTING_AGE] [int] NULL,
				[AGE_GROUP_INDICATOR] [varchar](1) NULL,
				[ENDING_AGE] [int] NULL,
				[MIDYEAR_POPULATION_MALE] [decimal](18, 4) NULL
			) ON [PRIMARY]
		END

	IF OBJECT_ID('POPULATION_MALE_ON_PERION'			) IS NULL 
		BEGIN
			CREATE TABLE [dbo].[POPULATION_MALE_ON_PERION](
				[COUNTRY_ID] [int] NOT NULL,
				[PM_YEAR] [int] NULL,
				[PM_TOTAL_FLAG] [varchar](1) NOT NULL,
				[PM_STARTING_AGE] [int] NULL,
				[PM_AGE_GROUP_INDICATOR] [varchar](1) NOT NULL,
				[PM_ENDING_AGE] [int] NULL,
				[PM_POPULATION_FEMALE] [decimal](38, 4) NULL
			) ON [PRIMARY]
		END

	IF OBJECT_ID('POPULATION_FEMALE_ON_PERION'			) IS NULL 
		BEGIN
			CREATE TABLE [dbo].[POPULATION_FEMALE_ON_PERION](
				[COUNTRY_ID] [int] NOT NULL,
				[PF_YEAR] [int] NULL,
				[PF_TOTAL_FLAG] [varchar](1) NOT NULL,
				[PF_STARTING_AGE] [int] NULL,
				[PF_AGE_GROUP_INDICATOR] [varchar](1) NOT NULL,
				[PF_ENDING_AGE] [int] NULL,
				[PF_POPULATION_FEMALE] [decimal](38, 4) NULL
			) ON [PRIMARY]
		END

END
GO
/****** Object:  StoredProcedure [etl].[importAMain]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		g.mitsis
-- Create date: 13/03/2023
-- Description:	IMPORT MAIN?
-- =============================================
CREATE procedure [etl].[importAMain]
	@WITH_CREATE_TABLES BIT = 0
	
AS
BEGIN TRANSACTION;  
  
	BEGIN TRY 
			
	
	--SELECT * FROM SYS.sql_modules a
	--INNER JOIN SYS.objects b on a.object_id = b.object_id
	
	IF(@WITH_CREATE_TABLES = 1)
	BEGIN 
		EXEC ETL.CreateTables;
	END
	
	EXEC etl.importCountries;
	EXEC [etl].[ImportFretilityRatesOnPeriod];
	exec [etl].[ImportIndexesByCountryOrRegion];
	exec [etl].[ImportPopulationDemographicRatesGeneral];
	exec [etl].[ImportPopulationFemale];
	exec [etl].[ImportPopulationMale];
	exec [etl].[ImportPopulationMidyearOnPeriod];
    
	END TRY  
			BEGIN CATCH  

			IF @@TRANCOUNT > 0  
				ROLLBACK TRANSACTION;  

				insert into ErrorLog
			    SELECT
					getdate()
			        ,ERROR_NUMBER() AS ErrorNumber  
			        ,ERROR_SEVERITY() AS ErrorSeverity  
			        ,ERROR_STATE() AS ErrorState  
			        ,'[etl].[importAMain]' AS ErrorProcedure  
			        ,ERROR_LINE() AS ErrorLine  
			        ,ERROR_MESSAGE() AS ErrorMessage;  
			  
			END CATCH;  
			  
			IF @@TRANCOUNT > 0  
			    COMMIT TRANSACTION;  
GO
/****** Object:  StoredProcedure [etl].[importCountries]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		g.mitsis
-- Create date: 2023-02-18
-- Description:	import Countries
-- =============================================
CREATE PROCEDURE [etl].[importCountries]
	
AS
BEGIN
	SET NOCOUNT ON;
	
		TRUNCATE TABLE DWH_INTERMIDIATE.DBO.COUNTRIES

		INSERT INTO DWH_INTERMIDIATE.DBO.COUNTRIES
		SELECT TRY_CAST([ISO]									AS	varchar(2) 		) AS [ISO]									
		      ,TRY_CAST([ISO3]									AS	varchar(3) 		) AS [ISO3]									
		      ,TRY_CAST([ISO_Code]								AS	smallint 		) AS [ISO_CODE]								
		      ,TRY_CAST([FIPS]									AS	varchar(2) 		) AS [FIPS]									
		      ,TRY_CAST([Display_Name]							AS	varchar(50) 	) AS [DISPLAY_NAME]							
		      ,TRY_CAST([Official_Name]							AS	varchar(100) 	) AS [OFFICIAL_NAME]							
		      ,TRY_CAST([Capital]								AS	varchar(50) 	) AS [CAPITAL]								
		      ,TRY_CAST([Continent]								AS	varchar(50) 	) AS [CONTINENT]								
		      ,TRY_CAST([CurrencyCode]							AS	varchar(50) 	) AS [CURRENCYCODE]							
		      ,TRY_CAST([CurrencyName]							AS	varchar(50) 	) AS [CURRENCYNAME]							
		      ,TRY_CAST([Phone]									AS	varchar(50) 	) AS [PHONE]									
		      ,TRY_CAST([Region_Code]							AS	tinyint 		) AS [REGION_CODE]							
		      ,TRY_CAST([Region_Name]							AS	varchar(50) 	) AS [REGION_NAME]							
		      ,TRY_CAST([Sub_region_Code]						AS	smallint 		) AS [SUB_REGION_CODE]						
		      ,TRY_CAST([Sub_region_Name]						AS	varchar(50) 	) AS [SUB_REGION_NAME]						
		      ,TRY_CAST([Intermediate_Region_Code]				AS	smallint 		) AS [INTERMEDIATE_REGION_CODE]				
		      ,TRY_CAST([Intermediate_Region_Name]				AS	varchar(50) 	) AS [INTERMEDIATE_REGION_NAME]				
		      ,TRY_CAST([Status]								AS	varchar(50) 	) AS [STATUS]								
		      ,TRY_CAST([Developed_or_Developing]				AS	varchar(50) 	) AS [DEVELOPED_OR_DEVELOPING]				
		      ,TRY_CAST([Small_Island_Developing_States_SIDS]	AS	bit 			) AS [SMALL_ISLAND_DEVELOPING_STATES_SIDS]	
		      ,TRY_CAST([Land_Locked_Developing_Countries_LLDC]	AS	bit 			) AS [LAND_LOCKED_DEVELOPING_COUNTRIES_LLDC]	
		      ,TRY_CAST([Least_Developed_Countries_LDC]			AS	bit 			) AS [LEAST_DEVELOPED_COUNTRIES_LDC]			
		      ,TRY_CAST([Area_SqKm]								AS	decimal(18, 4) 	) AS [AREA_SQKM]								
		      ,TRY_CAST([Population]							AS	int				) AS [POPULATION]	  
		FROM [DWH_STAGING].[dbo].[countries] A 
		ORDER BY A.Display_Name
		
		INSERT INTO DWH_INTERMIDIATE.DBO.COUNTRIES(ISO,FIPS,DISPLAY_NAME,OFFICIAL_NAME)
			VALUES('GZ','GZ','Gaza Strip','Gaza Strip')	;
    
END
GO
/****** Object:  StoredProcedure [etl].[ImportFretilityRatesOnPeriod]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		g.mitsis
-- Create date: 11/03/2023
-- Description:	Import Fretility Rates On Period
-- =============================================
CREATE PROCEDURE [etl].[ImportFretilityRatesOnPeriod]
	
AS
	BEGIN TRANSACTION;  
  
		BEGIN TRY 
			
			TRUNCATE TABLE [DWH_INTERMIDIATE].DBO.FERTILITY_RATES_ON_PERIOD

			;WITH AGE_SPECIFIC_FERTILITY_RATES_CTE AS (
			
			  SELECT COUNTRY_CODE 
					,[COUNTRY_NAME]
					,[YEAR]
					,CASE 
						WHEN AGE_GROUPS LIKE 'TOTAL%' THEN '*' 
						WHEN AGE_GROUPS  NOT LIKE 'TOTAL%' THEN 'A' 				
					END AS TOTAL_FLAG	
					,CASE 
						WHEN AGE_GROUPS LIKE 'TOTAL%' THEN '0' 
						WHEN AGE_GROUPS  NOT LIKE 'TOTAL%' THEN SUBSTRING(AGE_GROUPS,LEN('FERTILITY_RATE_1'),2) 				
					END AS STARTING_AGE
					,CASE 
						WHEN AGE_GROUPS LIKE 'TOTAL%' THEN '+' 
						WHEN AGE_GROUPS  NOT LIKE 'TOTAL%' THEN '-' 				
					END AS AGE_GROUP_INDICATOR
					,CASE 
						WHEN AGE_GROUPS LIKE 'TOTAL%' THEN '0' 
						WHEN AGE_GROUPS  NOT LIKE 'TOTAL%' THEN RIGHT(AGE_GROUPS,2) 				
					END AS ENDING_AGE
					,FERTILITY_RATE	
						FROM   
						   (SELECT [COUNTRY_CODE]
			      ,[COUNTRY_NAME]
			      ,[YEAR]
			      ,[FERTILITY_RATE_15_19]
			      ,[FERTILITY_RATE_20_24]
			      ,[FERTILITY_RATE_25_29]
			      ,[FERTILITY_RATE_30_34]
			      ,[FERTILITY_RATE_35_39]
			      ,[FERTILITY_RATE_40_44]
			      ,[FERTILITY_RATE_45_49]
			      ,[TOTAL_FERTILITY_RATE]			       				  
			  FROM [DWH_STAGING].[DBO].[AGE_SPECIFIC_FERTILITY_RATES] ) P  
						UNPIVOT  
						   ( FERTILITY_RATE FOR AGE_GROUPS IN   
						      ([FERTILITY_RATE_15_19]
								,[FERTILITY_RATE_20_24]
								,[FERTILITY_RATE_25_29]
								,[FERTILITY_RATE_30_34]
								,[FERTILITY_RATE_35_39]
								,[FERTILITY_RATE_40_44]
								,[FERTILITY_RATE_45_49]
								,[TOTAL_FERTILITY_RATE])  
						)AS UNPVT)
						INSERT INTO [DWH_INTERMIDIATE].DBO.FERTILITY_RATES_ON_PERIOD
						SELECT 
							C.COUNTRY_ID
							,TRY_CAST(A.[YEAR] AS INT ) [YEAR]
							,TRY_CAST(A.TOTAL_FLAG AS VARCHAR(1)) AS TOTAL_FLAG
							,TRY_CAST(A.STARTING_AGE AS INT) AS STARTING_AGE
							,TRY_CAST(A.AGE_GROUP_INDICATOR AS VARCHAR(1)) AS AGE_GROUP_INDICATOR
							,TRY_CAST(A.ENDING_AGE AS INT) AS ENDING_AGE 
							,TRY_CAST(A.FERTILITY_RATE AS DECIMAL(18,4)) AS FERTILITY_RATE 												
						FROM AGE_SPECIFIC_FERTILITY_RATES_CTE  A			
						INNER JOIN DWH_INTERMIDIATE.DBO.COUNTRIES C 
							ON A.COUNTRY_CODE = C.FIPS

		END TRY  
			BEGIN CATCH  

			IF @@TRANCOUNT > 0  
				ROLLBACK TRANSACTION;  

				insert into ErrorLog
			    SELECT
					getdate()
			        ,ERROR_NUMBER() AS ErrorNumber  
			        ,ERROR_SEVERITY() AS ErrorSeverity  
			        ,ERROR_STATE() AS ErrorState  
			        ,'[etl].[ImportFretilityRatesOnPeriod]' AS ErrorProcedure  
			        ,ERROR_LINE() AS ErrorLine  
			        ,ERROR_MESSAGE() AS ErrorMessage;  
			  
			END CATCH;  
			  
			IF @@TRANCOUNT > 0  
			    COMMIT TRANSACTION;  

GO
/****** Object:  StoredProcedure [etl].[ImportIndexesByCountryOrRegion]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		g.mitsis
-- Create date: 11/03/2023
-- Description:	Import Indexes By Country Or Region
-- =============================================
CREATE PROCEDURE [etl].[ImportIndexesByCountryOrRegion]
	
AS
	BEGIN TRANSACTION;  
  
		BEGIN TRY 
			drop table if exists #DomesticCredits
			drop table if exists #IncomeIndex
			drop table if exists #EstimatedGNIfemale
			drop table if exists #EstimatedGNImale
			drop table if exists #GDPpercapita
			drop table if exists #GDPtotal
			drop table if exists #GNIpercapita
			drop table if exists #Grossfixedcapitalformation
			drop table if exists #LabourshareofGDP
			drop table if exists #IncomeIndex
			drop table if exists #indexes_by_country
			
			SELECT * into #EstimatedGNIfemale
			FROM   
			   (SELECT [Country]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/6.0) as [1990]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/6.0) as [1991]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/6.0) as [1992]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/6.0) as [1993]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/6.0) as [1994]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/6.0) as [1995]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1996]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1997]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1998]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1999]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [2000]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2001]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2002]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2003]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2004]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2005]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2006]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2007]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2008]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2009]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018]  
			   FROM DWH_STAGING.dbo.EstimatedGNIfemale) p  
			UNPIVOT  
			   ( EstimatedGNIfemale FOR [year] IN   
			      ([1990]
			      ,[1991]
			      ,[1992]
			      ,[1993]
			      ,[1994]
			      ,[1995]
			      ,[1996]
			      ,[1997]
			      ,[1998]
			      ,[1999]
			      ,[2000]
			      ,[2001]
			      ,[2002]
			      ,[2003]
			      ,[2004]
			      ,[2005]
			      ,[2006]
			      ,[2007]
			      ,[2008]
			      ,[2009]
			      ,[2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018])  
			)AS unpvt;  
			 
			
			SELECT * into #EstimatedGNImale
			FROM   
			   (SELECT [Country]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/6.0) as [1990]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/6.0) as [1991]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/6.0) as [1992]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/6.0) as [1993]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/6.0) as [1994]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/6.0) as [1995]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1996]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1997]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1998]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1999]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [2000]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2001]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2002]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2003]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2004]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2005]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2006]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2007]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2008]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2009]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018]       
			   FROM DWH_STAGING.dbo.[EstimatedGNImale]) p  
			UNPIVOT  
			   ( EstimatedGNImale FOR [year] IN   
			      ([1990]
			      ,[1991]
			      ,[1992]
			      ,[1993]
			      ,[1994]
			      ,[1995]
			      ,[1996]
			      ,[1997]
			      ,[1998]
			      ,[1999]
			      ,[2000]
			      ,[2001]
			      ,[2002]
			      ,[2003]
			      ,[2004]
			      ,[2005]
			      ,[2006]
			      ,[2007]
			      ,[2008]
			      ,[2009]
			      ,[2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018])
			)as  unpvt
			
			SELECT * into #GDPpercapita
			FROM   
			   (SELECT [Country]
			      ,[1990]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1991]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1992]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1993]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1994]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1995]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1996]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1997]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1998]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1999]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [2000]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2001]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2002]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2003]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2004]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2005]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2006]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2007]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2008]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2009]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018]        
			   FROM DWH_STAGING.[dbo].[GDPpercapita]) p  
			UNPIVOT  
			   ( [GDPpercapita] FOR [year] IN   
			      ([1990]
			      ,[1991]
			      ,[1992]
			      ,[1993]
			      ,[1994]
			      ,[1995]
			      ,[1996]
			      ,[1997]
			      ,[1998]
			      ,[1999]
			      ,[2000]
			      ,[2001]
			      ,[2002]
			      ,[2003]
			      ,[2004]
			      ,[2005]
			      ,[2006]
			      ,[2007]
			      ,[2008]
			      ,[2009]
			      ,[2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018])
			)as  unpvt
			
			SELECT * into #GDPtotal
			FROM   
			   (SELECT [Country]
			      ,[1990]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1991]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1992]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1993]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1994]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1995]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1996]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1997]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1998]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1999]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [2000]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2001]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2002]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2003]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2004]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2005]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2006]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2007]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2008]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2009]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018]        
			   FROM DWH_STAGING.dbo.[GDPtotal]) p  
			UNPIVOT  
			   ( [GDPtotal] FOR [year] IN   
			      ([1990]
			      ,[1991]
			      ,[1992]
			      ,[1993]
			      ,[1994]
			      ,[1995]
			      ,[1996]
			      ,[1997]
			      ,[1998]
			      ,[1999]
			      ,[2000]
			      ,[2001]
			      ,[2002]
			      ,[2003]
			      ,[2004]
			      ,[2005]
			      ,[2006]
			      ,[2007]
			      ,[2008]
			      ,[2009]
			      ,[2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018])
			)as  unpvt
			
			SELECT * into #GNIpercapita
			FROM   
			   (SELECT [Country]
			      ,[1990]
			      ,[1991]
			      ,[1992]
			      ,[1993]
			      ,[1994]
			      ,[1995]
			      ,[1996]
			      ,[1997]
			      ,[1998]
			      ,[1999]
			      ,[2000]
			      ,[2001]
			      ,[2002]
			      ,[2003]
			      ,[2004]
			      ,[2005]
			      ,[2006]
			      ,[2007]
			      ,[2008]
			      ,[2009]
			      ,[2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018]      
			   FROM DWH_STAGING.dbo.[GNIpercapita]) p  
			UNPIVOT  
			   ( [GNIpercapita] FOR [year] IN   
			      ([1990]
			      ,[1991]
			      ,[1992]
			      ,[1993]
			      ,[1994]
			      ,[1995]
			      ,[1996]
			      ,[1997]
			      ,[1998]
			      ,[1999]
			      ,[2000]
			      ,[2001]
			      ,[2002]
			      ,[2003]
			      ,[2004]
			      ,[2005]
			      ,[2006]
			      ,[2007]
			      ,[2008]
			      ,[2009]
			      ,[2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018])
			)as  unpvt
			
			
			SELECT * into #Grossfixedcapitalformation
			FROM   
			   (SELECT [Country]
			      ,[1990]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1991]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1992]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1993]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1994]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1995]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1996]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1997]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1998]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1999]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [2000]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2001]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2002]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2003]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2004]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2005]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2006]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2007]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2008]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2009]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018]        
			   FROM DWH_STAGING.dbo.[Grossfixedcapitalformation]) p  
			UNPIVOT  
			   ( [Grossfixedcapitalformation] FOR [year] IN   
			      ([1990]
			      ,[1991]
			      ,[1992]
			      ,[1993]
			      ,[1994]
			      ,[1995]
			      ,[1996]
			      ,[1997]
			      ,[1998]
			      ,[1999]
			      ,[2000]
			      ,[2001]
			      ,[2002]
			      ,[2003]
			      ,[2004]
			      ,[2005]
			      ,[2006]
			      ,[2007]
			      ,[2008]
			      ,[2009]
			      ,[2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018])
			)as  unpvt
			
			SELECT * into #LabourshareofGDP
			FROM   
			   (SELECT [Country]      
			      ,convert(varchar(256),convert(decimal(18,2),2000)/10.0) as [1990]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/10.0) as [1991]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/10.0) as [1992]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/10.0) as [1993]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/10.0) as [1994]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/10.0) as [1995]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/10.0) as [1996]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/10.0) as [1997]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/10.0) as [1998]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/10.0) as [1999]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/10.0) as [2000]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2001]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2002]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2003]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2004]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2005]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2006]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2007]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2008]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2009]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018]       
			   FROM DWH_STAGING.dbo.[LabourshareofGDP]) p  
			UNPIVOT  
			   ( [LabourshareofGDP] FOR [year] IN   
			      ([1990]
			      ,[1991]
			      ,[1992]
			      ,[1993]
			      ,[1994]
			      ,[1995]
			      ,[1996]
			      ,[1997]
			      ,[1998]
			      ,[1999]
			      ,[2000]
			      ,[2001]
			      ,[2002]
			      ,[2003]
			      ,[2004]
			      ,[2005]
			      ,[2006]
			      ,[2007]
			      ,[2008]
			      ,[2009]
			      ,[2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018])
			)as  unpvt
			
			SELECT * into #DomesticCredits
			FROM   
			   (SELECT [Country]
			      ,[1990]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1991]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1992]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1993]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1994]
			      ,convert(varchar(256),convert(decimal(18,2),1995)/5.0) as [1995]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1996]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1997]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1998]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [1999]
			      ,convert(varchar(256),convert(decimal(18,2),2000)/5.0) as [2000]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2001]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2002]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2003]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2004]
			      ,convert(varchar(256),convert(decimal(18,2),2005)/5.0) as [2005]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2006]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2007]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2008]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2009]
			      ,convert(varchar(256),convert(decimal(18,2),2010)/5.0) as [2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018]     
			   FROM DWH_STAGING.dbo.[DomesticCredits]) p  
			UNPIVOT  
			   ( [DomesticCredits] FOR [year] IN   
			      ([1990]
			      ,[1991]
			      ,[1992]
			      ,[1993]
			      ,[1994]
			      ,[1995]
			      ,[1996]
			      ,[1997]
			      ,[1998]
			      ,[1999]
			      ,[2000]
			      ,[2001]
			      ,[2002]
			      ,[2003]
			      ,[2004]
			      ,[2005]
			      ,[2006]
			      ,[2007]
			      ,[2008]
			      ,[2009]
			      ,[2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018])
			)as  unpvt
			
			SELECT * into #IncomeIndex
			FROM   
			   (SELECT [Country]
			      ,[1990]
			      ,[1991]
			      ,[1992]
			      ,[1993]
			      ,[1994]
			      ,[1995]
			      ,[1996]
			      ,[1997]
			      ,[1998]
			      ,[1999]
			      ,[2000]
			      ,[2001]
			      ,[2002]
			      ,[2003]
			      ,[2004]
			      ,[2005]
			      ,[2006]
			      ,[2007]
			      ,[2008]
			      ,[2009]
			      ,[2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018]      
			   FROM DWH_STAGING.dbo.[IncomeIndex]) p  
			UNPIVOT  
			   ( [IncomeIndex] FOR [year] IN   
			      ([1990]
			      ,[1991]
			      ,[1992]
			      ,[1993]
			      ,[1994]
			      ,[1995]
			      ,[1996]
			      ,[1997]
			      ,[1998]
			      ,[1999]
			      ,[2000]
			      ,[2001]
			      ,[2002]
			      ,[2003]
			      ,[2004]
			      ,[2005]
			      ,[2006]
			      ,[2007]
			      ,[2008]
			      ,[2009]
			      ,[2010]
			      ,[2011]
			      ,[2012]
			      ,[2013]
			      ,[2014]
			      ,[2015]
			      ,[2016]
			      ,[2017]
			      ,[2018])
			)as  unpvt
			
			
			select 
				coalesce(a.country,b.country,c.country,d.country,e.country,f.country,g.country,h.country,i.country)	country
				,try_cast(coalesce(a.[YEAR],b.[YEAR],c.[YEAR],d.[YEAR],e.[YEAR],f.[YEAR],g.[YEAR],h.[YEAR],i.[YEAR]) as int)		as [YEAR] 
				,MAX(try_cast(c.GDPpercapita					as decimal(18,4))) as GDP_PER_CAPITA
				,MAX(try_cast(b.DomesticCredits					as decimal(18,4))) as DOMESTIC_CREDITS
				,MAX(try_cast(a.IncomeIndex						as decimal(18,4))) as INCOME_INDEX
				,MAX(try_cast(d.EstimatedGNIfemale				as decimal(18,4))) as ESTIMATED_GNI_FEMALE
				,MAX(try_cast(e.EstimatedGNImale				as decimal(18,4))) as ESTIMATED_GNI_MALE
				,MAX(try_cast(f.GDPtotal						as decimal(18,4))) as GDP_TOTAL
				,MAX(try_cast(g.GNIpercapita					as decimal(18,4))) as GNI_PERCAPITA
				,MAX(try_cast(h.Grossfixedcapitalformation		as decimal(18,4))) as GROSS_FIXED_CAPITAL_FORMATION
				,MAX(try_cast(i.LabourshareofGDP				as decimal(18,4))) as LABOUR_SHARE_OF_GDP
				into #indexes_by_country				
			from  #IncomeIndex a				
			full outer join  #DomesticCredits b					on a.country = b.country and a.[year] = b.[year]
			full outer join  #GDPpercapita c					on a.country = c.country and a.[year] = c.[year]
			full outer join  #EstimatedGNIfemale d				on a.country = d.country and a.[year] = d.[year]
			full outer join  #EstimatedGNImale e				on a.country = e.country and a.[year] = e.[year]
			full outer join  #GDPtotal f						on a.country = f.country and a.[year] = f.[year]
			full outer join  #GNIpercapita g					on a.country = g.country and a.[year] = g.[year]
			full outer join  #Grossfixedcapitalformation h		on a.country = h.country and a.[year] = h.[year]
			full outer join  #LabourshareofGDP i				on a.country = i.country and a.[year] = i.[year]
			GROUP BY coalesce(a.country,b.country,c.country,d.country,e.country,f.country,g.country,h.country,i.country)	
				,coalesce(a.[YEAR],b.[YEAR],c.[YEAR],d.[YEAR],e.[YEAR],f.[YEAR],g.[YEAR],h.[YEAR],i.[YEAR]) 


			truncate table [dbo].[INDEXES_BY_REGION]
			INSERT INTO [dbo].[INDEXES_BY_REGION]
			           ([REGION]
			           ,[year]
			           ,GDP_PER_CAPITA
			           ,DOMESTIC_CREDITS
			           ,INCOME_INDEX
			           ,ESTIMATED_GNI_FEMALE
			           ,ESTIMATED_GNI_MALE
			           ,GDP_TOTAL
			           ,GNI_PERCAPITA
			           ,GROSS_FIXED_CAPITAL_FORMATION
			           ,LABOUR_SHARE_OF_GDP)
			select a.country AS [REGION]
			,a.[year] AS [YEAR]
			,a.GDP_PER_CAPITA
			,a.DOMESTIC_CREDITS	
			,a.INCOME_INDEX	
			,a.ESTIMATED_GNI_FEMALE	
			,a.ESTIMATED_GNI_MALE
			,a.GDP_TOTAL
			,a.GNI_PERCAPITA
			,a.GROSS_FIXED_CAPITAL_FORMATION	
			,a.LABOUR_SHARE_OF_GDP 				
			from #indexes_by_country a
			left join Coutry_Region_Official_Mapping b
				on a.country = b.Display_Name
			left join countries c
				on b.country_id = c.country_id
			where b.country_id is null
			
			
			truncate table [dbo].[indexes_by_country]
			INSERT INTO [dbo].[indexes_by_country]
			           ([country_id]
			           ,[year]
			           ,GDP_PER_CAPITA
			           ,DOMESTIC_CREDITS
			           ,INCOME_INDEX
			           ,ESTIMATED_GNI_FEMALE
			           ,ESTIMATED_GNI_MALE
			           ,GDP_TOTAL
			           ,GNI_PERCAPITA
			           ,GROSS_FIXED_CAPITAL_FORMATION
			           ,LABOUR_SHARE_OF_GDP)
			select c.country_id
			,a.[year]
			,a.GDP_PER_CAPITA
			,a.DOMESTIC_CREDITS	
			,a.INCOME_INDEX	
			,a.ESTIMATED_GNI_FEMALE	
			,a.ESTIMATED_GNI_MALE
			,a.GDP_TOTAL
			,a.GNI_PERCAPITA
			,a.GROSS_FIXED_CAPITAL_FORMATION	
			,a.LABOUR_SHARE_OF_GDP 			
			from #indexes_by_country a
			inner join Coutry_Region_Official_Mapping b
				on a.country = b.Display_Name
			inner join countries c
				on b.country_id = c.country_id

		END TRY  
			BEGIN CATCH  

			IF @@TRANCOUNT > 0  
				ROLLBACK TRANSACTION;  

				insert into ErrorLog
			    SELECT
					getdate()
			        ,ERROR_NUMBER() AS ErrorNumber  
			        ,ERROR_SEVERITY() AS ErrorSeverity  
			        ,ERROR_STATE() AS ErrorState  
			        ,'[etl].[ImportIndexesByCountryOrRegion]' AS ErrorProcedure  
			        ,ERROR_LINE() AS ErrorLine  
			        ,ERROR_MESSAGE() AS ErrorMessage;  
			  
			END CATCH;  
			  
			IF @@TRANCOUNT > 0  
			    COMMIT TRANSACTION; 

GO
/****** Object:  StoredProcedure [etl].[ImportPopulationDemographicRatesGeneral]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		g.mitsis
-- Create date: 2023-03-07
-- Description:	Import Population Demographic Rates General
-- exec [etl].[ImportPopulationDemographicRatesGeneral]
-- =============================================
CREATE PROCEDURE [etl].[ImportPopulationDemographicRatesGeneral]
	
AS
BEGIN
	
	 BEGIN TRANSACTION;  
  
		BEGIN TRY 

			drop table if exists #mortality_life_expectancy_with_country_id
			drop table if exists #age_specific_fertility_rates
			drop table if exists #birth_death_growth_rates

			select 
					b.country_id 
			      ,try_cast([year] as int)										AS [year]
			      ,try_cast([infant_mortality] as decimal(18,4)) 				AS [infant_mortality]
			      ,try_cast([infant_mortality_male] as decimal(18,4))			AS [infant_mortality_male]
			      ,try_cast([infant_mortality_female]  as decimal(18,4))		AS [infant_mortality_female]
			      ,try_cast([life_expectancy]  as decimal(18,4))				AS [life_expectancy]
			      ,try_cast([life_expectancy_male]  as decimal(18,4))			AS [life_expectancy_male]
			      ,try_cast([life_expectancy_female]  as decimal(18,4))			AS [life_expectancy_female]
			      ,try_cast([mortality_rate_under5]  as decimal(18,4))			AS [mortality_rate_under5]
			      ,try_cast([mortality_rate_under5_male]  as decimal(18,4))		AS [mortality_rate_under5_male]
			      ,try_cast([mortality_rate_under5_female]  as decimal(18,4))	AS [mortality_rate_under5_female]
			      ,try_cast([mortality_rate_1to4]  as decimal(18,4))			AS [mortality_rate_1to4]
			      ,try_cast([mortality_rate_1to4_male]  as decimal(18,4))		AS [mortality_rate_1to4_male]
			      ,try_cast([mortality_rate_1to4_female]  as decimal(18,4))		AS [mortality_rate_1to4_female]
				  into #mortality_life_expectancy_with_country_id
			from DWH_STAGING.dbo.mortality_life_expectancy a 
			inner join [DWH_INTERMIDIATE].dbo.countries b on rtrim(ltrim(a.country_code)) = rtrim(ltrim(b.fips))
			
			SELECT
				 B.country_id													AS COUNTRY_ID
				,TRY_CAST([year]					aS int)						AS [YEAR]					
				,TRY_CAST([crude_birth_rate]		aS decimal(18,4))			AS [CRUDE_BIRTH_RATE]		
				,TRY_CAST([crude_death_rate]		aS decimal(18,4))			AS [CRUDE_DEATH_RATE]		
				,TRY_CAST([net_migration]			aS decimal(18,4))			AS [NET_MIGRATION]			
				,TRY_CAST([rate_natural_increase]	aS decimal(18,4))			AS [RATE_NATURAL_INCREASE]	
				,TRY_CAST([growth_rate]				aS decimal(18,4))			AS [GROWTH_RATE]
				INTO #birth_death_growth_rates
			FROM [DWH_STAGING].[dbo].[birth_death_growth_rates] A
			inner join [DWH_INTERMIDIATE].dbo.countries b on rtrim(ltrim(a.country_code)) = rtrim(ltrim(b.fips))
			 
			SELECT 
				B.country_id													AS COUNTRY_ID
				,TRY_CAST(A.[year]					AS INT)						AS [year]
				,TRY_CAST(A.gross_reproduction_rate	AS DECIMAL(18,4))			AS gross_reproduction_rate
				,TRY_CAST(A.sex_ratio_at_birth		AS DECIMAL(18,4))			AS sex_ratio_at_birth
				INTO #age_specific_fertility_rates
			FROM [DWH_STAGING].[dbo].[age_specific_fertility_rates] A
			inner join [DWH_INTERMIDIATE].dbo.countries b on rtrim(ltrim(a.country_code)) = rtrim(ltrim(b.fips))

			TRUNCATE TABLE [DWH_INTERMIDIATE].[dbo].[MORTALITY_LIFE_EXPECTANCY_MALE]
			INSERT INTO [DWH_INTERMIDIATE].[dbo].[MORTALITY_LIFE_EXPECTANCY_MALE]
			SELECT  
				 A.country_id					AS COUNTRY_ID
				,A.[year]						AS [YEAR]
				,A.infant_mortality_male		AS INFANT_MORTALITY_MALE
				,A.life_expectancy_male			AS LIFE_EXPECTANCY_MALE				
				,A.mortality_rate_1to4_male		AS MORTALITY_RATE_1TO4_MALE
				,A.mortality_rate_under5_male	AS MORTALITY_RATE_UNDER5_MALE				
			FROM #mortality_life_expectancy_with_country_id A

			TRUNCATE TABLE [DWH_INTERMIDIATE].[dbo].[MORTALITY_LIFE_EXPECTANCY_FEMALE]
			INSERT INTO [DWH_INTERMIDIATE].[dbo].[MORTALITY_LIFE_EXPECTANCY_FEMALE]
			SELECT  
				 A.country_id					AS COUNTRY_ID
				,A.[year]						AS [YEAR]
				,A.infant_mortality_female		AS INFANT_MORTALITY_FEMALE
				,A.life_expectancy_female		AS LIFE_EXPECTANCY_FEMALE				
				,A.mortality_rate_1to4_female	AS MORTALITY_RATE_1TO4_FEMALE
				,A.mortality_rate_under5_female	AS MORTALITY_RATE_UNDER5_FEMALE				
			FROM #mortality_life_expectancy_with_country_id A

			TRUNCATE TABLE [DWH_INTERMIDIATE].[dbo].[POPULATION_DEMOGRAPHIC_RATES_GENERAL]
			INSERT INTO [DWH_INTERMIDIATE].[dbo].[POPULATION_DEMOGRAPHIC_RATES_GENERAL]
			SELECT  
				 COALESCE(A.country_id,b.country_id,c.country_id)		AS COUNTRY_ID
				,COALESCE(A.[year],b.[year],c.[year])						AS [YEAR]
				,A.infant_mortality				AS INFANT_MORTALITY
				,A.life_expectancy				AS LIFE_EXPECTANCY				
				,A.mortality_rate_1to4			AS MORTALITY_RATE_1TO4
				,A.mortality_rate_under5		AS MORTALITY_RATE_UNDER5
				,b.gross_reproduction_rate
				,b.sex_ratio_at_birth
				,c.CRUDE_BIRTH_RATE
				,c.CRUDE_DEATH_RATE
				,c.GROWTH_RATE
				,c.NET_MIGRATION
				,c.RATE_NATURAL_INCREASE					
			FROM #mortality_life_expectancy_with_country_id A 
			full outer join #age_specific_fertility_rates b 
				on a.country_id = b.COUNTRY_ID
				and a.[year] = b.[year]
			full outer join #birth_death_growth_rates c 
				on a.country_id = c.COUNTRY_ID
				and a.[year] = c.[year]
			


		END TRY  
			BEGIN CATCH  

			IF @@TRANCOUNT > 0  
				ROLLBACK TRANSACTION;  

				insert into ErrorLog
			    SELECT
					getdate()
			        ,ERROR_NUMBER() AS ErrorNumber  
			        ,ERROR_SEVERITY() AS ErrorSeverity  
			        ,ERROR_STATE() AS ErrorState  
			        ,'[etl].[ImportPopulationDemographicRatesGeneral]' AS ErrorProcedure  
			        ,ERROR_LINE() AS ErrorLine  
			        ,ERROR_MESSAGE() AS ErrorMessage;  
			  
			END CATCH;  
			  
			IF @@TRANCOUNT > 0  
			    COMMIT TRANSACTION; 

END
GO
/****** Object:  StoredProcedure [etl].[ImportPopulationFemale]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		g.mitsis
-- Create date: 11/03/2023
-- Description:	Import Import Female Population
-- =============================================
CREATE PROCEDURE [etl].[ImportPopulationFemale]
	
AS
	BEGIN TRANSACTION;  
  
		BEGIN TRY 
			
			TRUNCATE TABLE [DWH_INTERMIDIATE].DBO.POPULATION_FEMALE

			;WITH MALE_POPULATION_CTE AS (
			
			  SELECT COUNTRY_CODE 
					,[COUNTRY_NAME]
					,[YEAR]
					,[max_age]
					,AGE_FLAG
					,[POPULATION]
					
						FROM   
						   (SELECT 
								[country_code]
								,[country_name]
								,[year]
								,[sex]
								,[max_age]
								,[population_age_0]	  AS [0]
								,[population_age_1]	  AS [1]
								,[population_age_2]	  AS [2]
								,[population_age_3]	  AS [3]
								,[population_age_4]	  AS [4]
								,[population_age_5]	  AS [5]
								,[population_age_6]	  AS [6]
								,[population_age_7]	  AS [7]
								,[population_age_8]	  AS [8]
								,[population_age_9]	  AS [9]
								,[population_age_10]  AS [10]
								,[population_age_11]  AS [11]
								,[population_age_12]  AS [12]
								,[population_age_13]  AS [13]
								,[population_age_14]  AS [14]
								,[population_age_15]  AS [15]
								,[population_age_16]  AS [16]
								,[population_age_17]  AS [17]
								,[population_age_18]  AS [18]
								,[population_age_19]  AS [19]
								,[population_age_20]  AS [20]
								,[population_age_21]  AS [21]
								,[population_age_22]  AS [22]
								,[population_age_23]  AS [23]
								,[population_age_24]  AS [24]
								,[population_age_25]  AS [25]
								,[population_age_26]  AS [26]
								,[population_age_27]  AS [27]
								,[population_age_28]  AS [28]
								,[population_age_29]  AS [29]
								,[population_age_30]  AS [30]
								,[population_age_31]  AS [31]
								,[population_age_32]  AS [32]
								,[population_age_33]  AS [33]
								,[population_age_34]  AS [34]
								,[population_age_35]  AS [35]
								,[population_age_36]  AS [36]
								,[population_age_37]  AS [37]
								,[population_age_38]  AS [38]
								,[population_age_39]  AS [39]
								,[population_age_40]  AS [40]
								,[population_age_41]  AS [41]
								,[population_age_42]  AS [42]
								,[population_age_43]  AS [43]
								,[population_age_44]  AS [44]
								,[population_age_45]  AS [45]
								,[population_age_46]  AS [46]
								,[population_age_47]  AS [47]
								,[population_age_48]  AS [48]
								,[population_age_49]  AS [49]
								,[population_age_50]  AS [50]
								,[population_age_51]  AS [51]
								,[population_age_52]  AS [52]
								,[population_age_53]  AS [53]
								,[population_age_54]  AS [54]
								,[population_age_55]  AS [55]
								,[population_age_56]  AS [56]
								,[population_age_57]  AS [57]
								,[population_age_58]  AS [58]
								,[population_age_59]  AS [59]
								,[population_age_60]  AS [60]
								,[population_age_61]  AS [61]
								,[population_age_62]  AS [62]
								,[population_age_63]  AS [63]
								,[population_age_64]  AS [64]
								,[population_age_65]  AS [65]
								,[population_age_66]  AS [66]
								,[population_age_67]  AS [67]
								,[population_age_68]  AS [68]
								,[population_age_69]  AS [69]
								,[population_age_70]  AS [70]
								,[population_age_71]  AS [71]
								,[population_age_72]  AS [72]
								,[population_age_73]  AS [73]
								,[population_age_74]  AS [74]
								,[population_age_75]  AS [75]
								,[population_age_76]  AS [76]
								,[population_age_77]  AS [77]
								,[population_age_78]  AS [78]
								,[population_age_79]  AS [79]
								,[population_age_80]  AS [80]
								,[population_age_81]  AS [81]
								,[population_age_82]  AS [82]
								,[population_age_83]  AS [83]
								,[population_age_84]  AS [84]
								,[population_age_85]  AS [85]
								,[population_age_86]  AS [86]
								,[population_age_87]  AS [87]
								,[population_age_88]  AS [88]
								,[population_age_89]  AS [89]
								,[population_age_90]  AS [90]
								,[population_age_91]  AS [91]
								,[population_age_92]  AS [92]
								,[population_age_93]  AS [93]
								,[population_age_94]  AS [94]
								,[population_age_95]  AS [95]
								,[population_age_96]  AS [96]
								,[population_age_97]  AS [97]
								,[population_age_98]  AS [98]
								,[population_age_99]  AS [99]
								,[population_age_100] AS [100]
			  FROM [DWH_STAGING].[dbo].[midyear_population_age_sex] WHERE SEX = 'Female') P  
						UNPIVOT  
						   ( [POPULATION] FOR AGE_FLAG IN   
						      ([0]
								,[1]
								,[2]
								,[3]
								,[4]
								,[5]
								,[6]
								,[7]
								,[8]
								,[9]
								,[10]
								,[11]
								,[12]
								,[13]
								,[14]
								,[15]
								,[16]
								,[17]
								,[18]
								,[19]
								,[20]
								,[21]
								,[22]
								,[23]
								,[24]
								,[25]
								,[26]
								,[27]
								,[28]
								,[29]
								,[30]
								,[31]
								,[32]
								,[33]
								,[34]
								,[35]
								,[36]
								,[37]
								,[38]
								,[39]
								,[40]
								,[41]
								,[42]
								,[43]
								,[44]
								,[45]
								,[46]
								,[47]
								,[48]
								,[49]
								,[50]
								,[51]
								,[52]
								,[53]
								,[54]
								,[55]
								,[56]
								,[57]
								,[58]
								,[59]
								,[60]
								,[61]
								,[62]
								,[63]
								,[64]
								,[65]
								,[66]
								,[67]
								,[68]
								,[69]
								,[70]
								,[71]
								,[72]
								,[73]
								,[74]
								,[75]
								,[76]
								,[77]
								,[78]
								,[79]
								,[80]
								,[81]
								,[82]
								,[83]
								,[84]
								,[85]
								,[86]
								,[87]
								,[88]
								,[89]
								,[90]
								,[91]
								,[92]
								,[93]
								,[94]
								,[95]
								,[96]
								,[97]
								,[98]
								,[99]
								,[100])  
						)AS UNPVT)
						INSERT INTO [DWH_INTERMIDIATE].DBO.POPULATION_FEMALE
						SELECT 
							C.COUNTRY_ID
							,TRY_CAST(A.[YEAR] AS INT ) [YEAR]
							,TRY_CAST(A.max_age AS INT) AS MAX_AGE							
							,TRY_CAST(A.AGE_FLAG AS INT) AS AGE_FLAG
							,TRY_CAST(A.[POPULATION] AS DECIMAL(18,4)) AS POPULATION_FEMALE		
						
						FROM MALE_POPULATION_CTE  A			
						INNER JOIN DWH_INTERMIDIATE.DBO.COUNTRIES C 
							ON A.COUNTRY_CODE = C.FIPS

		END TRY  
			BEGIN CATCH  

			IF @@TRANCOUNT > 0  
				ROLLBACK TRANSACTION;  

				insert into ErrorLog
			    SELECT
					getdate()
			        ,ERROR_NUMBER() AS ErrorNumber  
			        ,ERROR_SEVERITY() AS ErrorSeverity  
			        ,ERROR_STATE() AS ErrorState  
			        ,'[etl].[ImportPopulationFemale]' AS ErrorProcedure  
			        ,ERROR_LINE() AS ErrorLine  
			        ,ERROR_MESSAGE() AS ErrorMessage;  
			  
			END CATCH;  
			  
			IF @@TRANCOUNT > 0  
			    COMMIT TRANSACTION;  

GO
/****** Object:  StoredProcedure [etl].[ImportPopulationFemaleOnPeriod]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		g.mitsis
-- Create date: 11/03/2023
-- Description:	Import Import Female Population
-- =============================================
CREATE PROCEDURE [etl].[ImportPopulationFemaleOnPeriod]
	
AS
	BEGIN TRANSACTION;  
  
		BEGIN TRY 
			
			TRUNCATE TABLE [DWH_INTERMIDIATE].DBO.POPULATION_FEMALE_ON_PERIOD

			drop table if exists #temp
			;WITH MALE_POPULATION_CTE AS (
			
			  SELECT COUNTRY_CODE 
					,[COUNTRY_NAME]
					,[YEAR]
					,[max_age]
					,AGE_FLAG
					,[POPULATION]
					
						FROM   
						   (SELECT 
								[country_code]
								,[country_name]
								,[year]
								,[sex]
								,[max_age]
								,[population_age_0]	  AS [0]
								,[population_age_1]	  AS [1]
								,[population_age_2]	  AS [2]
								,[population_age_3]	  AS [3]
								,[population_age_4]	  AS [4]
								,[population_age_5]	  AS [5]
								,[population_age_6]	  AS [6]
								,[population_age_7]	  AS [7]
								,[population_age_8]	  AS [8]
								,[population_age_9]	  AS [9]
								,[population_age_10]  AS [10]
								,[population_age_11]  AS [11]
								,[population_age_12]  AS [12]
								,[population_age_13]  AS [13]
								,[population_age_14]  AS [14]
								,[population_age_15]  AS [15]
								,[population_age_16]  AS [16]
								,[population_age_17]  AS [17]
								,[population_age_18]  AS [18]
								,[population_age_19]  AS [19]
								,[population_age_20]  AS [20]
								,[population_age_21]  AS [21]
								,[population_age_22]  AS [22]
								,[population_age_23]  AS [23]
								,[population_age_24]  AS [24]
								,[population_age_25]  AS [25]
								,[population_age_26]  AS [26]
								,[population_age_27]  AS [27]
								,[population_age_28]  AS [28]
								,[population_age_29]  AS [29]
								,[population_age_30]  AS [30]
								,[population_age_31]  AS [31]
								,[population_age_32]  AS [32]
								,[population_age_33]  AS [33]
								,[population_age_34]  AS [34]
								,[population_age_35]  AS [35]
								,[population_age_36]  AS [36]
								,[population_age_37]  AS [37]
								,[population_age_38]  AS [38]
								,[population_age_39]  AS [39]
								,[population_age_40]  AS [40]
								,[population_age_41]  AS [41]
								,[population_age_42]  AS [42]
								,[population_age_43]  AS [43]
								,[population_age_44]  AS [44]
								,[population_age_45]  AS [45]
								,[population_age_46]  AS [46]
								,[population_age_47]  AS [47]
								,[population_age_48]  AS [48]
								,[population_age_49]  AS [49]
								,[population_age_50]  AS [50]
								,[population_age_51]  AS [51]
								,[population_age_52]  AS [52]
								,[population_age_53]  AS [53]
								,[population_age_54]  AS [54]
								,[population_age_55]  AS [55]
								,[population_age_56]  AS [56]
								,[population_age_57]  AS [57]
								,[population_age_58]  AS [58]
								,[population_age_59]  AS [59]
								,[population_age_60]  AS [60]
								,[population_age_61]  AS [61]
								,[population_age_62]  AS [62]
								,[population_age_63]  AS [63]
								,[population_age_64]  AS [64]
								,[population_age_65]  AS [65]
								,[population_age_66]  AS [66]
								,[population_age_67]  AS [67]
								,[population_age_68]  AS [68]
								,[population_age_69]  AS [69]
								,[population_age_70]  AS [70]
								,[population_age_71]  AS [71]
								,[population_age_72]  AS [72]
								,[population_age_73]  AS [73]
								,[population_age_74]  AS [74]
								,[population_age_75]  AS [75]
								,[population_age_76]  AS [76]
								,[population_age_77]  AS [77]
								,[population_age_78]  AS [78]
								,[population_age_79]  AS [79]
								,[population_age_80]  AS [80]
								,[population_age_81]  AS [81]
								,[population_age_82]  AS [82]
								,[population_age_83]  AS [83]
								,[population_age_84]  AS [84]
								,[population_age_85]  AS [85]
								,[population_age_86]  AS [86]
								,[population_age_87]  AS [87]
								,[population_age_88]  AS [88]
								,[population_age_89]  AS [89]
								,[population_age_90]  AS [90]
								,[population_age_91]  AS [91]
								,[population_age_92]  AS [92]
								,[population_age_93]  AS [93]
								,[population_age_94]  AS [94]
								,[population_age_95]  AS [95]
								,[population_age_96]  AS [96]
								,[population_age_97]  AS [97]
								,[population_age_98]  AS [98]
								,[population_age_99]  AS [99]
								,[population_age_100] AS [100]
			  FROM [DWH_STAGING].[dbo].[midyear_population_age_sex] WHERE SEX = 'Female') P  
						UNPIVOT  
						   ( [POPULATION] FOR AGE_FLAG IN   
						      ([0]
								,[1]
								,[2]
								,[3]
								,[4]
								,[5]
								,[6]
								,[7]
								,[8]
								,[9]
								,[10]
								,[11]
								,[12]
								,[13]
								,[14]
								,[15]
								,[16]
								,[17]
								,[18]
								,[19]
								,[20]
								,[21]
								,[22]
								,[23]
								,[24]
								,[25]
								,[26]
								,[27]
								,[28]
								,[29]
								,[30]
								,[31]
								,[32]
								,[33]
								,[34]
								,[35]
								,[36]
								,[37]
								,[38]
								,[39]
								,[40]
								,[41]
								,[42]
								,[43]
								,[44]
								,[45]
								,[46]
								,[47]
								,[48]
								,[49]
								,[50]
								,[51]
								,[52]
								,[53]
								,[54]
								,[55]
								,[56]
								,[57]
								,[58]
								,[59]
								,[60]
								,[61]
								,[62]
								,[63]
								,[64]
								,[65]
								,[66]
								,[67]
								,[68]
								,[69]
								,[70]
								,[71]
								,[72]
								,[73]
								,[74]
								,[75]
								,[76]
								,[77]
								,[78]
								,[79]
								,[80]
								,[81]
								,[82]
								,[83]
								,[84]
								,[85]
								,[86]
								,[87]
								,[88]
								,[89]
								,[90]
								,[91]
								,[92]
								,[93]
								,[94]
								,[95]
								,[96]
								,[97]
								,[98]
								,[99]
								,[100])  
						)AS UNPVT)
						SELECT 
							C.COUNTRY_ID
							,TRY_CAST(A.[YEAR] AS INT ) [YEAR]
							,TRY_CAST(A.max_age AS INT) AS MAX_AGE							
							,TRY_CAST(A.AGE_FLAG AS INT) AS AGE_FLAG
							,TRY_CAST(A.[POPULATION] AS DECIMAL(18,4)) AS POPULATION_FEMALE		
						into #temp
						FROM MALE_POPULATION_CTE  A			
						INNER JOIN DWH_INTERMIDIATE.DBO.COUNTRIES C 
							ON A.COUNTRY_CODE = C.FIPS

						;with mapping as (
						select distinct TOTAL_FLAG,STARTING_AGE,AGE_GROUP_INDICATOR,ENDING_AGE from [dbo].[POPULATION_MIDYAER_ON_PERIOD] 	
							)
							,modulo_plus_one as (
							select *							
							from #temp a
							where (a.AGE_FLAg+1)%5 = 0
							--and a.[YEAR] = 2011
							--and COUNTRY_ID = 14
							)
							,modulo as (
							select *							
							from #temp a
							where a.AGE_FLAG%5 = 0
							--and a.[YEAR] = 2011
							--and COUNTRY_ID = 14
							),sum_of_all as (
							select 
								a.COUNTRY_ID
								,a.year
								,sum(a.POPULATION_FEMALE) as POPULATION_FEMALE
							from #temp a
							--where a.[YEAR] = 2011
							--and COUNTRY_ID = 14
							GROUP BY a.COUNTRY_ID
									,a.year
							),diff_max as (
							select 
								a.COUNTRY_ID
								,a.year
								,a.POPULATION_FEMALE
							from #temp a
							--where a.[YEAR] = 2011
							--and COUNTRY_ID = 14
							WHERE a.AGE_FLAG = 100
							),diff_min as (
							select 
								a.COUNTRY_ID
								,a.year
								,a.POPULATION_FEMALE
							from #temp a
							--where a.[YEAR] = 2011
							--and COUNTRY_ID = 14
							WHERE a.AGE_FLAG = 0
							)
							insert INTO DWH_INTERMIDIATE.dbo.POPULATION_FEMALE_ON_PERION
							select 
								B.COUNTRY_ID 
								,b.YEAR as PF_YEAR 
								,'A' AS PF_TOTAL_FLAG
								,B.AGE_FLAG AS PF_STARTING_AGE
								,'-' AS PF_AGE_GROUP_INDICATOR
								,C.AGE_FLAG AS PF_ENDING_AGE
								,(B.POPULATION_FEMALE+C.POPULATION_FEMALE)/2 AS PF_POPULATION_FEMALE							
							from mapping a
							inner join modulo b on a.STARTING_AGE = b.AGE_FLAG
							inner join modulo_plus_one c on a.ENDING_AGE = c.AGE_FLAG
							where b.COUNTRY_ID = c.COUNTRY_ID
							and b.YEAR = c.YEAR
							UNION ALL
							SELECT  
								A.COUNTRY_ID 
								,A.YEAR as PF_YEAR 
								,'*' AS PF_TOTAL_FLAG
								,0 AS PF_STARTING_AGE
								,'+' AS PF_AGE_GROUP_INDICATOR
								,0 AS PF_ENDING_AGE
								,A.POPULATION_FEMALE
							FROM sum_of_all A
							UNION ALL
							SELECT 
								A.COUNTRY_ID 
								,A.YEAR as PF_YEAR 
								,'A' AS PF_TOTAL_FLAG
								,100 AS PF_STARTING_AGE
								,CASE WHEN A.POPULATION_FEMALE - B.POPULATION_FEMALE <0 THEN '-' ELSE '+' END AS PF_AGE_GROUP_INDICATOR
								,0 AS PF_ENDING_AGE
								,ABS(A.POPULATION_FEMALE - B.POPULATION_FEMALE) AS POPULATION_FEMALE
							FROM diff_max A
							INNER JOIN diff_min B ON A.COUNTRY_ID = B.COUNTRY_ID 
							AND A.YEAR = B.YEAR 

		END TRY  
			BEGIN CATCH  

			IF @@TRANCOUNT > 0  
				ROLLBACK TRANSACTION;  

				insert into ErrorLog
			    SELECT
					getdate()
			        ,ERROR_NUMBER() AS ErrorNumber  
			        ,ERROR_SEVERITY() AS ErrorSeverity  
			        ,ERROR_STATE() AS ErrorState  
			        ,'[etl].[ImportPopulationFemaleOnPeriod]' AS ErrorProcedure  
			        ,ERROR_LINE() AS ErrorLine  
			        ,ERROR_MESSAGE() AS ErrorMessage;  
			  
			END CATCH;  
			  
			IF @@TRANCOUNT > 0  
			    COMMIT TRANSACTION;  

GO
/****** Object:  StoredProcedure [etl].[ImportPopulationMale]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		g.mitsis
-- Create date: 11/03/2023
-- Description:	Import Import Male Population
-- =============================================
CREATE PROCEDURE [etl].[ImportPopulationMale]
	
AS
	BEGIN TRANSACTION;  
  
		BEGIN TRY 
			
			TRUNCATE TABLE [DWH_INTERMIDIATE].DBO.POPULATION_MALE

			;WITH MALE_POPULATION_CTE AS (
			
			  SELECT COUNTRY_CODE 
					,[COUNTRY_NAME]
					,[YEAR]
					,[max_age]
					,AGE_FLAG
					,[POPULATION]
					
						FROM   
						   (SELECT 
								[country_code]
								,[country_name]
								,[year]
								,[sex]
								,[max_age]
								,[population_age_0]	  AS [0]
								,[population_age_1]	  AS [1]
								,[population_age_2]	  AS [2]
								,[population_age_3]	  AS [3]
								,[population_age_4]	  AS [4]
								,[population_age_5]	  AS [5]
								,[population_age_6]	  AS [6]
								,[population_age_7]	  AS [7]
								,[population_age_8]	  AS [8]
								,[population_age_9]	  AS [9]
								,[population_age_10]  AS [10]
								,[population_age_11]  AS [11]
								,[population_age_12]  AS [12]
								,[population_age_13]  AS [13]
								,[population_age_14]  AS [14]
								,[population_age_15]  AS [15]
								,[population_age_16]  AS [16]
								,[population_age_17]  AS [17]
								,[population_age_18]  AS [18]
								,[population_age_19]  AS [19]
								,[population_age_20]  AS [20]
								,[population_age_21]  AS [21]
								,[population_age_22]  AS [22]
								,[population_age_23]  AS [23]
								,[population_age_24]  AS [24]
								,[population_age_25]  AS [25]
								,[population_age_26]  AS [26]
								,[population_age_27]  AS [27]
								,[population_age_28]  AS [28]
								,[population_age_29]  AS [29]
								,[population_age_30]  AS [30]
								,[population_age_31]  AS [31]
								,[population_age_32]  AS [32]
								,[population_age_33]  AS [33]
								,[population_age_34]  AS [34]
								,[population_age_35]  AS [35]
								,[population_age_36]  AS [36]
								,[population_age_37]  AS [37]
								,[population_age_38]  AS [38]
								,[population_age_39]  AS [39]
								,[population_age_40]  AS [40]
								,[population_age_41]  AS [41]
								,[population_age_42]  AS [42]
								,[population_age_43]  AS [43]
								,[population_age_44]  AS [44]
								,[population_age_45]  AS [45]
								,[population_age_46]  AS [46]
								,[population_age_47]  AS [47]
								,[population_age_48]  AS [48]
								,[population_age_49]  AS [49]
								,[population_age_50]  AS [50]
								,[population_age_51]  AS [51]
								,[population_age_52]  AS [52]
								,[population_age_53]  AS [53]
								,[population_age_54]  AS [54]
								,[population_age_55]  AS [55]
								,[population_age_56]  AS [56]
								,[population_age_57]  AS [57]
								,[population_age_58]  AS [58]
								,[population_age_59]  AS [59]
								,[population_age_60]  AS [60]
								,[population_age_61]  AS [61]
								,[population_age_62]  AS [62]
								,[population_age_63]  AS [63]
								,[population_age_64]  AS [64]
								,[population_age_65]  AS [65]
								,[population_age_66]  AS [66]
								,[population_age_67]  AS [67]
								,[population_age_68]  AS [68]
								,[population_age_69]  AS [69]
								,[population_age_70]  AS [70]
								,[population_age_71]  AS [71]
								,[population_age_72]  AS [72]
								,[population_age_73]  AS [73]
								,[population_age_74]  AS [74]
								,[population_age_75]  AS [75]
								,[population_age_76]  AS [76]
								,[population_age_77]  AS [77]
								,[population_age_78]  AS [78]
								,[population_age_79]  AS [79]
								,[population_age_80]  AS [80]
								,[population_age_81]  AS [81]
								,[population_age_82]  AS [82]
								,[population_age_83]  AS [83]
								,[population_age_84]  AS [84]
								,[population_age_85]  AS [85]
								,[population_age_86]  AS [86]
								,[population_age_87]  AS [87]
								,[population_age_88]  AS [88]
								,[population_age_89]  AS [89]
								,[population_age_90]  AS [90]
								,[population_age_91]  AS [91]
								,[population_age_92]  AS [92]
								,[population_age_93]  AS [93]
								,[population_age_94]  AS [94]
								,[population_age_95]  AS [95]
								,[population_age_96]  AS [96]
								,[population_age_97]  AS [97]
								,[population_age_98]  AS [98]
								,[population_age_99]  AS [99]
								,[population_age_100] AS [100]
			  FROM [DWH_STAGING].[dbo].[midyear_population_age_sex] WHERE SEX = 'MALE') P  
						UNPIVOT  
						   ( [POPULATION] FOR AGE_FLAG IN   
						      ([0]
								,[1]
								,[2]
								,[3]
								,[4]
								,[5]
								,[6]
								,[7]
								,[8]
								,[9]
								,[10]
								,[11]
								,[12]
								,[13]
								,[14]
								,[15]
								,[16]
								,[17]
								,[18]
								,[19]
								,[20]
								,[21]
								,[22]
								,[23]
								,[24]
								,[25]
								,[26]
								,[27]
								,[28]
								,[29]
								,[30]
								,[31]
								,[32]
								,[33]
								,[34]
								,[35]
								,[36]
								,[37]
								,[38]
								,[39]
								,[40]
								,[41]
								,[42]
								,[43]
								,[44]
								,[45]
								,[46]
								,[47]
								,[48]
								,[49]
								,[50]
								,[51]
								,[52]
								,[53]
								,[54]
								,[55]
								,[56]
								,[57]
								,[58]
								,[59]
								,[60]
								,[61]
								,[62]
								,[63]
								,[64]
								,[65]
								,[66]
								,[67]
								,[68]
								,[69]
								,[70]
								,[71]
								,[72]
								,[73]
								,[74]
								,[75]
								,[76]
								,[77]
								,[78]
								,[79]
								,[80]
								,[81]
								,[82]
								,[83]
								,[84]
								,[85]
								,[86]
								,[87]
								,[88]
								,[89]
								,[90]
								,[91]
								,[92]
								,[93]
								,[94]
								,[95]
								,[96]
								,[97]
								,[98]
								,[99]
								,[100])  
						)AS UNPVT)
						INSERT INTO [DWH_INTERMIDIATE].DBO.POPULATION_MALE
						SELECT 
							C.COUNTRY_ID
							,TRY_CAST(A.[YEAR] AS INT ) [YEAR]
							,TRY_CAST(A.max_age AS INT) AS MAX_AGE							
							,TRY_CAST(A.AGE_FLAG AS INT) AS AGE_FLAG
							,TRY_CAST(A.[POPULATION] AS DECIMAL(18,4)) AS [POPULATION_MALE]									
						FROM MALE_POPULATION_CTE  A			
						INNER JOIN DWH_INTERMIDIATE.DBO.COUNTRIES C 
							ON A.COUNTRY_CODE = C.FIPS

		END TRY  
			BEGIN CATCH  

			IF @@TRANCOUNT > 0  
				ROLLBACK TRANSACTION;  

				insert into ErrorLog
			    SELECT
					getdate()
			        ,ERROR_NUMBER() AS ErrorNumber  
			        ,ERROR_SEVERITY() AS ErrorSeverity  
			        ,ERROR_STATE() AS ErrorState  
			        ,'[etl].[ImportPopulationMale]' AS ErrorProcedure  
			        ,ERROR_LINE() AS ErrorLine  
			        ,ERROR_MESSAGE() AS ErrorMessage;  
			  
			END CATCH;  
			  
			IF @@TRANCOUNT > 0  
			    COMMIT TRANSACTION; 

GO
/****** Object:  StoredProcedure [etl].[ImportPopulationMaleOnPeriod]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		g.mitsis
-- Create date: 11/03/2023
-- Description:	Import Import Female Population
-- =============================================
CREATE PROCEDURE [etl].[ImportPopulationMaleOnPeriod]
	
AS
	BEGIN TRANSACTION;  
  
		BEGIN TRY 
			
			TRUNCATE TABLE [DWH_INTERMIDIATE].DBO.POPULATION_MALE_ON_PERIOD

			
			drop table if exists #temp
			;WITH MALE_POPULATION_CTE AS (
			
			  SELECT COUNTRY_CODE 
					,[COUNTRY_NAME]
					,[YEAR]
					,[max_age]
					,AGE_FLAG
					,[POPULATION]
					
						FROM   
						   (SELECT 
								[country_code]
								,[country_name]
								,[year]
								,[sex]
								,[max_age]
								,[population_age_0]	  AS [0]
								,[population_age_1]	  AS [1]
								,[population_age_2]	  AS [2]
								,[population_age_3]	  AS [3]
								,[population_age_4]	  AS [4]
								,[population_age_5]	  AS [5]
								,[population_age_6]	  AS [6]
								,[population_age_7]	  AS [7]
								,[population_age_8]	  AS [8]
								,[population_age_9]	  AS [9]
								,[population_age_10]  AS [10]
								,[population_age_11]  AS [11]
								,[population_age_12]  AS [12]
								,[population_age_13]  AS [13]
								,[population_age_14]  AS [14]
								,[population_age_15]  AS [15]
								,[population_age_16]  AS [16]
								,[population_age_17]  AS [17]
								,[population_age_18]  AS [18]
								,[population_age_19]  AS [19]
								,[population_age_20]  AS [20]
								,[population_age_21]  AS [21]
								,[population_age_22]  AS [22]
								,[population_age_23]  AS [23]
								,[population_age_24]  AS [24]
								,[population_age_25]  AS [25]
								,[population_age_26]  AS [26]
								,[population_age_27]  AS [27]
								,[population_age_28]  AS [28]
								,[population_age_29]  AS [29]
								,[population_age_30]  AS [30]
								,[population_age_31]  AS [31]
								,[population_age_32]  AS [32]
								,[population_age_33]  AS [33]
								,[population_age_34]  AS [34]
								,[population_age_35]  AS [35]
								,[population_age_36]  AS [36]
								,[population_age_37]  AS [37]
								,[population_age_38]  AS [38]
								,[population_age_39]  AS [39]
								,[population_age_40]  AS [40]
								,[population_age_41]  AS [41]
								,[population_age_42]  AS [42]
								,[population_age_43]  AS [43]
								,[population_age_44]  AS [44]
								,[population_age_45]  AS [45]
								,[population_age_46]  AS [46]
								,[population_age_47]  AS [47]
								,[population_age_48]  AS [48]
								,[population_age_49]  AS [49]
								,[population_age_50]  AS [50]
								,[population_age_51]  AS [51]
								,[population_age_52]  AS [52]
								,[population_age_53]  AS [53]
								,[population_age_54]  AS [54]
								,[population_age_55]  AS [55]
								,[population_age_56]  AS [56]
								,[population_age_57]  AS [57]
								,[population_age_58]  AS [58]
								,[population_age_59]  AS [59]
								,[population_age_60]  AS [60]
								,[population_age_61]  AS [61]
								,[population_age_62]  AS [62]
								,[population_age_63]  AS [63]
								,[population_age_64]  AS [64]
								,[population_age_65]  AS [65]
								,[population_age_66]  AS [66]
								,[population_age_67]  AS [67]
								,[population_age_68]  AS [68]
								,[population_age_69]  AS [69]
								,[population_age_70]  AS [70]
								,[population_age_71]  AS [71]
								,[population_age_72]  AS [72]
								,[population_age_73]  AS [73]
								,[population_age_74]  AS [74]
								,[population_age_75]  AS [75]
								,[population_age_76]  AS [76]
								,[population_age_77]  AS [77]
								,[population_age_78]  AS [78]
								,[population_age_79]  AS [79]
								,[population_age_80]  AS [80]
								,[population_age_81]  AS [81]
								,[population_age_82]  AS [82]
								,[population_age_83]  AS [83]
								,[population_age_84]  AS [84]
								,[population_age_85]  AS [85]
								,[population_age_86]  AS [86]
								,[population_age_87]  AS [87]
								,[population_age_88]  AS [88]
								,[population_age_89]  AS [89]
								,[population_age_90]  AS [90]
								,[population_age_91]  AS [91]
								,[population_age_92]  AS [92]
								,[population_age_93]  AS [93]
								,[population_age_94]  AS [94]
								,[population_age_95]  AS [95]
								,[population_age_96]  AS [96]
								,[population_age_97]  AS [97]
								,[population_age_98]  AS [98]
								,[population_age_99]  AS [99]
								,[population_age_100] AS [100]
			  FROM [DWH_STAGING].[dbo].[midyear_population_age_sex] WHERE SEX = 'male') P  
						UNPIVOT  
						   ( [POPULATION] FOR AGE_FLAG IN   
						      ([0]
								,[1]
								,[2]
								,[3]
								,[4]
								,[5]
								,[6]
								,[7]
								,[8]
								,[9]
								,[10]
								,[11]
								,[12]
								,[13]
								,[14]
								,[15]
								,[16]
								,[17]
								,[18]
								,[19]
								,[20]
								,[21]
								,[22]
								,[23]
								,[24]
								,[25]
								,[26]
								,[27]
								,[28]
								,[29]
								,[30]
								,[31]
								,[32]
								,[33]
								,[34]
								,[35]
								,[36]
								,[37]
								,[38]
								,[39]
								,[40]
								,[41]
								,[42]
								,[43]
								,[44]
								,[45]
								,[46]
								,[47]
								,[48]
								,[49]
								,[50]
								,[51]
								,[52]
								,[53]
								,[54]
								,[55]
								,[56]
								,[57]
								,[58]
								,[59]
								,[60]
								,[61]
								,[62]
								,[63]
								,[64]
								,[65]
								,[66]
								,[67]
								,[68]
								,[69]
								,[70]
								,[71]
								,[72]
								,[73]
								,[74]
								,[75]
								,[76]
								,[77]
								,[78]
								,[79]
								,[80]
								,[81]
								,[82]
								,[83]
								,[84]
								,[85]
								,[86]
								,[87]
								,[88]
								,[89]
								,[90]
								,[91]
								,[92]
								,[93]
								,[94]
								,[95]
								,[96]
								,[97]
								,[98]
								,[99]
								,[100])  
						)AS UNPVT)
						SELECT 
							C.COUNTRY_ID
							,TRY_CAST(A.[YEAR] AS INT ) [YEAR]
							,TRY_CAST(A.max_age AS INT) AS MAX_AGE							
							,TRY_CAST(A.AGE_FLAG AS INT) AS AGE_FLAG
							,TRY_CAST(A.[POPULATION] AS DECIMAL(18,4)) AS POPULATION_MALE		
						into #temp
						FROM MALE_POPULATION_CTE  A			
						INNER JOIN DWH_INTERMIDIATE.DBO.COUNTRIES C 
							ON A.COUNTRY_CODE = C.FIPS

						;with mapping as (
						select distinct TOTAL_FLAG,STARTING_AGE,AGE_GROUP_INDICATOR,ENDING_AGE from POPULATION_MIDYAER_ON_PERIOD 	
							)
							,modulo_plus_one as (
							select *							
							from #temp a
							where (a.AGE_FLAg+1)%5 = 0
							--and a.[YEAR] = 2011
							--and COUNTRY_ID = 14
							)
							,modulo as (
							select *							
							from #temp a
							where a.AGE_FLAG%5 = 0
							--and a.[YEAR] = 2011
							--and COUNTRY_ID = 14
							),sum_of_all as (
							select 
								a.COUNTRY_ID
								,a.year
								,sum(a.POPULATION_MALE) as POPULATION_FEMALE
							from #temp a
							--where a.[YEAR] = 2011
							--and COUNTRY_ID = 14
							GROUP BY a.COUNTRY_ID
									,a.year
							),diff_max as (
							select 
								a.COUNTRY_ID
								,a.year
								,a.POPULATION_MALE
							from #temp a
							--where a.[YEAR] = 2011
							--and COUNTRY_ID = 14
							WHERE a.AGE_FLAG = 100
							),diff_min as (
							select 
								a.COUNTRY_ID
								,a.year
								,a.POPULATION_MALE
							from #temp a
							--where a.[YEAR] = 2011
							--and COUNTRY_ID = 14
							WHERE a.AGE_FLAG = 0
							)
							insert INTO DWH_INTERMIDIATE.dbo.POPULATION_MALE_ON_PERION
							select 
								B.COUNTRY_ID 
								,b.YEAR as PF_YEAR 
								,'A' AS PF_TOTAL_FLAG
								,B.AGE_FLAG AS PF_STARTING_AGE
								,'-' AS PF_AGE_GROUP_INDICATOR
								,C.AGE_FLAG AS PF_ENDING_AGE
								,(B.POPULATION_MALE+C.POPULATION_MALE)/2 AS PF_POPULATION_FEMALE	
							from mapping a
							inner join modulo b on a.STARTING_AGE = b.AGE_FLAG
							inner join modulo_plus_one c on a.ENDING_AGE = c.AGE_FLAG
							where b.COUNTRY_ID = c.COUNTRY_ID
							and b.YEAR = c.YEAR
							UNION ALL
							SELECT  
								A.COUNTRY_ID 
								,A.YEAR as PF_YEAR 
								,'*' AS PF_TOTAL_FLAG
								,0 AS PF_STARTING_AGE
								,'+' AS PF_AGE_GROUP_INDICATOR
								,0 AS PF_ENDING_AGE
								,A.POPULATION_FEMALE
							FROM sum_of_all A
							UNION ALL
							SELECT 
								A.COUNTRY_ID 
								,A.YEAR as PF_YEAR 
								,'A' AS PM_TOTAL_FLAG
								,100 AS PM_STARTING_AGE
								,CASE WHEN A.POPULATION_MALE - B.POPULATION_MALE <0 THEN '-' ELSE '+' END AS PM_AGE_GROUP_INDICATOR
								,0 AS PM_ENDING_AGE
								,ABS(A.POPULATION_MALE - B.POPULATION_MALE) AS POPULATION_FEMALE
							FROM diff_max A
							INNER JOIN diff_min B ON A.COUNTRY_ID = B.COUNTRY_ID 
							AND A.YEAR = B.YEAR 
						
		
		

		END TRY  
			BEGIN CATCH  

			IF @@TRANCOUNT > 0  
				ROLLBACK TRANSACTION;  

				insert into ErrorLog
			    SELECT
					getdate()
			        ,ERROR_NUMBER() AS ErrorNumber  
			        ,ERROR_SEVERITY() AS ErrorSeverity  
			        ,ERROR_STATE() AS ErrorState  
			        ,'[etl].[ImportPopulationMaleOnPeriod]' AS ErrorProcedure  
			        ,ERROR_LINE() AS ErrorLine  
			        ,ERROR_MESSAGE() AS ErrorMessage;  
			  
			END CATCH;  
			  
			IF @@TRANCOUNT > 0  
			    COMMIT TRANSACTION;  

GO
/****** Object:  StoredProcedure [etl].[ImportPopulationMidyearOnPeriod]    Script Date: 27/5/2023 1:13:51 πμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		g.mitsis
-- Create date: 11/03/2023
-- Description:	Import Midyear Population On Period
-- =============================================
CREATE PROCEDURE [etl].[ImportPopulationMidyearOnPeriod]
	
AS
	BEGIN TRANSACTION;  
  
		BEGIN TRY 
			
			TRUNCATE TABLE [DWH_INTERMIDIATE].[dbo].[POPULATION_MIDYAER_ON_PERIOD]

			INSERT INTO [DWH_INTERMIDIATE].[dbo].[POPULATION_MIDYAER_ON_PERIOD]
						SELECT 
							C.COUNTRY_ID
							,TRY_CAST(A.[YEAR] AS INT ) [YEAR]
							,TRY_CAST(A.TOTAL_FLAG AS VARCHAR(1)) AS TOTAL_FLAG
							,TRY_CAST(A.STARTING_AGE AS INT) AS STARTING_AGE
							,TRY_CAST(A.AGE_GROUP_INDICATOR AS VARCHAR(1)) AS AGE_GROUP_INDICATOR
							,TRY_CAST(A.ENDING_AGE AS INT) AS ENDING_AGE 
							,TRY_CAST(A.MIDYEAR_POPULATION AS DECIMAL(18,4)) AS MIDYEAR_POPULATION 
						FROM DWH_STAGING.DBO.MIDYEAR_POPULATION_5YR_AGE_SEX  A			
						INNER JOIN DWH_INTERMIDIATE.DBO.COUNTRIES C 
							ON A.COUNTRY_CODE = C.FIPS

			TRUNCATE TABLE [DWH_INTERMIDIATE].[dbo].POPULATION_MIDYEAR_ON_PERIOD_MALE

			INSERT INTO [DWH_INTERMIDIATE].[dbo].POPULATION_MIDYEAR_ON_PERIOD_MALE
						SELECT 
							C.COUNTRY_ID
							,TRY_CAST(A.[YEAR] AS INT ) [YEAR]
							,TRY_CAST(A.TOTAL_FLAG AS VARCHAR(1)) AS TOTAL_FLAG
							,TRY_CAST(A.STARTING_AGE AS INT) AS STARTING_AGE
							,TRY_CAST(A.AGE_GROUP_INDICATOR AS VARCHAR(1)) AS AGE_GROUP_INDICATOR
							,TRY_CAST(A.ENDING_AGE AS INT) AS ENDING_AGE 
							,TRY_CAST(A.midyear_population_male	AS DECIMAL(18,4)) AS midyear_population_male					
						FROM DWH_STAGING.DBO.MIDYEAR_POPULATION_5YR_AGE_SEX  A			
						INNER JOIN DWH_INTERMIDIATE.DBO.COUNTRIES C 
							ON A.COUNTRY_CODE = C.FIPS

			TRUNCATE TABLE [DWH_INTERMIDIATE].[dbo].[POPULATION_MIDYEAR_ON_PERIOD_FEMALE]

			INSERT INTO [DWH_INTERMIDIATE].[dbo].[POPULATION_MIDYEAR_ON_PERIOD_FEMALE]
						SELECT 
							C.COUNTRY_ID
							,TRY_CAST(A.[YEAR] AS INT ) [YEAR]
							,TRY_CAST(A.TOTAL_FLAG AS VARCHAR(1)) AS TOTAL_FLAG
							,TRY_CAST(A.STARTING_AGE AS INT) AS STARTING_AGE
							,TRY_CAST(A.AGE_GROUP_INDICATOR AS VARCHAR(1)) AS AGE_GROUP_INDICATOR
							,TRY_CAST(A.ENDING_AGE AS INT) AS ENDING_AGE 
							,TRY_CAST(A.MIDYEAR_POPULATION_FEMALE		AS DECIMAL(18,4)) AS MIDYEAR_POPULATION_FEMALE							
						FROM DWH_STAGING.DBO.MIDYEAR_POPULATION_5YR_AGE_SEX  A			
						INNER JOIN DWH_INTERMIDIATE.DBO.COUNTRIES C 
							ON A.COUNTRY_CODE = C.FIPS

		END TRY  
			BEGIN CATCH  

			IF @@TRANCOUNT > 0  
				ROLLBACK TRANSACTION;  

				insert into ErrorLog
			    SELECT
					getdate()
			        ,ERROR_NUMBER() AS ErrorNumber  
			        ,ERROR_SEVERITY() AS ErrorSeverity  
			        ,ERROR_STATE() AS ErrorState  
			        ,'[etl].[ImportPopulationMidyearOnPeriod]' AS ErrorProcedure  
			        ,ERROR_LINE() AS ErrorLine  
			        ,ERROR_MESSAGE() AS ErrorMessage;  
			  
			END CATCH;  
			  
			IF @@TRANCOUNT > 0  
			    COMMIT TRANSACTION; 

GO
