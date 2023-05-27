use DWH_STAGING
--data paths files table names
select * from  [dbo].[DataFiles]

--delete data
truncate table age_specific_fertility_rates
truncate table birth_death_growth_rates
truncate table country_names_area
truncate table midyear_population
truncate table midyear_population_5yr_age_sex
truncate table midyear_population_age_sex
truncate table mortality_life_expectancy
truncate table countries
truncate table IncomeIndex
truncate table DomesticCredits
truncate table LabourshareofGDP
truncate table Grossfixedcapitalformation
truncate table GDPtotal
truncate table GDPpercapita
truncate table GNIpercapita
truncate table EstimatedGNImale
truncate table EstimatedGNIfemale

--import data
exec InsertDataMain

--dwh staging
select * from age_specific_fertility_rates
select * from birth_death_growth_rates
select * from country_names_area
select * from midyear_population
select * from midyear_population_5yr_age_sex
select * from midyear_population_age_sex
select * from mortality_life_expectancy
select * from countries
select * from IncomeIndex
select * from DomesticCredits
select * from LabourshareofGDP
select * from Grossfixedcapitalformation
select * from GDPtotal
select * from GDPpercapita
select * from GNIpercapita
select * from EstimatedGNImale
select * from EstimatedGNIfemale

use DWH_INTERMIDIATE

--delete data
truncate table POPULATION_MIDYEAR_ON_PERIOD_MALE
truncate table POPULATION_MIDYEAR_ON_PERIOD_FEMALE
truncate table POPULATION_MIDYAER_ON_PERIOD
truncate table MORTALITY_LIFE_EXPECTANCY_MALE
truncate table MORTALITY_LIFE_EXPECTANCY_FEMALE
truncate table POPULATION_DEMOGRAPHIC_RATES_GENERAL
truncate table INDEXES_BY_COUNTRY
truncate table INDEXES_BY_REGION
truncate table COUNTRIES
truncate table POPULATION_FEMALE_ON_PERIOD
truncate table POPULATION_MALE_ON_PERIOD
truncate table FERTILITY_RATES_ON_PERIOD
truncate table POPULATION_MALE
truncate table POPULATION_FEMALE
--or
exec [dbo].[DeleteData]

--import data
exec etl.importAMain 0--with tables bit 0 no 1 yes if i had no tables

--check table data
select * from POPULATION_MIDYEAR_ON_PERIOD_MALE
select * from POPULATION_MIDYEAR_ON_PERIOD_FEMALE
select * from POPULATION_MIDYAER_ON_PERIOD
select * from MORTALITY_LIFE_EXPECTANCY_MALE
select * from MORTALITY_LIFE_EXPECTANCY_FEMALE
select * from POPULATION_DEMOGRAPHIC_RATES_GENERAL
select * from INDEXES_BY_COUNTRY
select * from INDEXES_BY_REGION
select * from COUNTRIES
select * from POPULATION_FEMALE_ON_PERIOD
select * from POPULATION_MALE_ON_PERIOD
select * from Coutry_Region_Official_Mapping
select * from FERTILITY_RATES_ON_PERIOD

--mapping
select * from [dbo].[Coutry_Region_Official_Mapping]
-- from procedure
--exec CreateMappingCoutryRegionOfficial

use DWH

--delete data
exec DeleteData
--import data
exec etl.importAMain 0--with tables bit 0 no 1 yes if i had no tables

--error logs
select * from DWH.dbo.ErrorLog
--table data
select * from DWH.dbo.COUNTRIES
select * from DWH.dbo.FERTILITY_RATES_ON_PERIOD
select * from DWH.dbo.INDEXES_BY_COUNTRY
select * from DWH.dbo.INDEXES_BY_REGION
select * from DWH.dbo.MORTALITY_LIFE_EXPECTANCY_FEMALE
select * from DWH.dbo.POPULATION_FEMALE_ON_PERIOD
select * from DWH.dbo.MORTALITY_LIFE_EXPECTANCY_MALE
select * from DWH.dbo.POPULATION_MALE_ON_PERIOD
select * from DWH.dbo.POPULATION_FEMALE
select * from DWH.dbo.POPULATION_MALE
select * from DWH.dbo.POPULATION_MIDYAER_ON_PERIOD
select * from DWH.dbo.POPULATION_MIDYEAR_ON_PERIOD_FEMALE
select * from DWH.dbo.POPULATION_MIDYEAR_ON_PERIOD_MALE
select * from DWH.dbo.POPULATION_DEMOGRAPHIC_RATES_GENERAL
--views
select * from DWH.dbo.TABLES_WITH_FLAG
select * from DWH.dbo.CountriesList
select * from DWH.dbo.ELEMENTS_TO_CHART


