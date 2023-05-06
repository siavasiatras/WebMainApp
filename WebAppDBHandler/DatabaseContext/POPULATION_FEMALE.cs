namespace WebAppDBHandler.DatabaseContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class POPULATION_FEMALE
    {
        [Key]
        public int PF_ID { get; set; }

        public int PF_COUNTRY_ID { get; set; }

        public int PF_YEAR { get; set; }

        public int? PF_MAX_AGE { get; set; }

        public int? PF_AGE_FLAG { get; set; }

        public decimal? PF_POPULATION_FEMALE { get; set; }

        public virtual COUNTRy COUNTRy { get; set; }
    }
}
