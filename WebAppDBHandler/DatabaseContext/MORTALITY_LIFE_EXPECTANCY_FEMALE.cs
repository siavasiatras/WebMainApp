namespace WebAppDBHandler.DatabaseContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class MORTALITY_LIFE_EXPECTANCY_FEMALE
    {
        [Key]
        public int MLEF_ID { get; set; }

        public int MLEF_COUNTRY_ID { get; set; }

        public int MLEF_YEAR { get; set; }

        public decimal? MLEF_INFANT_MORTALITY_FEMALE { get; set; }

        public decimal? MLEF_LIFE_EXPECTANCY_FEMALE { get; set; }

        public decimal? MLEF_MORTALITY_RATE_1TO4_FEMALE { get; set; }

        public decimal? MLEF_MORTALITY_RATE_UNDER5_FEMALE { get; set; }

        public virtual COUNTRy COUNTRy { get; set; }
    }
}
