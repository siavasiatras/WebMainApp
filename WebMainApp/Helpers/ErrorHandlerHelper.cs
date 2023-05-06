using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebAppDBHandler.Operations;

namespace WebMainApp.Helpers
{
    public class ErrorHandlerHelper
    {
        public static void WriteErrorInDB(Exception ex)
        {
            ErrorHandler.WriteErrorInDB(ex);
        }

    }
}