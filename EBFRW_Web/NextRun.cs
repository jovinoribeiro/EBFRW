using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EBFRW_Web
{
    public class NextRun
    {

        // Default run day - saturday...
        private const String WEEK_DAY_OF_RUN = "Saturday";
        //Representaion of a Saturday = 7
        private const int WEEK_DAY_OF_RUN_INT = 7;
        //HEIGHT of google maps
        protected const int HEIGHT = 394;
        //WIDTH of google maps
        protected const int WIDTH = 700;
        //Holds the number of months in the future for calendar to be printed
        private const int MAX_NUMBER_OF_MONTHS = 2;
        //Background color of next run
        private const string NEXT_RUN_BACKGROUND_COLOR = "#3BB9FF";
        //Background color of table header
        private const string TABLE_HEADER_BACKGROUND_COLOR = "#507CD1";
        //Table Header name
        private const string DATE_HEADER = "Date";
        //Table Locaiton name
        private const string LOCATION_HEADER = "Location";
        //APRIL
        private const int APRIL = 4;
        //OCTOBER
        private const int OCTOBER = 10;

        //Holds current city location for weather forecast. default is Oakland
        protected string currentLocation = "oakland1";

        protected WeeklyRun currentLocationRun = WeeklyRun.LAKE_MERRIT;


        /*
         * Creates the table with next run highligted. It displays up to 3 months of "future races" schedule
         */
        public WeeklyRun displayNextRunsOnTable()
        {
            //1. today's date
            DateTime today = DateTime.Now;
            //today = new DateTime(2013, 11, 20);
            //myDate = new DateTime(2012, 6, 15);

            //2. derive next saturdays' date from today
            DateTime nextRunDate = new DateTime(today.Year, today.Month, 1);

            //holder date - used to control how for in the future print schedule
            DateTime holderTime = nextRunDate;
            holderTime = holderTime.Date.AddMonths(MAX_NUMBER_OF_MONTHS);

            //Check if today is a Saturday. If so, today is the day of the run and there is nothing to be done.
            //Otherwise, move the day up to next Saturday
            if (!(this.isTheRunToday(today)))
            {
                int dayOfWeek = this.getDayOfWeekInt(today);
                //shift days of week until Saturday
                today = today.Date.AddDays(7 - dayOfWeek);
            }

            //Check if 1st day of month is a Saturday. If so, today is the day of the run and there is nothign to be done
            //Otherwise, move the day up to Next Saturday
            if (!(this.isTheRunToday(nextRunDate)))
            {
                int dayOfWeek = this.getDayOfWeekInt(nextRunDate);
                //shift days of week until Saturday
                nextRunDate = nextRunDate.Date.AddDays(7 - dayOfWeek);
            }

            int weekNumber = 1;

            //Used to keep track of when we are starting a new month
            int tempMonth = nextRunDate.Month;

            int counter = 0;

            //Runs for as long as the range of dates is not reached
            while (holderTime > nextRunDate)
            {
                //we rolled into a new month
                if (tempMonth != nextRunDate.Month)
                {
                    weekNumber = 1;
                    tempMonth = nextRunDate.Month;

                    counter++;
                } //end if

                if (counter == 3)
                {
                    counter = 0;
                }
                WeeklyRun wr = this.getNextLocation(weekNumber, nextRunDate);
                if (today.Day.Equals(nextRunDate.Day) && today.Month.Equals(nextRunDate.Month))
                {
                    //Save the location for weather forecast
                    this.currentLocation = wr.RunName;
                    currentLocationRun = wr;
                }

                weekNumber++;
                //increase the date by a week
                nextRunDate = nextRunDate.Date.AddDays(7);
            }

            return currentLocationRun;//currentLocation; //.ToString();
        }

        /*
     * Resets every direction to false, so it is not displayed   
     */
        private void resetDisplayTables()
        {
            /*this.Alameda.Visible = false;
            this.LakeMerrit.Visible = false;
            this.Emeryville.Visible = false;
            this.StrawberryCanyon.Visible = false;
            this.SanLeandro.Visible = false;
            this.LakeChabot.Visible = false;
            this.Lafayette.Visible = false;*/
        }



        /*
         * Get the next loation
         * @weekNumber the number of week in the month
         * @curDate date used to determine if we are in dry season or not
         */
        protected WeeklyRun getNextLocation(int weekNumber, DateTime inDate)
        {
            switch (weekNumber)
            {
                case 1:
                    return WeeklyRun.ALAMEDA; //"Bay Farm Island/Alameda";
                case 2:
                    return WeeklyRun.LAKE_MERRIT; //"Lake Merrit/Oakland";
                case 3:
                    return WeeklyRun.EMERYVILLE; //"Emeryville Marina";
                case 4:
                    if (!isDrySeason(inDate))
                    {
                        return WeeklyRun.SAN_LEANDRO; // "San Leandro Marina";
                    }
                    else
                    {
                        return WeeklyRun.STRAWBERRY_CANYON; //"Strawberry Canyon/Berkeley";
                    }
                case 5:
                    return WeeklyRun.LAKE_CHABOT; //LAFAYETE; //"Lake Chabot Marina/Castro Valley";
                default:
                    return WeeklyRun.NOT_DETERMINED; //"Location Not determined";
            }
        }

        /*
         * Makes the directions visible
         */
        protected void enableDirection(WeeklyRun run)
        {
            /*if (run == WeeklyRun.ALAMEDA)
                this.Alameda.Visible = true;
            else if (run == WeeklyRun.LAKE_MERRIT)
                this.LakeMerrit.Visible = true;
            else if (run == WeeklyRun.EMERYVILLE)
                this.Emeryville.Visible = true;
            else if (run == WeeklyRun.SAN_LEANDRO)
                this.SanLeandro.Visible = true;
            else if (run == WeeklyRun.STRAWBERRY_CANYON)
                this.StrawberryCanyon.Visible = true;
            else if (run == WeeklyRun.LAFAYETE)
                this.Lafayette_WC.Visible = true;
            else if (run == WeeklyRun.LAKE_CHABOT)
                this.LakeChabot.Visible = true; */

        }

        /*
         * Returns the corresponding day of the week of a given date 
         */
        protected int getDayOfWeekInt(DateTime myDate)
        {
            String myDay = myDate.DayOfWeek.ToString();
            switch (myDay)
            {
                case "Sunday": return 1;
                case "Monday": return 2;
                case "Tuesday": return 3;
                case "Wednesday": return 4;
                case "Thursday": return 5;
                case "Friday": return 6;
                case "Saturday": return 7;
                default: return 7;
            }
        }

        /*
         * Check if a given date is the same as next schedule run
         */
        protected Boolean isTheRunToday(DateTime myDate)
        {
            if (myDate.DayOfWeek.ToString().Equals(WEEK_DAY_OF_RUN))
            {
                return true;
            }
            return false;
        }

        /*
         * Check if we are in dry season...between months of APRIL and OCTOBER
         */
        protected Boolean isDrySeason(DateTime myDate)
        {
            if (myDate.Month >= APRIL && myDate.Month <= OCTOBER)
                return true;
            else
                return false;
        }





    }
}