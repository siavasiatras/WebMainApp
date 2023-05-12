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
                //gia to slect me tis stiles
                ViewBag.columnsToChartIndex = columnsToChartIndex;
                //gia to select me ta xronia
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
                var submittedDataString = "/TypeOfChart/" + form.Get("TypeOfChart") + "/CountriesList/" + DisabledDropdownValueHandler.GetDisabledDropdownValue(form.Get("CountriesList")) + "/columnIndexes/" + form.Get("columnIndexes")
                    + "/AgreegateFunction/" + DisabledDropdownValueHandler.GetDisabledDropdownValue(form.Get("AgreegateFunction"))
                    + "/ChooseYear/" + DisabledDropdownValueHandler.GetDisabledDropdownValue(form.Get("ChooseYear"))
                    + "/ChoosingGroups/" + DisabledDropdownValueHandler.GetDisabledDropdownValue(form.Get("ChoosingGroups"))
                    + "/YearAggregation/" + DisabledDropdownValueHandler.GetDisabledDropdownValue(form.Get("YearAggregation"));
                System.Diagnostics.Debug.WriteLine(submittedDataString);
                
                var chartDetails = MainHelper.GetChartDetails(submittedDataString);
                
                string dataPointsJson = JsonConvert.SerializeObject(chartDetails); //MainHelper.GetChartData(submittedDataString);//JsonConvert.SerializeObject(chartDetails);
                ViewBag.DataPointsJson = dataPointsJson;
                ViewBag.chartType = form.Get("TypeOfChart");
                ViewBag.chartTitle = "Chart of " + form.Get("columnIndexes");                
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