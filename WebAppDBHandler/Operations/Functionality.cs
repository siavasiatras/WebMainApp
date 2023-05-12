using System;
using System.Collections.Generic;
using System.Linq;
using WebAppDBHandler.DatabaseContext;
using WebAppDBHandler.Helpers;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace WebAppDBHandler.Operations
{
    public class Functionality
    {
        private static object chartData;

        public static List<COUNTRy> GetCountries()
        {
            try
            {
                using (var dbContext = new DWHContext())
                {
                    var countriesList = dbContext.COUNTRIES.ToList();
                    return countriesList;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static List<ColumnsToChartIndex> GetColumns()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DWHContext"].ToString());
            SqlCommand cmd = new SqlCommand("DWH.rpt.GetColumnNames", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = cmd;
            DataTable dataList = new DataTable();
            adapter.Fill(dataList);

            List<ColumnsToChartIndex> columnList = new List<ColumnsToChartIndex>();

            foreach (DataRow row in dataList.Rows)
            {
                ColumnsToChartIndex chartDetails = new ColumnsToChartIndex();
                chartDetails.databaseColumnName = Convert.ToString(row[0]);
                chartDetails.columnName = Convert.ToString(row[1]);

                columnList.Add(chartDetails);
            }
            con.Close();
            return (columnList);
        }

        public static List<ChartData> GetChartDetails(String submittedDataString)
        {
            try
            {
                if (submittedDataString == null) { submittedDataString = ""; }
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DWHContext"].ToString());
                SqlCommand cmd = new SqlCommand("DWH.rpt.ProduceResults", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@string", SqlDbType.VarChar, 1000) { Value = submittedDataString });
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                
                List<ChartData> chartDataList = new List<ChartData>();
                foreach (DataRow row in dataTable.Rows)
                {

                    
                    DataPointWithX dataPoint = new DataPointWithX();
                    string type = row[0].ToString();
                    string name = Convert.ToString(row[1]);
                    dataPoint.x = Convert.ToInt32(row[2]);
                    dataPoint.y = Convert.ToDecimal(row[3]);
                    
                    ChartData chartData = chartDataList.Find(c => c.type == type && c.name == name);

                    if (chartData == null)
                    {
                        chartData = new ChartData { type = type, name = name, dataPoints = new List<DataPointWithX>() };
                        chartDataList.Add(chartData);
                    }


                    chartData.dataPoints.Add(dataPoint);                
                }
                

                con.Close();

                return chartDataList;
            }
            catch (Exception ex)
            {
                ErrorHandler.WriteErrorInDB(ex);
                throw ex;
            }
            
        }                

        public static string GetChartData(String submittedDataString)
        {
            try
            {
                if (submittedDataString == null) { submittedDataString = ""; }
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DWHContext"].ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand("DWH.rpt.ProduceResults", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@string", SqlDbType.VarChar, 1000) { Value = submittedDataString });
                
                string result = "";
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        result = reader.GetString(0);
                    }
                }
                con.Close();

                return result;
            }
            catch (Exception ex)
            {
                ErrorHandler.WriteErrorInDB(ex);
                throw ex;
            }

        }
        

        public static List<Years> GetYears()
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DWHContext"].ToString());
                SqlCommand cmd = new SqlCommand(";WITH AgeDiff AS (\r\nselect distinct convert(varchar(3),PMOP_STARTING_AGE)  +'-'+ convert(varchar(3),PMOP_ENDING_AGE) as AGE_DIFF from POPULATION_MIDYAER_ON_PERIOD where PMOP_COUNTRY_ID =1 \r\n)\r\nselect  a.AGE_DIFF from AgeDiff a\r\norder by convert(int,substring(AGE_DIFF ,1,charindex('-',AGE_DIFF)-1))", con);
                cmd.CommandType = System.Data.CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                DataTable dataList = new DataTable();
                adapter.Fill(dataList);

                List<Years> columnList = new List<Years>();

                foreach (DataRow row in dataList.Rows)
                {
                    Years chartDetails = new Years();
                    chartDetails.yearDiff = Convert.ToString(row[0]);

                    columnList.Add(chartDetails);
                }
                con.Close();
                return (columnList);
            }
            catch (Exception ex)
            {
                ErrorHandler.WriteErrorInDB(ex);
                throw ex; 
            }
            
        }
    }
}
