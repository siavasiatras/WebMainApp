using Newtonsoft.Json;
using System;
using System.Collections.Generic;
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

        public static List<ChartData> GetIndexesByCountry(String submittedDataString)
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
                string columnChartListJson = JsonConvert.SerializeObject(columnChartList);
                return columnChartList;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<ChartData> GetChartDetails(String submittedDataString)
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

        public static string GetChartData(String submittedDataString)
        {
            try
            {
                string stringChartData = "";
                stringChartData = Functionality.GetChartData(submittedDataString);
                return  stringChartData;
            }
            catch (Exception)
            {

                throw;
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