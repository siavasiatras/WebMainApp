namespace WebAppDBHandler.DatabaseContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class MORTALITY_LIFE_EXPECTANCY_MALE
    {
        [Key]
        public int MLEM_ID { get; set; }

        public int MLEM_COUNTRY_ID { get; set; }

        public int MLEM_YEAR { get; set; }

        public decimal? MLEM_INFANT_MORTALITY_MALE { get; set; }

        public decimal? MLEM_LIFE_EXPECTANCY_MALE { get; set; }

        public decimal? MLEM_MORTALITY_RATE_1TO4_MALE { get; set; }

        public decimal? MLEM_MORTALITY_RATE_UNDER5_MALE { get; set; }

        public virtual COUNTRy COUNTRy { get; set; }
    }
}
