namespace WebAppDBHandler.DatabaseContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class INDEXES_BY_REGION
    {
        [Key]
        public int IBR_ID { get; set; }

        [StringLength(256)]
        public string IBR_REGION { get; set; }

        public int IBR_YEAR { get; set; }

        public decimal? IBR_GDP_PER_CAPITA { get; set; }

        public decimal? IBR_DOMESTIC_CREDITS { get; set; }

        public decimal? IBR_INCOME_INDEX { get; set; }

        public decimal? IBR_ESTIMATED_GNI_FEMALE { get; set; }

        public decimal? IBR_ESTIMATED_GNI_MALE { get; set; }

        public decimal? IBR_GDP_TOTAL { get; set; }

        public decimal? IBR_GNI_PERCAPITA { get; set; }

        public decimal? IBR_GROSS_FIXED_CAPITAL_FORMATION { get; set; }

        public decimal? IBR_LABOUR_SHARE_OF_GDP { get; set; }
    }
}
