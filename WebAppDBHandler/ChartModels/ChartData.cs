using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebAppDBHandler.Helpers
{
    public class ChartData
    {
        public string type { get; set; }
        public string name { get; set; }

        public string showInLegend = "true";
        public List<DataPointWithX> dataPoints { get; set; }

    }
}
