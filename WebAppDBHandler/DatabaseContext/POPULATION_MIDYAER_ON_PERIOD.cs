namespace WebAppDBHandler.DatabaseContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class POPULATION_MIDYAER_ON_PERIOD
    {
        [Key]
        public int PMOP_ID { get; set; }

        public int PMOP_COUNTRY_ID { get; set; }

        public int PMOP_YEAR { get; set; }

        [StringLength(1)]
        public string PMOP_TOTAL_FLAG { get; set; }

        public int? PMOP_STARTING_AGE { get; set; }

        [StringLength(1)]
        public string PMOP_AGE_GROUP_INDICATOR { get; set; }

        public int? PMOP_ENDING_AGE { get; set; }

        public decimal? PMOP_MIDYEAR_POPULATION { get; set; }

        public virtual COUNTRy COUNTRy { get; set; }
    }
}
