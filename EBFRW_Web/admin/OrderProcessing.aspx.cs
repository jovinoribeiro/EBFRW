using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace EBFRW_Web.admin
{
    public partial class OrderProcessing : System.Web.UI.Page
    {
        Controller controller = new Controller();

        protected void Page_Load(object sender, EventArgs e)
        {
            String userAuthenticated = (String)Session["userAuthenticated"];

            //Boolean userAuthenticated = (Boolean)Session["userAuthenticated"];
            if (userAuthenticated == null || !Boolean.Parse(userAuthenticated))
            {
                Session["goto"] = "memorders";
                Response.Redirect("~/admin/AdminLogin.aspx");
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    loadAllOrders();
                }
            }
            
        }

        private void loadAllOrders()
        {
            this.GridView1.DataSource = controller.getAllOrders(); //flipDataSet(controller.getAllOrders());
            this.GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(Object sender, GridViewDeleteEventArgs e)
        {
            TableCell cell = GridView1.Rows[e.RowIndex].Cells[1];

            //Message.Text = "Test: " + cell.Text;

            controller.removeOrder(cell.Text);

            loadAllOrders();


        }
    }
}