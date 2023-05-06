using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebAppDBHandler.DatabaseContext;
using WebAppDBHandler.Helpers;
using WebAppDBHandler.Operations;

namespace WebMainApp.Helpers
{
    public class MainHelper
    {
        public static List<COUNTRy> GetCountries()
        {
			try
			{
				var countriesList = Functionality.GetCountries();
				return countriesList;
			}
			catch (Exception ex)
			{
				throw ex;
			}
        }

        public static List<DataPointIntegerX> GetIndexesByCountry(String submittedDataString)
        {
            try
            {
                var indexesByCountry = Functionality.GetChartDetails(submittedDataString);
                return indexesByCountry;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<ColumnsToChartIndex> GetColumns() 
        {
            try
            {
                var columnChartList = Functionality.GetColumns();
                //string columnChartListJson = JsonConvert.SerializeObject(columnChartList);
                return columnChartList;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<DataPointIntegerX> GetChartDetails(String submittedDataString)
        {
            try
            {
                var dataList = Functionality.GetChartDetails(submittedDataString);                
                return dataList;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<DataPointStringX> GetChartDetailsString(String submittedDataString)
        {
            try
            {
                var dataList = Functionality.GetChartDetailsString(submittedDataString);
                return dataList;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<Years> GetYears()
        {
            try
            {
                var dataList = Functionality.GetYears();
                return dataList;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}