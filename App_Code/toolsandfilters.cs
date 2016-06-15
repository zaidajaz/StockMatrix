using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for toolsandfilters
/// </summary>
public class toolsandfilters
{
    public static String convertToK(Double amt)
    {
        if (amt > 100000)
        {
            return (amt / 100000).ToString() + "L";
        }
        if (amt > 1000)
        {
            return (amt / 1000).ToString() + "K";
        }
        return amt.ToString();
    }
}