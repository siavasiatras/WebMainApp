using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;

namespace WebAppDBHandler.DatabaseContext
{
    public partial class DWHContext : DbContext
    {
        public DWHContext()
            : base("name=DWHContext")
        {
        }

        public virtual DbSet<COUNTRy> COUNTRIES { get; set; }
        public virtual DbSet<FERTILITY_RATES_ON_PERIOD> FERTILITY_RATES_ON_PERIOD { get; set; }
        public virtual DbSet<INDEXES_BY_COUNTRY> INDEXES_BY_COUNTRY { get; set; }
        public virtual DbSet<INDEXES_BY_REGION> INDEXES_BY_REGION { get; set; }
        public virtual DbSet<MORTALITY_LIFE_EXPECTANCY> MORTALITY_LIFE_EXPECTANCY { get; set; }
        public virtual DbSet<MORTALITY_LIFE_EXPECTANCY_FEMALE> MORTALITY_LIFE_EXPECTANCY_FEMALE { get; set; }
        public virtual DbSet<MORTALITY_LIFE_EXPECTANCY_MALE> MORTALITY_LIFE_EXPECTANCY_MALE { get; set; }
        public virtual DbSet<POPULATION_DEMOGRAPHIC_RATES_GENERAL> POPULATION_DEMOGRAPHIC_RATES_GENERAL { get; set; }
        public virtual DbSet<POPULATION_FEMALE> POPULATION_FEMALE { get; set; }
        public virtual DbSet<POPULATION_MALE> POPULATION_MALE { get; set; }
        public virtual DbSet<POPULATION_MIDYAER_ON_PERIOD> POPULATION_MIDYAER_ON_PERIOD { get; set; }
        public virtual DbSet<POPULATION_MIDYEAR_ON_PERIOD_FEMALE> POPULATION_MIDYEAR_ON_PERIOD_FEMALE { get; set; }
        public virtual DbSet<POPULATION_MIDYEAR_ON_PERIOD_MALE> POPULATION_MIDYEAR_ON_PERIOD_MALE { get; set; }
        public IEnumerable<object> DataPoints { get; internal set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_ISO)
                .IsUnicode(false);

            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_ISO3)
                .IsUnicode(false);

            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_FIPS)
                .IsUnicode(false);

            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_DISPLAY_NAME)
                .IsUnicode(false);

            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_OFFICIAL_NAME)
                .IsUnicode(false);

            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_CAPITAL)
                .IsUnicode(false);

            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_CONTINENT)
                .IsUnicode(false);

            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_CURRENCYCODE)
                .IsUnicode(false);

            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_CURRENCYNAME)
                .IsUnicode(false);

            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_PHONE)
                .IsUnicode(false);

            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_REGION_NAME)
                .IsUnicode(false);

            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_SUB_REGION_NAME)
                .IsUnicode(false);

            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_INTERMEDIATE_REGION_NAME)
                .IsUnicode(false);

            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_STATUS)
                .IsUnicode(false);

            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_DEVELOPED_OR_DEVELOPING)
                .IsUnicode(false);

            modelBuilder.Entity<COUNTRy>()
                .Property(e => e.C_AREA_SQKM)
                .HasPrecision(18, 4);

            modelBuilder.Entity<COUNTRy>()
                .HasMany(e => e.FERTILITY_RATES_ON_PERIOD)
                .WithRequired(e => e.COUNTRy)
                .HasForeignKey(e => e.FROP_COUNTRY_ID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<COUNTRy>()
                .HasMany(e => e.INDEXES_BY_COUNTRY)
                .WithRequired(e => e.COUNTRy)
                .HasForeignKey(e => e.IBC_COUNTRY_ID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<COUNTRy>()
                .HasMany(e => e.MORTALITY_LIFE_EXPECTANCY)
                .WithRequired(e => e.COUNTRy)
                .HasForeignKey(e => e.MLE_COUNTRY_ID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<COUNTRy>()
                .HasMany(e => e.MORTALITY_LIFE_EXPECTANCY_FEMALE)
                .WithRequired(e => e.COUNTRy)
                .HasForeignKey(e => e.MLEF_COUNTRY_ID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<COUNTRy>()
                .HasMany(e => e.MORTALITY_LIFE_EXPECTANCY_MALE)
                .WithRequired(e => e.COUNTRy)
                .HasForeignKey(e => e.MLEM_COUNTRY_ID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<COUNTRy>()
                .HasMany(e => e.POPULATION_DEMOGRAPHIC_RATES_GENERAL)
                .WithRequired(e => e.COUNTRy)
                .HasForeignKey(e => e.PDRG_COUNTRY_ID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<COUNTRy>()
                .HasMany(e => e.POPULATION_FEMALE)
                .WithRequired(e => e.COUNTRy)
                .HasForeignKey(e => e.PF_COUNTRY_ID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<COUNTRy>()
                .HasMany(e => e.POPULATION_MALE)
                .WithRequired(e => e.COUNTRy)
                .HasForeignKey(e => e.PM_COUNTRY_ID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<COUNTRy>()
                .HasMany(e => e.POPULATION_MIDYAER_ON_PERIOD)
                .WithRequired(e => e.COUNTRy)
                .HasForeignKey(e => e.PMOP_COUNTRY_ID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<COUNTRy>()
                .HasMany(e => e.POPULATION_MIDYEAR_ON_PERIOD_FEMALE)
                .WithRequired(e => e.COUNTRy)
                .HasForeignKey(e => e.PMOPF_COUNTRY_ID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<COUNTRy>()
                .HasMany(e => e.POPULATION_MIDYEAR_ON_PERIOD_MALE)
                .WithRequired(e => e.COUNTRy)
                .HasForeignKey(e => e.PMOPM_COUNTRY_ID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<FERTILITY_RATES_ON_PERIOD>()
                .Property(e => e.FROP_TOTAL_FLAG)
                .IsUnicode(false);

            modelBuilder.Entity<FERTILITY_RATES_ON_PERIOD>()
                .Property(e => e.FROP_AGE_GROUP_INDICATOR)
                .IsUnicode(false);

            modelBuilder.Entity<FERTILITY_RATES_ON_PERIOD>()
                .Property(e => e.FROP_FERTILITY_RATE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_COUNTRY>()
                .Property(e => e.IBC_GDP_PER_CAPITA)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_COUNTRY>()
                .Property(e => e.IBC_DOMESTIC_CREDITS)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_COUNTRY>()
                .Property(e => e.IBC_INCOME_INDEX)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_COUNTRY>()
                .Property(e => e.IBC_ESTIMATED_GNI_FEMALE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_COUNTRY>()
                .Property(e => e.IBC_ESTIMATED_GNI_MALE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_COUNTRY>()
                .Property(e => e.IBC_GDP_TOTAL)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_COUNTRY>()
                .Property(e => e.IBC_GNI_PERCAPITA)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_COUNTRY>()
                .Property(e => e.IBC_GROSS_FIXED_CAPITAL_FORMATION)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_COUNTRY>()
                .Property(e => e.IBC_LABOUR_SHARE_OF_GDP)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_REGION>()
                .Property(e => e.IBR_REGION)
                .IsUnicode(false);

            modelBuilder.Entity<INDEXES_BY_REGION>()
                .Property(e => e.IBR_GDP_PER_CAPITA)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_REGION>()
                .Property(e => e.IBR_DOMESTIC_CREDITS)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_REGION>()
                .Property(e => e.IBR_INCOME_INDEX)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_REGION>()
                .Property(e => e.IBR_ESTIMATED_GNI_FEMALE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_REGION>()
                .Property(e => e.IBR_ESTIMATED_GNI_MALE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_REGION>()
                .Property(e => e.IBR_GDP_TOTAL)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_REGION>()
                .Property(e => e.IBR_GNI_PERCAPITA)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_REGION>()
                .Property(e => e.IBR_GROSS_FIXED_CAPITAL_FORMATION)
                .HasPrecision(18, 4);

            modelBuilder.Entity<INDEXES_BY_REGION>()
                .Property(e => e.IBR_LABOUR_SHARE_OF_GDP)
                .HasPrecision(18, 4);

            modelBuilder.Entity<MORTALITY_LIFE_EXPECTANCY>()
                .Property(e => e.MLE_INFANT_MORTALITY)
                .HasPrecision(18, 4);

            modelBuilder.Entity<MORTALITY_LIFE_EXPECTANCY>()
                .Property(e => e.MLE_LIFE_EXPECTANCY)
                .HasPrecision(18, 4);

            modelBuilder.Entity<MORTALITY_LIFE_EXPECTANCY>()
                .Property(e => e.MLE_MORTALITY_RATE_1TO4)
                .HasPrecision(18, 4);

            modelBuilder.Entity<MORTALITY_LIFE_EXPECTANCY>()
                .Property(e => e.MLE_MORTALITY_RATE_UNDER5)
                .HasPrecision(18, 4);

            modelBuilder.Entity<MORTALITY_LIFE_EXPECTANCY_FEMALE>()
                .Property(e => e.MLEF_INFANT_MORTALITY_FEMALE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<MORTALITY_LIFE_EXPECTANCY_FEMALE>()
                .Property(e => e.MLEF_LIFE_EXPECTANCY_FEMALE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<MORTALITY_LIFE_EXPECTANCY_FEMALE>()
                .Property(e => e.MLEF_MORTALITY_RATE_1TO4_FEMALE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<MORTALITY_LIFE_EXPECTANCY_FEMALE>()
                .Property(e => e.MLEF_MORTALITY_RATE_UNDER5_FEMALE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<MORTALITY_LIFE_EXPECTANCY_MALE>()
                .Property(e => e.MLEM_INFANT_MORTALITY_MALE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<MORTALITY_LIFE_EXPECTANCY_MALE>()
                .Property(e => e.MLEM_LIFE_EXPECTANCY_MALE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<MORTALITY_LIFE_EXPECTANCY_MALE>()
                .Property(e => e.MLEM_MORTALITY_RATE_1TO4_MALE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<MORTALITY_LIFE_EXPECTANCY_MALE>()
                .Property(e => e.MLEM_MORTALITY_RATE_UNDER5_MALE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_DEMOGRAPHIC_RATES_GENERAL>()
                .Property(e => e.PDRG_INFANT_MORTALITY)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_DEMOGRAPHIC_RATES_GENERAL>()
                .Property(e => e.PDRG_LIFE_EXPECTANCY)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_DEMOGRAPHIC_RATES_GENERAL>()
                .Property(e => e.PDRG_MORTALITY_RATE_1TO4)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_DEMOGRAPHIC_RATES_GENERAL>()
                .Property(e => e.PDRG_MORTALITY_RATE_UNDER5)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_DEMOGRAPHIC_RATES_GENERAL>()
                .Property(e => e.PDRG_GROSS_REPRODUCTION_RATE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_DEMOGRAPHIC_RATES_GENERAL>()
                .Property(e => e.PDRG_SEX_RATIO_AT_BIRTH)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_DEMOGRAPHIC_RATES_GENERAL>()
                .Property(e => e.PDRG_CRUDE_BIRTH_RATE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_DEMOGRAPHIC_RATES_GENERAL>()
                .Property(e => e.PDRG_CRUDE_DEATH_RATE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_DEMOGRAPHIC_RATES_GENERAL>()
                .Property(e => e.PDRG_GROWTH_RATE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_DEMOGRAPHIC_RATES_GENERAL>()
                .Property(e => e.PDRG_NET_MIGRATION)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_DEMOGRAPHIC_RATES_GENERAL>()
                .Property(e => e.PDRG_RATE_NATURAL_INCREASE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_FEMALE>()
                .Property(e => e.PF_POPULATION_FEMALE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_MALE>()
                .Property(e => e.PM_POPULATION_MALE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_MIDYAER_ON_PERIOD>()
                .Property(e => e.PMOP_TOTAL_FLAG)
                .IsUnicode(false);

            modelBuilder.Entity<POPULATION_MIDYAER_ON_PERIOD>()
                .Property(e => e.PMOP_AGE_GROUP_INDICATOR)
                .IsUnicode(false);

            modelBuilder.Entity<POPULATION_MIDYAER_ON_PERIOD>()
                .Property(e => e.PMOP_MIDYEAR_POPULATION)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_MIDYEAR_ON_PERIOD_FEMALE>()
                .Property(e => e.PMOPF_TOTAL_FLAG)
                .IsUnicode(false);

            modelBuilder.Entity<POPULATION_MIDYEAR_ON_PERIOD_FEMALE>()
                .Property(e => e.PMOPF_AGE_GROUP_INDICATOR)
                .IsUnicode(false);

            modelBuilder.Entity<POPULATION_MIDYEAR_ON_PERIOD_FEMALE>()
                .Property(e => e.PMOPF_MIDYEAR_POPULATION_FEMALE)
                .HasPrecision(18, 4);

            modelBuilder.Entity<POPULATION_MIDYEAR_ON_PERIOD_MALE>()
                .Property(e => e.PMOPM_TOTAL_FLAG)
                .IsUnicode(false);

            modelBuilder.Entity<POPULATION_MIDYEAR_ON_PERIOD_MALE>()
                .Property(e => e.PMOPM_AGE_GROUP_INDICATOR)
                .IsUnicode(false);

            modelBuilder.Entity<POPULATION_MIDYEAR_ON_PERIOD_MALE>()
                .Property(e => e.PMOPM_MIDYEAR_POPULATION_MALE)
                .HasPrecision(18, 4);
        }

        //internal SqlConnection Database()
        //{
        //    throw new NotImplementedException();
        //}
    }
}
