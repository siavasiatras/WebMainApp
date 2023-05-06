using Newtonsoft.Json;
using System;
using System.Web.Mvc;
using System.Web.Services;
using WebAppDBHandler.Helpers;
using WebMainApp.Helpers;

namespace WebMainApp.Controllers
{
    public class ChartController : Controller
    {
        // GET: Chart
        public ActionResult Index()
        {
            
            return View();
        }

        
        public ActionResult GetChartDetails(String submittedDataString)
        {
            try
            {
                var chartDetails = MainHelper.GetChartDetails(submittedDataString);
                string dataPointsJson = JsonConvert.SerializeObject(chartDetails);

                // Pass the JSON string to the view
                ViewBag.DataPointsJson = dataPointsJson;
                return PartialView();//chartDetails.Select(t => new { x = t.IBC_YEAR.ToString() , y = t.IBC_GDP_PER_CAPITA.ToString() }).ToList());//View(chartDetails);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}