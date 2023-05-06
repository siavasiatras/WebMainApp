namespace WebAppDBHandler.DatabaseContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class POPULATION_MIDYEAR_ON_PERIOD_FEMALE
    {
        [Key]
        public int PMOPF_ID { get; set; }

        public int PMOPF_COUNTRY_ID { get; set; }

        public int PMOPF_YEAR { get; set; }

        [StringLength(1)]
        public string PMOPF_TOTAL_FLAG { get; set; }

        public int? PMOPF_STARTING_AGE { get; set; }

        [StringLength(1)]
        public string PMOPF_AGE_GROUP_INDICATOR { get; set; }

        public int? PMOPF_ENDING_AGE { get; set; }

        public decimal? PMOPF_MIDYEAR_POPULATION_FEMALE { get; set; }

        public virtual COUNTRy COUNTRy { get; set; }
    }
}
