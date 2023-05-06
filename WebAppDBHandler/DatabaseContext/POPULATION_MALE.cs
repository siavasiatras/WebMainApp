namespace WebAppDBHandler.DatabaseContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class POPULATION_MALE
    {
        [Key]
        public int PM_ID { get; set; }

        public int PM_COUNTRY_ID { get; set; }

        public int PM_YEAR { get; set; }

        public int? PM_MAX_AGE { get; set; }

        public int? PM_AGE_FLAG { get; set; }

        public decimal? PM_POPULATION_MALE { get; set; }

        public virtual COUNTRy COUNTRy { get; set; }
    }
}
