namespace WebAppDBHandler.DatabaseContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class POPULATION_MIDYEAR_ON_PERIOD_MALE
    {
        [Key]
        public int PMOPM_ID { get; set; }

        public int PMOPM_COUNTRY_ID { get; set; }

        public int PMOPM_YEAR { get; set; }

        [StringLength(1)]
        public string PMOPM_TOTAL_FLAG { get; set; }

        public int? PMOPM_STARTING_AGE { get; set; }

        [StringLength(1)]
        public string PMOPM_AGE_GROUP_INDICATOR { get; set; }

        public int? PMOPM_ENDING_AGE { get; set; }

        public decimal? PMOPM_MIDYEAR_POPULATION_MALE { get; set; }

        public virtual COUNTRy COUNTRy { get; set; }
    }
}
