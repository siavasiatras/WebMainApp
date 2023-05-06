namespace WebAppDBHandler.DatabaseContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class MORTALITY_LIFE_EXPECTANCY
    {
        [Key]
        public int MLE_ID { get; set; }

        public int MLE_COUNTRY_ID { get; set; }

        public int MLE_YEAR { get; set; }

        public decimal? MLE_INFANT_MORTALITY { get; set; }

        public decimal? MLE_LIFE_EXPECTANCY { get; set; }

        public decimal? MLE_MORTALITY_RATE_1TO4 { get; set; }

        public decimal? MLE_MORTALITY_RATE_UNDER5 { get; set; }

        public virtual COUNTRy COUNTRy { get; set; }
    }
}
