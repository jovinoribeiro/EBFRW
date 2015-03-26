using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Membership : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        initMembershipPlanList();
    }

    private void initMembershipPlanList()
    {
        //remove 4, 5, 6, 7
        DateTime now = DateTime.Now;
        //now = new DateTime(2015, 12, 1, 0, 0, 0);

        //Early Bird
        DateTime earlyBirdEnd = new DateTime(2014, 1, 18, 23, 59, 59);
        DateTime earlyBirdStart = new DateTime(2013, 12, 23);

        int thisyear = now.Year;
        DateTime fullPriceStartDate = new DateTime(thisyear, 12, 1);
        //endofyear = endofyear.AddDays(-1);

        //Set when end of year is
        //endofyear = endofyear.AddDays(-1);
        
        //early Bird is in play - comment this out if early bird has not been set up yet
        //endofyear = earlyBirdStart;

        DateTime halfPriceStartDate = new DateTime(thisyear, 7, 1);

        //Hold prices
        String individual;
        String household;
        String senior_student_individual;
        String senior_student_household;
         //check if we are in the period where half year is to be offered
        if (now >= halfPriceStartDate && now < fullPriceStartDate)
        {
            individual = "12";
            household = "18";
            senior_student_individual = "10";
            senior_student_household = "15";
        }
        else if (now <= earlyBirdEnd)
        {
            individual = "20";
            household = "30";
            senior_student_individual = "15";
            senior_student_household = "15";
        }
        //only offer full membership
        else
        {
            individual = "24";
            household = "36";
            senior_student_individual = "20";
            senior_student_household = "30";
        }

        this.individual.Text = individual;
        this.household.Text = household;
        this.senior_student_individual.Text = senior_student_individual;
        this.senior_student_household.Text = senior_student_household;


    }
}