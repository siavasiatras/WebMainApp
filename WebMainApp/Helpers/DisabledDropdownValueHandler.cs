using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebMainApp.Helpers
{
    public class DisabledDropdownValueHandler
    {
        public static string GetDisabledDropdownValue(string formValue)
        {
            string valueToReturn;
            if (formValue == null)
            {
                valueToReturn = "none";
            }
            else 
            { 
                valueToReturn = formValue; 
            }
            return valueToReturn;
        }
    }
}