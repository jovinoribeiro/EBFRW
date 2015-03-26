using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EBFRW_Web
{
    public partial class index : System.Web.UI.Page
    {
        Schedule sc = new Schedule();
        Controller controller = new Controller();
        NextRun nr = new NextRun();
            
        protected void Page_Load(object sender, EventArgs e)
        {
            //If user is admin, make Admin Tools link visible
            if (User.Identity.Name.Equals("admin"))
            {
               // LinkButton adminToolLinkButton = (LinkButton) this.FindControl("adminToolLinkButton");
               // adminToolLinkButton.Visible = true;
            }

            WeeklyRun wr = nr.displayNextRunsOnTable();

            this.nextRun.Text = wr.RunName;//nr.displayNextRunsOnTable();
                //controller.getNextRun();
            this.nextRunLink.NavigateUrl = "WeeklyRun.aspx"+wr.RunTab;
        }

        /*
         * Triggered when the "Admin Tools" link is selected. Takes user to Admin Tools
         */
        protected void onAdminToolsSelected(object sender, CommandEventArgs e)
        {
            Response.Redirect("~/admin/AdminTool.aspx");
        }
    }
}