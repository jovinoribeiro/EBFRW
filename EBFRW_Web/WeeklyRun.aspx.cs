using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EBFRW_Web;

/*
 * This class controls the weekly runs
 * It automatically generates the next run and location
 */
public partial class Schedule : System.Web.UI.Page
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
    protected string currentLocation = "oakland";

    protected void Page_Load(object sender, EventArgs e)
    {
        displayNextRunsOnTable();
    }

    /*
     * Creates the table with next run highligted. It displays up to 3 months of "future races" schedule
     */
    protected void displayNextRunsOnTable()
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
        
        //Create a new table..to be added to outer table
        Table inTable = new Table();
        TableRow outRow = new TableRow();
        TableHeaderCell inTHC = new TableHeaderCell();
        TableHeaderRow inTHR = new TableHeaderRow();
        inTHC.Text = DATE_HEADER;
        inTHR.Cells.Add(inTHC);

        inTHR.Style.Add("background-color", TABLE_HEADER_BACKGROUND_COLOR);
        inTHR.ForeColor = System.Drawing.Color.White;
        //inTable.GridLines = GridLines.Horizontal;
        inTable.CellPadding = 10;

         TableHeaderCell inTHC1 = new TableHeaderCell();
        TableHeaderRow inTHR1 = new TableHeaderRow();
        inTHC1.Text = LOCATION_HEADER;
        inTHR.Cells.Add(inTHC1);
        inTable.Rows.Add(inTHR);

        int counter = 0;

        //Runs for as long as the range of dates is not reached
        while (holderTime > nextRunDate)
        {
            //we rolled into a new month
            if (tempMonth != nextRunDate.Month)
            {
                weekNumber = 1;
                tempMonth = nextRunDate.Month;
                //add a month title
  
                inTable.GridLines = GridLines.Both;
                TableCell outCell = new TableCell();
                outCell.VerticalAlign = VerticalAlign.Top;

                //add things to outside table...
                outCell.Controls.Add(inTable);

                outRow.Cells.Add(outCell);
                runOutterTable.Rows.Add(outRow);

                if (counter == 3)
                {
                    outRow = new TableRow();
                    counter = 0;
                }
                
                 inTable = new Table();
                 inTHC = new TableHeaderCell();
                 inTHR = new TableHeaderRow();
                 inTHC.Text = DATE_HEADER;
                inTHR.Cells.Add(inTHC);

                inTHR.Style.Add("background-color", TABLE_HEADER_BACKGROUND_COLOR);
                inTHR.ForeColor = System.Drawing.Color.White;
                inTable.CellPadding = 10;

                 inTHC1 = new TableHeaderCell();
                 inTHR1 = new TableHeaderRow();
                 inTHC1.Text = LOCATION_HEADER;
                inTHR.Cells.Add(inTHC1);

                inTable.Rows.Add(inTHR);

                counter++;
            } //end if

            if (counter == 3)
            {
                outRow = new TableRow(); 
                counter = 0;
            }

            TableRow row = new TableRow();
            TableCell dateCell = new TableCell();
            TableCell locationCell = new TableCell();

            dateCell.Text = nextRunDate.ToShortDateString();
            WeeklyRun wr = this.getNextLocation(weekNumber, nextRunDate);
            locationCell.Text = wr.RunName; 
            row.Cells.Add(dateCell);
            row.Cells.Add(locationCell);

            if (today.Day.Equals(nextRunDate.Day) && today.Month.Equals(nextRunDate.Month))
            {
                //Set the background to blue
                row.Style.Add("background-color", NEXT_RUN_BACKGROUND_COLOR);

                //Save the location for weather forecast
                this.currentLocation = wr.RunCity; 

                //reset tables - it will hide the directions
                this.resetDisplayTables();

                //display it accordingly
                this.enableDirection(wr); 
            }
   
            inTable.Rows.Add(row);

            weekNumber++;
            //increase the date by a week
            nextRunDate = nextRunDate.Date.AddDays(7);
        }
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

    /**
     * User selected a direction to see; make that available
     */
    protected void displayUserSelectedDirections(int venueSelected)
    {
        //Resets every direction to false, so it is not displayed   
        resetDisplayTables();

        //Index are determined in the aspx page
        /*switch (venueSelected)
        {
            case 1: this.Alameda.Visible = true; break;
            case 2: this.LakeMerrit.Visible = true; break;
            case 3: this.Emeryville.Visible = true; break;
            case 4: this.StrawberryCanyon.Visible = true; break;
            case 5: this.SanLeandro.Visible = true; break;
            case 6: this.LakeChabot.Visible = true; break;
            case 7: this.Lafayette.Visible = true; break;
        }*/
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

    /*
     * Triggered when user selects a value from drop down list containing options for run directions
     */
    protected void OtherDirections_OnSelectedIndexChanged(Object sender, EventArgs e)
    {
       // this.displayUserSelectedDirections(Int32.Parse(this.Directions_List.SelectedValue));
    }

}