using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace EBFRW_Web
{
    public partial class PrideRun : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // DateTime now = DateTime.Now;
            //now = new DateTime(2011, 10, 7, 19, 59, 59, 00);
            
            //EBFRW closing date
            //DateTime closeDate = new DateTime(2012, 10, 11, 23, 59, 59);
            
            //Active closing date
            //DateTime activeCloseDate = new DateTime(2011, 10, 6, 23, 59, 59);

            //if it has passed the closing date, display closed message
            /*if (now >= closeDate)
            {
                this.regLabel.Visible = false;
                this.regLabel.Text = "<br><br>Our online Registration is now closed. <br>You can still register on Saturday (10/13) morning at the race before 8:30AM. See you there!";
                this.regbutton.Visible = false;
            }
            /*else if (now >= activeCloseDate)
            {
                //Hide all the information relative eto active.com
                this.active1.Visible = false;
                this.active2.Visible = false;
                this.active3.Visible = false;
                this.active4.Visible = false;
                this.active5.Visible = false;
                this.active6.Visible = false;
                regLabel.Text = "To register, click on the following:"; 
            }    */        
        }
    }
}