namespace WebAppDBHandler.DatabaseContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class FERTILITY_RATES_ON_PERIOD
    {
        [Key]
        public int FROP_ID { get; set; }

        public int FROP_COUNTRY_ID { get; set; }

        public int FROP_YEAR { get; set; }

        [StringLength(1)]
        public string FROP_TOTAL_FLAG { get; set; }

        public int? FROP_STARTING_AGE { get; set; }

        [StringLength(1)]
        public string FROP_AGE_GROUP_INDICATOR { get; set; }

        public int? FROP_ENDING_AGE { get; set; }

        public decimal? FROP_FERTILITY_RATE { get; set; }

        public virtual COUNTRy COUNTRy { get; set; }
    }
}
