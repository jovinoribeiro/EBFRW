using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EBFRW_Web.admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(Object sender,
                           EventArgs e)

        {
            string userId = this.name.Text;
            string password = this.password.Text;

            if (userId.Equals("admin") && password.Equals("hello"))
            {
                Session["userAuthenticated"] = "true";
                String nextSt = (String)Session["goto"];
                if (nextSt == null)
                    nextSt = "";

                if (nextSt.Equals("memorders"))
                {
                    Response.Redirect("~/admin/OrderProcessing.aspx");
                } else if(nextSt.Equals("members")) {
                    Response.Redirect("~/admin/Members.aspx");
                } else {
                    Response.Redirect("~/admin/PrideRunOrders.aspx");
                }
            }
            else
            {
                Session["userAuthenticated"] = "false";
            }
        }
    }
}