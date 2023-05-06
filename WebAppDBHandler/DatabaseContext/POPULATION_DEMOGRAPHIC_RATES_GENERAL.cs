namespace WebAppDBHandler.DatabaseContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class POPULATION_DEMOGRAPHIC_RATES_GENERAL
    {
        [Key]
        public int PDRG_ID { get; set; }

        public int PDRG_COUNTRY_ID { get; set; }

        public int PDRG_YEAR { get; set; }

        public decimal? PDRG_INFANT_MORTALITY { get; set; }

        public decimal? PDRG_LIFE_EXPECTANCY { get; set; }

        public decimal? PDRG_MORTALITY_RATE_1TO4 { get; set; }

        public decimal? PDRG_MORTALITY_RATE_UNDER5 { get; set; }

        public decimal? PDRG_GROSS_REPRODUCTION_RATE { get; set; }

        public decimal? PDRG_SEX_RATIO_AT_BIRTH { get; set; }

        public decimal? PDRG_CRUDE_BIRTH_RATE { get; set; }

        public decimal? PDRG_CRUDE_DEATH_RATE { get; set; }

        public decimal? PDRG_GROWTH_RATE { get; set; }

        public decimal? PDRG_NET_MIGRATION { get; set; }

        public decimal? PDRG_RATE_NATURAL_INCREASE { get; set; }

        public virtual COUNTRy COUNTRy { get; set; }
    }
}
