namespace WebAppDBHandler.DatabaseContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class INDEXES_BY_COUNTRY
    {
        [Key]
        public int IBC_ID { get; set; }

        public int IBC_COUNTRY_ID { get; set; }

        public int IBC_YEAR { get; set; }

        public decimal? IBC_GDP_PER_CAPITA { get; set; }

        public decimal? IBC_DOMESTIC_CREDITS { get; set; }

        public decimal? IBC_INCOME_INDEX { get; set; }

        public decimal? IBC_ESTIMATED_GNI_FEMALE { get; set; }

        public decimal? IBC_ESTIMATED_GNI_MALE { get; set; }

        public decimal? IBC_GDP_TOTAL { get; set; }

        public decimal? IBC_GNI_PERCAPITA { get; set; }

        public decimal? IBC_GROSS_FIXED_CAPITAL_FORMATION { get; set; }

        public decimal? IBC_LABOUR_SHARE_OF_GDP { get; set; }

        public virtual COUNTRy COUNTRy { get; set; }
    }
}
