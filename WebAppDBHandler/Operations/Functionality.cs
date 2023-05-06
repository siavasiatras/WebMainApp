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

        public static List<DataPointIntegerX> GetChartDetails(String submittedDataString)
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

                List<DataPointIntegerX> dataList = new List<DataPointIntegerX>();

                foreach (DataRow row in dataTable.Rows)
                {
                    DataPointIntegerX chartDetails = new DataPointIntegerX();
                    chartDetails.x = Convert.ToInt32(row[0]);
                    chartDetails.y = Convert.ToDouble(row[1]);
                    chartDetails.label = Convert.ToString(row[2]);
                    dataList.Add(chartDetails);
                }
                con.Close();

                return dataList;
            }
            catch (Exception ex)
            {
                ErrorHandler.WriteErrorInDB(ex);
                throw ex;
            }
            
        }

        public static List<DataPointStringX> GetChartDetailsString(String submittedDataString)
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

            List<DataPointStringX> dataList = new List<DataPointStringX>();

            foreach (DataRow row in dataTable.Rows)
            {
                DataPointStringX chartDetails = new DataPointStringX();
                chartDetails.x = Convert.ToString(row[0]);
                chartDetails.y = Convert.ToDouble(row[1]);
                //chartDetails.lablel = Convert.ToString(row[2]);
                dataList.Add(chartDetails);
            }
            con.Close();
            return dataList;
        }

        public static List<Years> GetYears()
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DWHContext"].ToString());
                SqlCommand cmd = new SqlCommand("with cte as( select distinct a.FROP_YEAR from [dbo].[FERTILITY_RATES_ON_PERIOD]  a ) select FROP_YEAR as [year] from cte order by FROP_YEAR", con);
                cmd.CommandType = System.Data.CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                DataTable dataList = new DataTable();
                adapter.Fill(dataList);

                List<Years> columnList = new List<Years>();

                foreach (DataRow row in dataList.Rows)
                {
                    Years chartDetails = new Years();
                    chartDetails.year = Convert.ToInt32(row[0]);

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
