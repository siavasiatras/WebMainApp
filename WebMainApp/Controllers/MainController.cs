using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services;
using WebAppDBHandler.DatabaseContext;
using WebAppDBHandler.Helpers;
using WebMainApp.Helpers;

namespace WebMainApp.Controllers
{
    public class MainController : Controller
    {
        public ActionResult Index()
        {
            try
            {
                var countriesList = MainHelper.GetCountries();
                var columnsToChartIndex = MainHelper.GetColumns();
                var yearsList = MainHelper.GetYears();
                ViewBag.columnsToChartIndex = columnsToChartIndex;
                ViewBag.yearsList = yearsList;
                return View(countriesList);
            }
            catch (Exception ex)
            {
                ErrorHandlerHelper.WriteErrorInDB(ex);
                throw ex;
            }
        }


        //[HttpPost]
        public ActionResult ChartsView(FormCollection form)
        {
            try
            {
                //string AgreegateFunction = "";//if we have a disabled dropdown the value of the defualt option dont come here
                //string CountriesList = "";//if we have a disabled dropdown the value of the defualt option dont come here
                //if (form.Get("AgreegateFunction") == null) { AgreegateFunction = "none"; } else { AgreegateFunction = form.Get("AgreegateFunction"); }
                //if (form.Get("CountriesList") == null) { CountriesList = "none"; } else { CountriesList = form.Get("CountriesList"); }
                var submittedDataString = "/TypeOfChart/" + form.Get("TypeOfChart") + "/CountriesList/" + DisabledDropdownValueHandler.GetDisabledDropdownValue(form.Get("CountriesList")) + "/columnIndexes/" + form.Get("columnIndexes")
                    + "/AgreegateFunction/" + DisabledDropdownValueHandler.GetDisabledDropdownValue(form.Get("AgreegateFunction"))
                    + "/ChooseYear/" + form.Get("ChooseYear")
                    + "/ChoosingGroups/" + form.Get("ChoosingGroups")
                    + "/YearAggregation/" + form.Get("YearAggregation");
                System.Diagnostics.Debug.WriteLine(submittedDataString);
                //var indexesByCountry = MainHelper.GetIndexesByCountry(submittedDataString);
                ViewBag.chartType = form.Get("TypeOfChart");
                
                var chartDetails = MainHelper.GetChartDetails(submittedDataString);
                ViewBag.DataPoints = chartDetails;
                string dataPointsJson = JsonConvert.SerializeObject(chartDetails);
                ViewBag.DataPointsJson = dataPointsJson;
                return View();
            }
            catch (Exception ex)
            {
                ErrorHandlerHelper.WriteErrorInDB(ex);
                throw ex;
            }
        }
        
    }
}