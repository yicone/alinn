using System;
using System.Collections.Generic;
using System.Text;

using System.Globalization;
namespace HOT.Common
{
    public class Date
    {
        public Date()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }
        /// <summary>
        /// 判断是否是闰年
        /// powered By FZF 20060602
        /// </summary>
        /// <param name="year"></param>
        /// <returns></returns>
        public static bool IsLeapYear(int year)
        {
            if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 取得指定年指定月的天数
        /// Powered By FZF 20080602
        /// </summary>
        /// <param name="year"></param>
        /// <param name="month"></param>
        /// <returns></returns>
        public static int GetMonthDaysCount(int year, int month)
        {
            if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
            {
                return 31;
            }
            if (month == 4 || month == 6 || month == 9 || month == 11)
            {
                return 30;
            }
            if (month == 2 && IsLeapYear(year))
            {
                return 29;
            }
            else
            {
                return 28;
            }
        }
        public static int GetDay(DateTime dateTime, int days)
        {
            int year = dateTime.Year;
            int month = dateTime.Month;
            int day = dateTime.Day;
            int num=0;
            int monthDaysCount=GetMonthDaysCount(year,month);
            if(day+days>monthDaysCount)
            {
                num=day+days-monthDaysCount;
            }
            if (day + days < 0)
            { 
                num=GetMonthDaysCount(year,month-1)+day+days;
            }
            if(day+days>=0&&day+days<=monthDaysCount)
            {
                num = day + days;
            }
            return num;
        }
    }
}
