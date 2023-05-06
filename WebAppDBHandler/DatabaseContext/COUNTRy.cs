namespace WebAppDBHandler.DatabaseContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("COUNTRIES")]
    public partial class COUNTRy
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public COUNTRy()
        {
            FERTILITY_RATES_ON_PERIOD = new HashSet<FERTILITY_RATES_ON_PERIOD>();
            INDEXES_BY_COUNTRY = new HashSet<INDEXES_BY_COUNTRY>();
            MORTALITY_LIFE_EXPECTANCY = new HashSet<MORTALITY_LIFE_EXPECTANCY>();
            MORTALITY_LIFE_EXPECTANCY_FEMALE = new HashSet<MORTALITY_LIFE_EXPECTANCY_FEMALE>();
            MORTALITY_LIFE_EXPECTANCY_MALE = new HashSet<MORTALITY_LIFE_EXPECTANCY_MALE>();
            POPULATION_DEMOGRAPHIC_RATES_GENERAL = new HashSet<POPULATION_DEMOGRAPHIC_RATES_GENERAL>();
            POPULATION_FEMALE = new HashSet<POPULATION_FEMALE>();
            POPULATION_MALE = new HashSet<POPULATION_MALE>();
            POPULATION_MIDYAER_ON_PERIOD = new HashSet<POPULATION_MIDYAER_ON_PERIOD>();
            POPULATION_MIDYEAR_ON_PERIOD_FEMALE = new HashSet<POPULATION_MIDYEAR_ON_PERIOD_FEMALE>();
            POPULATION_MIDYEAR_ON_PERIOD_MALE = new HashSet<POPULATION_MIDYEAR_ON_PERIOD_MALE>();
        }

        [Key]
        public int COUNTRY_ID { get; set; }

        [StringLength(2)]
        public string C_ISO { get; set; }

        [StringLength(3)]
        public string C_ISO3 { get; set; }

        public short? C_ISO_CODE { get; set; }

        [StringLength(2)]
        public string C_FIPS { get; set; }

        [StringLength(50)]
        public string C_DISPLAY_NAME { get; set; }

        [StringLength(100)]
        public string C_OFFICIAL_NAME { get; set; }

        [StringLength(50)]
        public string C_CAPITAL { get; set; }

        [StringLength(50)]
        public string C_CONTINENT { get; set; }

        [StringLength(50)]
        public string C_CURRENCYCODE { get; set; }

        [StringLength(50)]
        public string C_CURRENCYNAME { get; set; }

        [StringLength(50)]
        public string C_PHONE { get; set; }

        public byte? C_REGION_CODE { get; set; }

        [StringLength(50)]
        public string C_REGION_NAME { get; set; }

        public short? C_SUB_REGION_CODE { get; set; }

        [StringLength(50)]
        public string C_SUB_REGION_NAME { get; set; }

        public short? C_INTERMEDIATE_REGION_CODE { get; set; }

        [StringLength(50)]
        public string C_INTERMEDIATE_REGION_NAME { get; set; }

        [StringLength(50)]
        public string C_STATUS { get; set; }

        [StringLength(50)]
        public string C_DEVELOPED_OR_DEVELOPING { get; set; }

        public bool? C_SMALL_ISLAND_DEVELOPING_STATES_SIDS { get; set; }

        public bool? C_LAND_LOCKED_DEVELOPING_COUNTRIES_LLDC { get; set; }

        public bool? C_LEAST_DEVELOPED_COUNTRIES_LDC { get; set; }

        public decimal? C_AREA_SQKM { get; set; }

        public int? C_POPULATION { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FERTILITY_RATES_ON_PERIOD> FERTILITY_RATES_ON_PERIOD { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<INDEXES_BY_COUNTRY> INDEXES_BY_COUNTRY { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MORTALITY_LIFE_EXPECTANCY> MORTALITY_LIFE_EXPECTANCY { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MORTALITY_LIFE_EXPECTANCY_FEMALE> MORTALITY_LIFE_EXPECTANCY_FEMALE { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MORTALITY_LIFE_EXPECTANCY_MALE> MORTALITY_LIFE_EXPECTANCY_MALE { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<POPULATION_DEMOGRAPHIC_RATES_GENERAL> POPULATION_DEMOGRAPHIC_RATES_GENERAL { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<POPULATION_FEMALE> POPULATION_FEMALE { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<POPULATION_MALE> POPULATION_MALE { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<POPULATION_MIDYAER_ON_PERIOD> POPULATION_MIDYAER_ON_PERIOD { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<POPULATION_MIDYEAR_ON_PERIOD_FEMALE> POPULATION_MIDYEAR_ON_PERIOD_FEMALE { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<POPULATION_MIDYEAR_ON_PERIOD_MALE> POPULATION_MIDYEAR_ON_PERIOD_MALE { get; set; }
    }
}
