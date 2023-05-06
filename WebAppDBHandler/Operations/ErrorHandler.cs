using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebAppDBHandler.Operations
{
    public class ErrorHandler
    {
        
        public static void WriteErrorInDB(Exception ex)
        {
            string errorMessage = ex.Message;
            string stackTrace = ex.StackTrace;
            DateTime errorTime = DateTime.Now;

            string connectionString = ConfigurationManager.ConnectionStrings["DWHContext"].ToString();
            string sql = "INSERT INTO errorLog ([ReferenceDate], [ErrorMessage],stackTrace) VALUES (@errorTime, @errorMessage, @stackTrace)";
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@errorMessage", errorMessage);
                cmd.Parameters.AddWithValue("@stackTrace", stackTrace);
                cmd.Parameters.AddWithValue("@errorTime", errorTime);

                con.Open();
                cmd.ExecuteNonQuery();
            }            
        }
        
    }
        
}
