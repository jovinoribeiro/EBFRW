using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EBFRW_Web.admin
{
    public partial class DonationsEditor : System.Web.UI.Page
    {
        Controller controller = new Controller();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated || !User.Identity.Name.Equals("admin"))
            {
                Response.Redirect("~/Account/Login.aspx?ReturnUrl=~/admin/DonationsEditor.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    //EventEditorFormView.Visible = true;
                    rebind();
                    updateTotalDonation();
                    //rebindForm(-1);
                    //EventEditorFormView.Height = 50;
                }
            }
        }

        private void updateTotalDonation()
        {
            this.totalDonationLbl.Text += " " + controller.getTotalDonation();
        }

        private void rebind()
        {
            this.donationsGV.DataSource = controller.getAllDonations();
            this.donationsGV.DataBind();
        }
    }
}